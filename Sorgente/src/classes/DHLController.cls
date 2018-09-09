global class DHLController  {
    /*
    URL Production(PROD): https://xmlpi-ea.dhl.com/XMLShippingServlet
 	URL Test(TEST): https://xmlpitest-ea.dhl.com/XMLShippingServlet
    Siteid: sorgentesrl
    Password: Ip9GE4RdKo
	*/
    static final String Endpoint = 'https://xmlpi-ea.dhl.com/XMLShippingServlet';
    static final String Siteid = 'sorgentesrl';
    static final String Password = 'Ip9GE4RdKo';
    
    static final Set<String> ShippingCodes = new Set<String>(new List<String> { 'N','1','I' });

    webservice static String getDeliveryDate(DateTime targetDate, String postalCode, String city, String country, Boolean requireExpress12){
        if(targetDate < Datetime.now() )
            return '{"err":"La data di spedizione è passata" }';
            // : trg= ' + targetDate.format('dd-MM-yyyy') + ', now=' + Datetime.now().format('dd-MM-yyyy') + '" }';
        try {
            DateTime refDate = Datetime.now().hour() > 12 ? Datetime.now().addDays(1) : Datetime.now(); 
        	List<Shipment> shipments = getShippingOptions(targetDate, postalCode, city, country, requireExpress12);
            for(Shipment s : shipments){            
                if(s.PickupDate.daysBetween(refDate.date()) <= 0){
                    return '{"deliverydate":"'+ DateTime.newInstance(s.DeliveryDate, Time.newInstance(10, 0, 0, 0)).format('yyyy-MM-dd\'T\'hh:mm:ss' )+'"}';
                }
            }
            if(requireExpress12){
                return '{"err":"Non è possibile spedire con Express 12"}';
            }
     		return '{"err":"Non è possibile spedire nella data indicata. Provare a verificare il CAP e/o modificare la data di spedizione."}';
        } catch (Exception e){
            return '{err:"Invalid response : "' + e.getMessage() + '}'; // Escape
        }
    }
    // Element names must be in correct order
    webservice static String getShippingDate(DateTime targetDate, String postalCode, String city, String country, Boolean requireExpress12){
        if(targetDate < Datetime.now() )
            return '{"err":"La data di ricezione desiderata non è futura:trg= ' + targetDate.format('dd-MM-yyyy') + ', now=' + Datetime.now().format('dd-MM-yyyy') + '"}';
        try {
            DateTime refDate = Datetime.now().hour() > 12 ? Datetime.now().addDays(1) : Datetime.now(); 
            integer min = 0;
            integer max = refDate.date().daysBetween(targetDate.date()); 
            integer curr = 0;
            
            while(max >= min && curr >= min && curr <= max){
                List<Shipment> shipments = getShippingOptions(refDate, postalCode, city, country, requireExpress12);
                integer db = DaysBetween(shipments, targetDate); 
                // null-> error, 0-> ok, >0: too Early, add those days to refDate, <0: too late, substract and see if still possible
                // null-> no shippings this date, try earlier (should mark invalid?), curr--
                if(db==null){
                    curr--;
                    refDate = refDate.addDays(-1);
                    continue;
                }
                // 0 -> found
                if(db==0){
                    if(refDate.format('u') == '6' ||  refDate.format('u') == '7'){
                        return '{"err":"Spedizione possibile solo nel fine settimana per la data di ricezione indicata"}';
                    }
                    for(Shipment s : shipments){
                        if(s.DeliveryDate.daysBetween(targetDate.date()) == 0){
                            // have also delivery method...
                            // use pickup date instead (datetime with cutoff)
                            return '{"shippingdate":"'+ DateTime.newInstance(s.PickupDate, Time.newInstance(10, 0, 0, 0)).format('yyyy-MM-dd\'T\'hh:mm:ss' )+'"}';
                        }
                    }
                    // should never get here!!
                    throw new MyException('Though I\'d found a valid shipping date, but it disappeared');
                }
                // >0 -> min = curr, curr+=db, if curr>max -> not found
                if(db>0){
                    min = curr;
                    curr+=db;
                } else {
                    // <0 -> max = curr, curr+=db, if curr<min -> not found
                    max = curr;
                    curr-=db;
                }
                refDate = refDate.addDays(db); 
            }
            if(requireExpress12){
                return '{"err":"Nessuna spedizione possibile con Express 12 per la data di ricezione indicata"}';
            }
            return '{"err":"Nessuna spedizione possibile per la data di ricezione indicata. Provare a verificare il CAP e/o modificare la data di ricezione."}';
        	// return JSON.serialize(shipments);            
        } catch (Exception e){
            return '{err:"Invalid response : "' + e.getMessage() + '}'; // Escape
        }
    }
    
    private static Integer DaysBetween(List<Shipment> shipments, DateTime targetDate){
        if(shipments==null || shipments.size()<=0) return null;
        integer res = null;
        for(Shipment s : shipments){
            if(res == null || Math.abs(res) > Math.abs(s.DeliveryDate.daysBetween(targetDate.date()))) res = s.DeliveryDate.daysBetween(targetDate.date());
        }        
        return res;
    }
    
    private static List<Shipment> getShippingOptions(DateTime targetDate, String postalCode, String city, String country, Boolean requireExpress12){
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setHeader('content-type', 'text/xml');
        req.setEndpoint(Endpoint);
        req.setMethod('GET');
        
        Dom.Document body = new Dom.Document();
        Dom.XmlNode docel = body.createRootElement('DCTRequest', 'http://www.dhl.com', 'p');
        Dom.XmlNode gc = docel.addChildElement('GetCapability', null, null);
        Dom.XmlNode sh = gc.addChildElement('Request', null, null).addChildElement('ServiceHeader', null, null);
        sh.addChildElement('SiteID', null, null).addTextNode(SiteId);
        sh.addChildElement('Password', null, null).addTextNode(Password);
        // sh.addChildElement('MessageTime', null, null).addTextNode(DateTime.now().format('yyyy-MM-dd\'T\'HH:mm:ss.SSSXXX'));

        Dom.XmlNode frm = gc.addChildElement('From', null, null);
        frm.addChildElement('CountryCode', null, null).addTextNode('IT');
        frm.addChildElement('Postalcode', null, null).addTextNode('20127');
        
        Dom.XmlNode bkg = gc.addChildElement('BkgDetails', null, null);
        bkg.addChildElement('PaymentCountryCode', null, null).addTextNode('IT');
        // reason about targetDate (addDays...)
        bkg.addChildElement('Date', null, null).addTextNode(targetDate.format('yyyy-MM-dd'));
        bkg.addChildElement('ReadyTime', null, null).addTextNode('PT12H00M');
        bkg.addChildElement('DimensionUnit', null, null).addTextNode('CM');
        bkg.addChildElement('WeightUnit', null, null).addTextNode('KG');
        
		Dom.XmlNode pieces = bkg.addChildElement('Pieces', null, null);
        // loop through pieces (parto 1, 2, 3, 4)
        Dom.XmlNode piece = pieces.addChildElement('Piece', null, null);
        piece.addChildElement('PieceID', null, null).addTextNode('1');
        piece.addChildElement('Height', null, null).addTextNode('24');
        piece.addChildElement('Depth', null, null).addTextNode('23');
        piece.addChildElement('Width', null, null).addTextNode('35');
        piece.addChildElement('Weight', null, null).addTextNode('4.1');

        bkg.addChildElement('IsDutiable', null, null).addTextNode('N'); // Really??
        bkg.addChildElement('NetworkTypeCode', null, null).addTextNode('AL');
        if(requireExpress12){
            Dom.XmlNode qtdShp = bkg.addChildElement('QtdShp', null, null);
            qtdShp.addChildElement('GlobalProductCode', null, null).addTextNode('1');
        }
            
        Dom.XmlNode to = gc.addChildElement('To', null, null);
        to.addChildElement('CountryCode', null, null).addTextNode(country);
        if(String.isNotBlank(postalCode)){
        	to.addChildElement('Postalcode', null, null).addTextNode(postalCode);
        } 
        if(String.isNotBlank(city)){
        	to.addChildElement('City', null, null).addTextNode(city);
        } 
        /*
        Dom.XmlNode dutiable = gc.addChildElement('Dutiable', null, null);
        dutiable.addChildElement('DeclaredCurrency', null, null).addTextNode('EUR');
        dutiable.addChildElement('DeclaredValue', null, null).addTextNode('195.0');
     	*/
        req.setBodyDocument(body);
		Dom.Document doc = null;
        if (Test.isRunningTest()) {
            doc = new Dom.Document();
            doc.load('<?xml version="1.0" encoding="UTF-8" standalone="no"?><res:DCTResponse xmlns:res="http://www.dhl.com" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation= "http://www.dhl.com DCT-Response.xsd">'+
    '<GetCapabilityResponse><Response><ServiceHeader><MessageTime>2016-06-06T18:20:32.813+01:00</MessageTime><SiteID>sorgentesrl</SiteID></ServiceHeader></Response>'+
'        <BkgDetails>' +
'            <OriginServiceArea>' +
'                <FacilityCode>ERD</FacilityCode>' +
'                <ServiceAreaCode>MIL</ServiceAreaCode>' +
'            </OriginServiceArea>' +
'            <DestinationServiceArea>' +
'                <FacilityCode>ASD</FacilityCode>' +
'                <ServiceAreaCode>TRN</ServiceAreaCode>' +
'            </DestinationServiceArea>' +
'            <QtdShp>' +
'                <GlobalProductCode>C</GlobalProductCode>' +
'                <LocalProductCode>M</LocalProductCode>' +
'                <ProductShortName>MEDICAL EXPRESS</ProductShortName>' +
'                <LocalProductName>MEDICAL EXPRESS</LocalProductName>' +
'                <NetworkTypeCode>TD</NetworkTypeCode>' +
'                <POfferedCustAgreement>Y</POfferedCustAgreement>' +
'                <TransInd>N</TransInd>' +
'                <PickupDate>2016-06-09</PickupDate>' +
'                <PickupCutoffTime>PT18H</PickupCutoffTime>' +
'                <BookingTime>PT17H</BookingTime>' +
'                <TotalTransitDays>1</TotalTransitDays>' +
'                <PickupPostalLocAddDays>0</PickupPostalLocAddDays>' +
'                <DeliveryPostalLocAddDays>0</DeliveryPostalLocAddDays>' +
'                <PickupNonDHLCourierCode> </PickupNonDHLCourierCode>' +
'                <DeliveryNonDHLCourierCode> </DeliveryNonDHLCourierCode>' +
'                <DeliveryDate>2016-06-10</DeliveryDate>' +
'                <DeliveryTime>PT12H</DeliveryTime>' +
'                <DimensionalWeight>10.000</DimensionalWeight>' +
'                <WeightUnit>KG</WeightUnit>' +
'                <PickupDayOfWeekNum>4</PickupDayOfWeekNum>' +
'                <DestinationDayOfWeekNum>5</DestinationDayOfWeekNum>' +
'            </QtdShp>' +
'            <QtdShp>' +
'                <GlobalProductCode>1</GlobalProductCode>' +
'                <LocalProductCode>1</LocalProductCode>' +
'                <ProductShortName>EXPRESS DOMESTIC 12:00</ProductShortName>' +
'                <LocalProductName>EXPRESS DOMESTIC 12:00</LocalProductName>' +
'                <NetworkTypeCode>TD</NetworkTypeCode>' +
'                <POfferedCustAgreement>N</POfferedCustAgreement>' +
'                <TransInd>Y</TransInd>' +
'                <PickupDate>2016-06-09</PickupDate>' +
'                <PickupCutoffTime>PT18H</PickupCutoffTime>' +
'                <BookingTime>PT17H</BookingTime>' +
'                <TotalTransitDays>1</TotalTransitDays>' +
'                <PickupPostalLocAddDays>0</PickupPostalLocAddDays>' +
'                <DeliveryPostalLocAddDays>0</DeliveryPostalLocAddDays>' +
'                <PickupNonDHLCourierCode> </PickupNonDHLCourierCode>' +
'                <DeliveryNonDHLCourierCode> </DeliveryNonDHLCourierCode>' +
'                <DeliveryDate>2016-06-10</DeliveryDate>' +
'                <DeliveryTime>PT12H</DeliveryTime>' +
'                <DimensionalWeight>10.000</DimensionalWeight>' +
'                <WeightUnit>KG</WeightUnit>' +
'                <PickupDayOfWeekNum>4</PickupDayOfWeekNum>' +
'                <DestinationDayOfWeekNum>5</DestinationDayOfWeekNum>' +
'            </QtdShp>' +
'            <QtdShp>' +
'                <GlobalProductCode>N</GlobalProductCode>' +
'                <LocalProductCode>N</LocalProductCode>' +
'                <ProductShortName>EXPRESS DOMESTIC</ProductShortName>' +
'                <LocalProductName>EXPRESS DOMESTIC</LocalProductName>' +
'                <NetworkTypeCode>TD</NetworkTypeCode>' +
'                <POfferedCustAgreement>N</POfferedCustAgreement>' +
'                <TransInd>Y</TransInd>' +
'                <PickupDate>2016-06-09</PickupDate>' +
'                <PickupCutoffTime>PT18H</PickupCutoffTime>' +
'                <BookingTime>PT17H</BookingTime>' +
'                <TotalTransitDays>1</TotalTransitDays>' +
'                <PickupPostalLocAddDays>0</PickupPostalLocAddDays>' +
'                <DeliveryPostalLocAddDays>0</DeliveryPostalLocAddDays>' +
'                <PickupNonDHLCourierCode> </PickupNonDHLCourierCode>' +
'                <DeliveryNonDHLCourierCode> </DeliveryNonDHLCourierCode>' +
'                <DeliveryDate>2016-06-10</DeliveryDate>' +
'                <DeliveryTime>PT23H59M</DeliveryTime>' +
'                <DimensionalWeight>10.000</DimensionalWeight>' +
'                <WeightUnit>KG</WeightUnit>' +
'                <PickupDayOfWeekNum>4</PickupDayOfWeekNum>' +
'                <DestinationDayOfWeekNum>5</DestinationDayOfWeekNum>' +
'            </QtdShp>' +
'            <QtdShp>' +
'                <GlobalProductCode>7</GlobalProductCode>' +
'                <LocalProductCode>7</LocalProductCode>' +
'                <ProductShortName>EXPRESS EASY</ProductShortName>' +
'                <LocalProductName>EXPRESS EASY</LocalProductName>' +
'                <NetworkTypeCode>TD</NetworkTypeCode>' +
'                <POfferedCustAgreement>Y</POfferedCustAgreement>' +
'                <TransInd>N</TransInd>' +
'                <PickupDate>2016-06-09</PickupDate>' +
'                <PickupCutoffTime>PT18H</PickupCutoffTime>' +
'                <BookingTime>PT17H</BookingTime>' +
'                <TotalTransitDays>1</TotalTransitDays>' +
'                <PickupPostalLocAddDays>0</PickupPostalLocAddDays>' +
'                <DeliveryPostalLocAddDays>0</DeliveryPostalLocAddDays>' +
'                <PickupNonDHLCourierCode> </PickupNonDHLCourierCode>' +
'                <DeliveryNonDHLCourierCode> </DeliveryNonDHLCourierCode>' +
'                <DeliveryDate>2016-06-10</DeliveryDate>' +
'                <DeliveryTime>PT23H59M</DeliveryTime>' +
'                <DimensionalWeight>10.000</DimensionalWeight>' +
'                <WeightUnit>KG</WeightUnit>' +
'                <PickupDayOfWeekNum>4</PickupDayOfWeekNum>' +
'                <DestinationDayOfWeekNum>5</DestinationDayOfWeekNum>' +
'            </QtdShp>' +
'        </BkgDetails>' +
'        <Srvs>' +
'            <Srv>' +
'                <GlobalProductCode>C</GlobalProductCode>' +
'                <MrkSrv>' +
'                    <LocalProductCode>M</LocalProductCode>' +
'                    <ProductShortName>MEDICAL EXPRESS</ProductShortName>' +
'                    <LocalProductName>MEDICAL EXPRESS</LocalProductName>' +
'                    <NetworkTypeCode>TD</NetworkTypeCode>' +
'                    <POfferedCustAgreement>Y</POfferedCustAgreement>' +
'                    <TransInd>N</TransInd>' +
'                </MrkSrv>' +
'            </Srv>' +
'            <Srv>' +
'                <GlobalProductCode>1</GlobalProductCode>' +
'                <MrkSrv>' +
'                    <LocalProductCode>1</LocalProductCode>' +
'                    <ProductShortName>EXPRESS DOMESTIC 12:00</ProductShortName>' +
'                    <LocalProductName>EXPRESS DOMESTIC 12:00</LocalProductName>' +
'                    <NetworkTypeCode>TD</NetworkTypeCode>' +
'                    <POfferedCustAgreement>N</POfferedCustAgreement>' +
'                    <TransInd>Y</TransInd>' +
'                </MrkSrv>' +
'            </Srv>' +
'            <Srv>' +
'                <GlobalProductCode>N</GlobalProductCode>' +
'                <MrkSrv>' +
'                    <LocalProductCode>N</LocalProductCode>' +
'                    <ProductShortName>EXPRESS DOMESTIC</ProductShortName>' +
'                    <LocalProductName>EXPRESS DOMESTIC</LocalProductName>' +
'                    <NetworkTypeCode>TD</NetworkTypeCode>' +
'                    <POfferedCustAgreement>N</POfferedCustAgreement>' +
'                    <TransInd>Y</TransInd>' +
'                </MrkSrv>' +
'            </Srv>' +
'            <Srv>' +
'                <GlobalProductCode>7</GlobalProductCode>' +
'                <MrkSrv>' +
'                    <LocalProductCode>7</LocalProductCode>' +
'                    <ProductShortName>EXPRESS EASY</ProductShortName>' +
'                    <LocalProductName>EXPRESS EASY</LocalProductName>' +
'                    <NetworkTypeCode>TD</NetworkTypeCode>' +
'                    <POfferedCustAgreement>Y</POfferedCustAgreement>' +
'                    <TransInd>N</TransInd>' +
'                </MrkSrv>' +
'            </Srv>' +
'        </Srvs>' +
'    </GetCapabilityResponse>' +
'</res:DCTResponse>');
        } else {
        	HttpResponse res = h.send(req);
            doc = res.getBodyDocument();
        }
        Dom.XmlNode el = doc.getRootElement(); //.getChildElement('DCTResponse', 'http://www.dhl.com');
        if(el.getName().compareTo('ErrorResponse') == 0){
         	// seek message errors
         	/* <res:ErrorResponse xmlns:res='http://www.dhl.com' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xsi:schemaLocation= 'http://www.dhl.com err-res.xsd'>
                <Response>
                    <ServiceHeader>
                        <MessageTime>2016-06-01T13:53:31+01:00</MessageTime>
                        <SiteID>sorgentesrl</SiteID>
                        <Password>sorgentesrl</Password>
                    </ServiceHeader>
                    <Status>
                        <ActionStatus>Error</ActionStatus>
                        <Condition>
                            <ConditionCode>111</ConditionCode>
                            <ConditionData>Error in parsing request XML:Error:
                                Datatype error: In element &apos;CountryCode&apos; :
                                Value &apos;UTAHT&apos; with length &apos;5&apos; is
                                not equal to length facet &apos;2&apos;.. at line
                                11, column 40</ConditionData>
                        </Condition>
                    </Status>
                </Response>
            </res:ErrorResponse>
			*/
            throw new MyException('DHL returned error');
        } // Else -> DCTResponse

		List<Shipment> shipments = getShippings(el);
        if(shipments==null){
        	throw new MyException('Invalid response format');
        }
        return shipments;
    }

    private static List<Shipment> getShippings(Dom.XmlNode el){
        // gets nodes named DCTResponse xmlns:res='http://www.dhl.com' > GetCapabilityResponse > BkgDetails > QtdShp [GlobalProductCode/text() in ['N', '1', 'i']]

        if(el==null) return null;
        el = el.getChildElement('GetCapabilityResponse', null);
        if(el==null) return null;
        el = el.getChildElement('BkgDetails', null);
        if(el==null) return null;
        
        List<Shipment> res = new List<Shipment>();
        for(Dom.XmlNode ch: el.getChildElements()){
            if(ch.getName().compareTo('QtdShp')!=0) continue;
            Dom.XmlNode n = ch.getChildElement('GlobalProductCode', null);
            if(n==null) continue;
            if(!ShippingCodes.contains(n.getText())) continue;
            Shipment s = new Shipment(); 
            s.GlobalProductCode =  n.getText();
            s.LocalProductName =  ch.getChildElement('LocalProductName', null).getText();
            s.TotalTransitDays = Integer.valueOf(ch.getChildElement('TotalTransitDays', null).getText());
            List<string> dparts = ch.getChildElement('DeliveryDate', null).getText().split('-');
            s.DeliveryDate = date.parse(dparts[2] + '/' + dparts[1] + '/' + dparts[0]);
            dparts = ch.getChildElement('PickupDate', null).getText().split('-');
            s.PickupDate = date.parse(dparts[2] + '/' + dparts[1] + '/' + dparts[0]);
            
            res.add(s);
        }
        
        return res;
    }
    
    public class Shipment {
        public string GlobalProductCode;
        public string LocalProductName;
        public integer TotalTransitDays;
        public date DeliveryDate;
        public date PickupDate;
		//...        
    }
    
    public class MyException extends Exception{}
    
    public class TrackingResult {
        public integer StatusCode;
        public string StatusMessage;
        public datetime ShipmentDate;
        public datetime DeliveryDate;
    }
    
    public static TrackingResult getTracking(string awb){
        TrackingResult tres = new TrackingResult();
        tres.StatusCode = 0;
        tres.StatusMessage = '';

        try{
            Http h = new Http();
            HttpRequest req = new HttpRequest();
            req.setHeader('content-type', 'text/xml');
            req.setEndpoint(Endpoint);
            req.setMethod('GET');
            
            Dom.Document body = new Dom.Document();
            Dom.XmlNode docel = body.createRootElement('KnownTrackingRequest', 'http://www.dhl.com', 'req');
            Dom.XmlNode sh = docel.addChildElement('Request', null, null).addChildElement('ServiceHeader', null, null);
            sh.addChildElement('SiteID', null, null).addTextNode(SiteId);
            sh.addChildElement('Password', null, null).addTextNode(Password);
            docel.addChildElement('LanguageCode', null, null).addTextNode('en');
            docel.addChildElement('AWBNumber', null, null).addTextNode(awb);
            docel.addChildElement('LevelOfDetails', null, null).addTextNode('LAST_CHECK_POINT_ONLY');
            docel.addChildElement('PiecesEnabled', null, null).addTextNode('S');
    
            req.setBodyDocument(body);
            Dom.Document doc = null;
            if (Test.isRunningTest()) {
            	doc = new Dom.Document();
                doc.load('<?xml version="1.0" encoding="UTF-8" standalone="no"?><res:DCTResponse xmlns:res="http://www.dhl.com" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation= "http://www.dhl.com DCT-Response.xsd">'+
                '<AWBInfo>' +
                    '<Status>' + 
                         '<ActionStatus>success</ActionStatus>' + 
                         '<Condition>'+
                         	'<ConditionCode>1</ConditionCode>' + 
                         	'<ConditionData>Test condition</ConditionData>' + 
                         '</Condition>' + 
                         '<ShipmentInfo>' +
                         	'<ShipmentDate>2017-01-01T12:00:00</ShipmentDate>' + 
                         	'<ShipmentEvent>' +
                         		'<ServiceEvent>' + 
                                    '<EventCode>OK</EventCode>' + 
                                    '<Description>Test description</Description>' +
                                    '<Date>2017-01-01</Date>' +
                                    '<Time>12:00:00</Time>' +
                         		'</ServiceEvent>' + 
                            '</ShipmentEvent>' + 
                         '</ShipmentInfo>' + 
                	'</Status>' + 
                '</AWBInfo></res:DCTResponse>');
            } else {
            	HttpResponse res = h.send(req);
                doc = res.getBodyDocument();
            }
            Dom.XmlNode el = doc.getRootElement();        
            
            // status: AWBInfo/Status/ActionStatus  (success)
    
            Dom.XmlNode statusNode = el.getChildElement('AWBInfo', null).getChildElement('Status', null);
            String status = statusNode.getChildElement('ActionStatus', null).getText();
            if(status !='success'){
                tres.StatusCode = Integer.valueOf(statusNode.getChildElement('Condition', null).getChildElement('ConditionCode', null).getText());
                tres.StatusMessage = statusNode.getChildElement('Condition', null).getChildElement('ConditionData', null).getText();
                return tres;
            }
            // shipment date: AWBInfo/ShipmentInfo/ShipmentDate 
            string shipmentDate = el.getChildElement('AWBInfo', null).getChildElement('ShipmentInfo', null).getChildElement('ShipmentDate', null).getText();
            tres.ShipmentDate = datetime.valueOf(shipmentDate.replace('T', ' '));
            
            // shipment: AWBInfo/ShipmentInfo/ShipmentEvent  (Date, Time) -> ServiceEvent (EventCode (OK?), Description)
			Dom.XmlNode eventNode = el.getChildElement('AWBInfo', null).getChildElement('ShipmentInfo', null).getChildElement('ShipmentEvent', null);
            string eventCode = eventNode.getChildElement('ServiceEvent', null).getChildElement('EventCode', null).getText();
            if(eventCode!='OK'){
                tres.StatusCode = 1;  /* Ok AWB, but still not delivered */
                tres.StatusMessage = eventNode.getChildElement('ServiceEvent', null).getChildElement('Description', null).getText();
                return tres;
            }  
            string deliveryDate = eventNode.getChildElement('Date', null).getText() + ' ' + eventNode.getChildElement('Time', null).getText();
            tres.DeliveryDate = datetime.valueOf(deliveryDate);
            
        } catch (Exception e){
            tres.StatusCode = -1;
            tres.StatusMessage = e.getMessage();
            return tres;
        }
        return tres;
    }
}