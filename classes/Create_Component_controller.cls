public with sharing class Create_Component_controller {

    @AuraEnabled public static list<CerificateHolerWrp> cerificateHolerWrpList { get; set; }
    @AuraEnabled public static list<CerificateHolerWrp> cerificateHolerWrpListSec { get; set; }// on second email page
    @AuraEnabled public static list<EmailTemp> EmailTemplateList { get; set; }
    public static list<CanaryAMS__Certificate_Holder_Connection__c> certificateHolderList;

    public static blob acordPdfBody { get; set; } // to preview PDF on page

    public Create_Component_controller() {
        system.debug('constructor run');
        OpenPdfFromDownloadLink();

    }

    @AuraEnabled
    public static list<CerificateHolerWrp> getCertificateHolders(String recId) {////get All Certificates holder for the current Master record
        try {
            certificateHolderList = new list<CanaryAMS__Certificate_Holder_Connection__c>();
            System.debug('master certificate ID' + recId);
            cerificateHolerWrpList = new list<CerificateHolerWrp>();
            certificateHolderList = [
                    select Start_Date__c,Name,id,CanaryAMS__Certificate_Holder__r.Name,
                            CanaryAMS__Project_Description__c,CanaryAMS__Certificate_Holder__r.CanaryAMS__Contact__r.Name,
                            CanaryAMS__Certificate_Holder__r.CanaryAMS__Contact__r.email,
                            CanaryAMS__Certificate_Holder__r.CanaryAMS__Address_1__c,
                            CanaryAMS__Certificate_Holder__r.CanaryAMS__Address_2__c,
                            CanaryAMS__Certificate_Holder__r.CanaryAMS__City__c,
                            CanaryAMS__Certificate_Holder__r.CanaryAMS__State__c,
                            CanaryAMS__Certificate_Holder__r.CanaryAMS__Zip_Postal_Code__c,
                            CanaryAMS__Certificate_Holder__r.CanaryAMS__Contact__r.Phone,
                            CanaryAMS__Certificate_Holder__r.CanaryAMS__Contact__r.Fax,
                            End_Date__c,selected__c
                    //CanaryAMS__Certificate_Holder__r.CanaryAMS__Contact__r.Email
                    from CanaryAMS__Certificate_Holder_Connection__c
                    where CanaryAMS__Certificate_of_Insurance__c = :recId
                    limit 1500/**/];
            System.debug('certificateHolderList size->'+certificateHolderList.size());
            
            System.debug('cerificateHolerWrpList size->'+cerificateHolerWrpList.size());
            
            /*Map for approved pdfs*/

                            Map<String, long> Holder_Approved=new Map<String, long>();
                    set<Id> Holder_set=new set<Id>();
                    for(CanaryAMS__Certificate_Holder_Connection__c c:certificateHolderList){
                    Holder_set.add(c.Id);
                    }
                    system.debug('Holder_set'+Holder_set);
                    list<CanaryAMS__Accord_PDF__c> Accord_PDF_list=new list<CanaryAMS__Accord_PDF__c>();
                    Accord_PDF_list=[select CanaryAMS__Certificate_Holder_Connection__c, Approved__c from CanaryAMS__Accord_PDF__c where Approved__c=true and CanaryAMS__Certificate_Holder_Connection__c IN:Holder_set limit 1500
            ];

            System.debug('Accord_PDF_list->' + Accord_PDF_list);
            System.debug('Accord_PDF_list->' + Accord_PDF_list.size());

            for (CanaryAMS__Accord_PDF__c a : Accord_PDF_list) {
                if (!Holder_Approved.containsKey(String.valueOf(a.CanaryAMS__Certificate_Holder_Connection__c))) {
                    Holder_Approved.put(a.CanaryAMS__Certificate_Holder_Connection__c, 1);
                }

                else {
                    system.debug('in else ');
                    long l = Holder_Approved.get(String.valueOf(a.CanaryAMS__Certificate_Holder_Connection__c)) + 1;
                    Holder_Approved.put(a.CanaryAMS__Certificate_Holder_Connection__c, l);
                }
            }
            system.debug('Holder_Approved->' + Holder_Approved);
            for (CanaryAMS__Certificate_Holder_Connection__c c : certificateHolderList) {
                if (!Holder_Approved.containsKey(c.Id)) {
                    Holder_Approved.put(String.valueOf(c.id), 0);
                }
            }

            system.debug('Holder_Approved1->' + Holder_Approved);
            /*Map for approved pdfs*/

            if (certificateHolderList.size() > 0) {
                System.debug('added');
                for (CanaryAMS__Certificate_Holder_Connection__c cer : certificateHolderList) {
                    Holder_Approved.get(cer.id + '$$->' + String.valueOf(cer.Id));
                    cerificateHolerWrpList.add(new CerificateHolerWrp(cer, cer.Selected__c, Holder_Approved.get(String.valueOf(cer.Id))));
                    //system.debug('selected== '+);
                }
            }
            System.debug('cerificateHolerWrpList->' + cerificateHolerWrpList);
            System.debug('cons certificateHolderList->' + certificateHolderList);
            return cerificateHolerWrpList;
        } catch (Exception e) {
            System.debug('Create_Component_controller get Exception on line number->' + e.getLineNumber() + 'error is->' + e.getMessage());
            return null;
        }
    }

    @AuraEnabled
    public static list<CerificateHolerWrp> SelectedHoldersq(list<String> HoldersList) {////getSelectedHolders
        try {
            System.debug('CanaryAMS__Certificate_Holder_Connection__c->' + HoldersList);

            list<CanaryAMS__Certificate_Holder_Connection__c> FinalHolderList = new list<CanaryAMS__Certificate_Holder_Connection__c>();
            FinalHolderList = [select Selected__c,Name,id,CanaryAMS__Certificate_Holder__r.Name,CanaryAMS__Project_Description__c,CanaryAMS__Certificate_Holder__r.CanaryAMS__Contact__r.Name,CanaryAMS__Certificate_Holder__r.CanaryAMS__Contact__r.email from CanaryAMS__Certificate_Holder_Connection__c where ID IN:HoldersList limit 1500];
            System.debug('FinalHolderList->' + FinalHolderList);

            cerificateHolerWrpListSec = new list<CerificateHolerWrp>();
            Map<String, long> Holder_Approved = new Map<String, long>();
            set<Id> Holder_set = new set<Id>();
            for (CanaryAMS__Certificate_Holder_Connection__c c : FinalHolderList) {
                Holder_set.add(c.Id);
            }
            system.debug('Holder_set' + Holder_set);
            list<CanaryAMS__Accord_PDF__c> Accord_PDF_list = new list<CanaryAMS__Accord_PDF__c>();
            Accord_PDF_list = [select CanaryAMS__Certificate_Holder_Connection__c,Approved__c from CanaryAMS__Accord_PDF__c where Approved__c = true and CanaryAMS__Certificate_Holder_Connection__c IN:Holder_set limit 1500];

            System.debug('Accord_PDF_list->' + Accord_PDF_list);
            System.debug('Accord_PDF_list->' + Accord_PDF_list.size());

            for (CanaryAMS__Accord_PDF__c a : Accord_PDF_list) {
                if (!Holder_Approved.containsKey(String.valueOf(a.CanaryAMS__Certificate_Holder_Connection__c))) {
                    Holder_Approved.put(a.CanaryAMS__Certificate_Holder_Connection__c, 1);
                }

                else {
                    system.debug('in else ');
                    long l = Holder_Approved.get(String.valueOf(a.CanaryAMS__Certificate_Holder_Connection__c)) + 1;
                    Holder_Approved.put(a.CanaryAMS__Certificate_Holder_Connection__c, l);
                }
            }
            system.debug('Holder_Approved->' + Holder_Approved);
            for (CanaryAMS__Certificate_Holder_Connection__c c : FinalHolderList) {
                if (!Holder_Approved.containsKey(c.Id)) {
                    Holder_Approved.put(String.valueOf(c.id), 0);
                }
            }

            system.debug('Holder_Approved1->' + Holder_Approved);
            /*Map for approved pdfs*/

            if (FinalHolderList.size() > 0) {
                System.debug('added');
                for (CanaryAMS__Certificate_Holder_Connection__c cer : FinalHolderList) {
                    Holder_Approved.get(cer.id + '$$->' + String.valueOf(cer.Id));
                    cerificateHolerWrpListSec.add(new CerificateHolerWrp(cer, cer.Selected__c, Holder_Approved.get(String.valueOf(cer.Id))));
                    //system.debug('selected== '+);
                }
            }
            System.debug('FinalHolderList->' + FinalHolderList);
            System.debug('cerificateHolerWrpList->' + cerificateHolerWrpListSec);

            return cerificateHolerWrpListSec;
            // return FinalHolderList;

        } catch (Exception e) {
            System.debug('get exception on line number->' + e.getLineNumber() + 'beacuse	' + e.getMessage());
            return null;
        }

    }

    @AuraEnabled
    public static list<EmailTemp> FetchEmailTemplates() {//// fetching all lightning Email templates for the Connection Holder
        try {
            EmailTemplateList = new list<EmailTemp>();
            list<EmailTemplate> elist = new list<EmailTemplate>();
            if (!Test.isRunningTest()) {
                // elist=[select name,id,UIType,EntityType from EmailTemplate where  UIType=:'2' and EntityType='003'/* and name=:'!!'*/];
                elist = [select name,id,UIType,RelatedEntityType from EmailTemplate where UIType = :'2' and RelatedEntityType = 'CanaryAMS__Certificate_Holder__c'];
                system.debug('elist->' + elist);
            } else if (Test.isRunningTest()) {
                elist = [select name,id,UIType from EmailTemplate];
            }
            system.debug('elist->' + elist);
            for (EmailTemplate e : elist) {
                EmailTemplateList.add(new EmailTemp(e));
            }
            System.debug('EmailTemplateList->' + EmailTemplateList);
            return EmailTemplateList;
        } catch (Exception e) {
            System.debug('Create_Component_controller get exception on line number->' + e.getLineNUmber() + ' error is->' + e.getMessage());
            return null;
        }
    }

    @AuraEnabled
    public static boolean fetchSelectedTemp(String name, list<String> ConnectionIds, list<String> UnselectedIds) {//// fetch the selected template . and send in email
        //fetchSelectedTemp2(name, ConnectionIds);
        list<CanaryAMS__Certificate_Holder_Connection__c> ConnectionListToBeUpdated = new list<CanaryAMS__Certificate_Holder_Connection__c>(); //update the connection list with true and false.
        try {
            system.debug('UnselectedIds-------------------------------------->' + UnselectedIds);
            system.debug('cerificateHolerWrpList-----!12222!->' + Create_Component_controller.certificateHolderList);
            system.debug(cerificateHolerWrpList + 'cerificateHolerWrpList-----!12222!->' + certificateHolderList);
            System.debug('ConnectionIds---->' + ConnectionIds);
            System.debug('nameeeee->' + name);
            EmailTemplate t = new EmailTemplate();
            t = [select Subject,Name,id,Body,RelatedEntityType,FolderId from EmailTemplate where Id = :name];
            System.debug('emailtemplate data-->' + t);
            Map<Id, String> Connection_pdf = new Map<Id, String>();// accord_pdf link_to_connection
            List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
            list<CanaryAMS__Certificate_Holder_Connection__c> EmailToConnections = new list<CanaryAMS__Certificate_Holder_Connection__c>();
            EmailToConnections = [select CanaryAMS__Certificate_Holder__r.CanaryAMS__Contact__r.Name,CanaryAMS__Certificate_Holder__r.CanaryAMS__Contact__r.email from CanaryAMS__Certificate_Holder_Connection__c where Id IN:ConnectionIds limit 1500];

            list<CanaryAMS__Accord_PDF__c> Accord_PDF_list = new list<CanaryAMS__Accord_PDF__c>();
            Accord_PDF_list = [select CanaryAMS__url__c,CanaryAMS__Certificate_Holder_Connection__c,Approved__c from CanaryAMS__Accord_PDF__c where CanaryAMS__Certificate_Holder_Connection__c IN:ConnectionIds and Approved__c = true limit 1500];
            for (CanaryAMS__Accord_PDF__c link : Accord_PDF_list) {
                System.debug(link.id + '####' + link.CanaryAMS__url__c + '	holder conn id->' + link.CanaryAMS__Certificate_Holder_Connection__c);
                if (!Connection_pdf.containsKey(link.CanaryAMS__Certificate_Holder_Connection__c)) {
                    System.debug('************************');
                    if (link.CanaryAMS__url__c != null) {
                        Connection_pdf.put(link.CanaryAMS__Certificate_Holder_Connection__c, link.CanaryAMS__url__c);
                    }
                }
            }
            System.debug('Accord_PDF_list------>' + Accord_PDF_list);
            System.debug('Connection_pdf->' + Connection_pdf);

            /*update checkbox on connction*/
            ConnectionListToBeUpdated = [select selected__c from CanaryAMS__Certificate_Holder_Connection__c where ID IN:ConnectionIds OR ID IN:UnselectedIds];
            System.debug('ConnectionListToBeUpdated->' + ConnectionListToBeUpdated);
            System.debug('ConnectionListToBeUpdated- size1--->' + ConnectionListToBeUpdated.size());
            for (CanaryAMS__Certificate_Holder_Connection__c con : ConnectionListToBeUpdated) {
                if (ConnectionIds.contains(String.valueOf(con.Id))) {
                    System.debug('connection id-->' + String.valueOf(con.Id));
                    con.Selected__c = true;
                } else if (UnselectedIds.contains(String.valueOf(con.Id))) {
                    System.debug('connection not selected id-->' + String.valueOf(con.Id));
                    con.Selected__c = false;
                }
            }

            /*update checkbox on connction*/

            for (CanaryAMS__Certificate_Holder_Connection__c c : EmailToConnections) {
                if (Connection_pdf.containsKey(c.Id)) {
                    System.debug('cId------------->'+c.Id);
                    if (c.CanaryAMS__Certificate_Holder__r.CanaryAMS__Contact__r.email != null) {
                          System.debug('contact email ------------->'+c.CanaryAMS__Certificate_Holder__r.CanaryAMS__Contact__r.email);
                        //c.Selected__c=true;//update the check box in the connection record

                        system.debug('CanaryAMS__Certificate_Holder_Connection__cID->' + c.Id);
                        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                        List<String> sendTo = new List<String>();
                        sendTo.add(c.CanaryAMS__Certificate_Holder__r.CanaryAMS__Contact__r.email);
                        System.debug('c.CanaryAMS__Certificate_Holder__r.CanaryAMS__Contact__r.email->' + c.CanaryAMS__Certificate_Holder__r.CanaryAMS__Contact__r.email);
                        System.debug('sendTo->' + sendTo);
                        System.debug('c.CanaryAMS__Certificate_Holder__r.CanaryAMS__Contact__c-->' + c.CanaryAMS__Certificate_Holder__r.CanaryAMS__Contact__c);
                        mail.setTargetObjectId(c.CanaryAMS__Certificate_Holder__r.CanaryAMS__Contact__c);
                        mail.setWhatId(c.CanaryAMS__Certificate_Holder__c);
                        mail.setToAddresses(sendTo);
                        mail.setTemplateId(t.Id);
                        mails.add(mail);
                        /*changes*/
                        Http http = new Http();
                        HttpRequest req = new HttpRequest();
                        HttpResponse res = new HttpResponse();
                        req.setMethod('GET');
                        req.setCompressed(true);
                        req.setTimeout(60000);
                        req.setHeader('Content-Type', 'application/pdf');
                        req.setEndpoint(Connection_pdf.get(c.Id));
                        Blob body1;
                        if (!Test.isRunningTest()) {
                            res = http.send(req);
                            body1 = res.getBodyAsBlob();
                        } else {
                            body1 = Blob.valueOf('12345678');
                        }
                        System.debug('res->' + res);

                        list<Messaging.EmailFileAttachment> emailAttachmentList = new list<Messaging.EmailFileAttachment>();
                        Messaging.EmailFileAttachment emailAttachment1 = new Messaging.EmailFileAttachment();
                        emailAttachment1.setContentType('application/pdf');
                        emailAttachment1.Body = body1;
                        emailAttachment1.setFileName('test.pdf');
                        emailAttachment1.setInline(false);
                        emailAttachmentList.add(emailAttachment1);
                        mail.setFileAttachments(emailAttachmentList);

                        /*changes*/
                    }
                }
            }

            System.debug('Connection_pdf->' + Connection_pdf.size());
            if (!Test.isRunningTest()) {
                Messaging.sendEmail(mails);
                try {
                    update ConnectionListToBeUpdated;
                    System.debug('updated list------------>' + ConnectionListToBeUpdated);
                } catch (Exception e) {
                    System.debug('get ecexception while updating ConnectionListToBeUpdated' + e.getLineNumber() + '	exception is----->' + e.getMessage());
                }
            }
            if (Connection_pdf.size() > 0)
                return true; else
                    return false;
        } catch (exception e) {
            System.debug('Create_Component_controller  get exception on line number->' + e.getLineNUmber() + ' error is->' + e.getMessage());
            try {
                update ConnectionListToBeUpdated;
                System.debug('updated list------------>' + ConnectionListToBeUpdated);
            } catch (Exception ex) {
                System.debug('get ecexception while updating ConnectionListToBeUpdated' + ex.getLineNumber() + '	exception is----->' + ex.getMessage());
            }
            return false;
        }
    }

   
   // public static List < sObject > fetchLookUpValues(String searchKeyWord, String ObjectName)
       

    @AuraEnabled
    public static EmailTemp defEmailTemplate() { //fetch the default email templates from the custom label
        try {
            String test1 = System.Label.Default_Email_Template;
            System.debug('test->' + test1);
            EmailTemplate t = new EmailTemplate();
            t = [select Subject,Name,id,Body,RelatedEntityType,FolderId from EmailTemplate where Name = :test1];
            system.debug('defaul email template->' + t);
            EmailTemp a = new EmailTemp(t);
            return a;
        } catch (Exception e) {
            System.debug('get defEmailTemplate Exception on line number->' + e.getLineNumber() + '	error is_->' + e.getMessage());
            return null;
        }
    }

    @AuraEnabled
    public static void CreateNewRec(CanaryAMS__Certificate_Holder_Connection__c Connection, String recID) {
        try {
            System.debug('master rec id-->' + recID);
            system.debug('connection rec to be inserted' + Connection);
            insert Connection;
            system.debug('after insertion' + Connection);
        } catch (Exception e) {
            System.debug('getting line number ->' + e.getLineNumber() + '	beacuse->' + e.getMessage());
        }
    }

    @AuraEnabled
    public static boolean getremoveContact(String holderId) {
        try {
            System.debug('holderId--->' + holderId);

            CanaryAMS__Certificate_Holder__c Holder = new CanaryAMS__Certificate_Holder__c();

            Holder = [select CanaryAMS__Contact__c from CanaryAMS__Certificate_Holder__c WHERE Id = :holderId];
            System.debug('holderId-- contact ->' + Holder.CanaryAMS__Contact__c);
            Holder.CanaryAMS__Contact__c = null;
            update Holder;
            System.debug('holderId-- contact ->' + Holder.CanaryAMS__Contact__c);
            return true;

        }

        catch (Exception e) {
            System.debug('get the exception in line number ' + e.getLineNumber() + ' bcoz-->' + e.getMessage());
            return false;

        }

    }
    @AuraEnabled
    public static CanaryAMS__Certificate_Holder__c updateHolder(String holderId, String ConId, String rmkrs) {
        try {
            System.debug('updateHolder' + ConId);
            System.debug(ConId + 'updateHolder->' + holderId);
            System.debug('rmkrs-->' + rmkrs);
            Contact c = new Contact();

            CanaryAMS__Certificate_Holder__c Holder = new CanaryAMS__Certificate_Holder__c();
            Holder = [select CanaryAMS__Contact__c,CanaryAMS__Contact__r.Name,CanaryAMS__Additional_Remarks__c from CanaryAMS__Certificate_Holder__c WHERE Id = :holderId];
            if (rmkrs != null) {
                Holder.CanaryAMS__Additional_Remarks__c = rmkrs;
            } else if (rmkrs == null) {
                Holder.CanaryAMS__Additional_Remarks__c = '';
            }

            if (ConId != null) {
                c = [select id from Contact where Id = :ConId];
                system.debug('selected contact' + c);
                Holder.CanaryAMS__Contact__c = c.Id;
            } else if (ConId == null) {
                System.debug('contact id is null');
            }

            update Holder;
            CanaryAMS__Certificate_Holder__c Holder_updated = new CanaryAMS__Certificate_Holder__c();
            
            Holder_updated = [select CanaryAMS__Contact__c,CanaryAMS__Contact__r.Name,CanaryAMS__Contact__r.Phone,CanaryAMS__Contact__r.Fax,CanaryAMS__Contact__r.Email,CanaryAMS__Contact__r.FirstName,CanaryAMS__Contact__r.LastName,CanaryAMS__Additional_Remarks__c from CanaryAMS__Certificate_Holder__c WHERE Id = :holderId];
            system.debug('Holder value return from here----->'+Holder_updated);
            return Holder_updated;

        } catch (Exception e) {
            System.debug('get the exception in line number ' + e.getLineNumber() + ' bcoz-->' + e.getMessage());
            return null;
        }
    }
    //
        @AuraEnabled
    public static CanaryAMS__Certificate_Holder_Connection__c updateHolderonConnection(String holderId, String recId) {
        try {
            system.debug('holderId-->'+holderId+'----recId->'+recId);
            
            CanaryAMS__Certificate_Holder_Connection__c conn=new CanaryAMS__Certificate_Holder_Connection__c();
            conn=[select CanaryAMS__Certificate_Holder__c,CanaryAMS__Certificate_Holder__r.Name from CanaryAMS__Certificate_Holder_Connection__c where Id=:recId];
            system.debug('conn------>'+conn);
            CanaryAMS__Certificate_Holder__c hldr=new CanaryAMS__Certificate_Holder__c();
            hldr=[select id from CanaryAMS__Certificate_Holder__c where id=:holderId limit 1];
              system.debug('hldr------>'+hldr);
            conn.CanaryAMS__Certificate_Holder__c=hldr.id;
            update conn;
            conn=[select CanaryAMS__Certificate_Holder__c,CanaryAMS__Certificate_Holder__r.Name from CanaryAMS__Certificate_Holder_Connection__c where Id=:recId];
            system.debug('conn----update-->'+conn);
            return conn;
           
        } catch (Exception e) {
            System.debug('get the exception in line number ' + e.getLineNumber() + ' bcoz-->' + e.getMessage());
            return null;
        }
    }
    @AuraEnabled
    public static void delContact(String conId) {
        try {
            System.debug('conID------------------------------------------------------------------------------>' + conId);
            contact c = new Contact();
            c = [select id from Contact where id = :conId];
            delete c;
        } catch (Exception e) {
            System.debug('get Exception on line number-->' + e.getLineNUmber() + '	beacuse-->' + e.getMessage());
        }
    }

    @AuraEnabled
    public static contact createNewContactFun(Contact contact , String sal) {  // create new contact of  Certificate Holder type
        try {
            system.debug('sal value-1->'+sal);
         
            recordtype recordTypeId = [
                    SELECT isActive,Id, Name, DeveloperName, SobjectType
                    FROM RecordType
                    where SobjectType = 'Contact' and DeveloperName = 'Certificate_Holder'
                    limit 1
            ];
               if(sal=='none'){
            	system.debug('sal value-2->'+sal);    
            }
            else if(sal!='none'){
                system.debug('sal value-3->'+sal);
                  contact.Salutation=sal;
            }
            contact.recordTypeId = recordTypeId.Id;
              
            insert contact;
            System.debug('contact details-->' + contact);
            return contact;
        } catch (Exception e) {
            System.debug('get Exception on line number-->' + e.getLineNUmber() + '	beacuse-->' + e.getMessage());
            return null;
        }
    }

    @AuraEnabled
    public static list<CanaryAMS__Accord_PDF__c> fetchRelatedPdf(String connectionId) {

        system.debug('selected connection id-->' + connectionId);
        list<CanaryAMS__Accord_PDF__c> accordList = new list<CanaryAMS__Accord_PDF__c>();
        accordList = [
                select Name,CanaryAMS__url__c,CanaryAMS__Certificate_Holder_Connection__c,LastModifiedDate,Approved__c,Description__c
                from CanaryAMS__Accord_PDF__c
                where CanaryAMS__Certificate_Holder_Connection__c = :connectionId
        ];

        /* list<pdfWrapper> pdfWrapperList=new list<pdfWrapper>();
         for(CanaryAMS__Accord_PDF__c pdf:accordList){
             system.debug('selected pdf------>'+pdf);
             pdfWrapperList.add(new pdfWrapper(pdf));
         }
         System.debug('pdf wrapper--->'+pdfWrapperList);*/
        return accordList;
    }
    // @AuraEnabled
    // public static list<recordTypeWrapper> fetchContacttype() 

    @AuraEnabled
    public static list<salutationWrapper> salWrapperList() {
        try {
            list<salutationWrapper> salWrpList = new List<salutationWrapper>();
            Schema.DescribeFieldResult fieldResult = Contact.salutation.getDescribe();
            System.debug('Schema.DescribeFieldResult fieldResult->' + fieldResult);
            List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
            for (Schema.PicklistEntry f : ple) {
                System.debug('f.getLabel()->' + f.getLabel() + 'f.getValue()->' + f.getValue());
                salWrpList.add(new salutationWrapper(f.getValue()));
            }
            System.debug('originalvalues-->' + salWrpList);
            return salWrpList;
        } catch (exception e) {
            System.debug('get exception on line number-->' + e.getLineNumber() + '	bcoz-->' + e.getLineNumber());
            return null;
        }

    }
     @AuraEnabled 
    public static void createHolder(CanaryAMS__Certificate_Holder__c holder){
        
        system.debug('holder values-->'+holder);
        try{
        insert holder;
        }
        catch(Exception e){
            System.debug('get exception on kine number-->'+e.getLineNumber()+'bcoz-->'+e.getMessage());
        }
        
    }
    
       @AuraEnabled 
    public static CanaryAMS__Certificate_Holder__c newValuesFromHolder(String holderId){
        
        system.debug('holder Idddddddd-->'+holderId);
        try{
       			CanaryAMS__Certificate_Holder__c hldr=new CanaryAMS__Certificate_Holder__c();
            hldr=[select CanaryAMS__Address_1__c,CanaryAMS__Address_2__c,CanaryAMS__City__c,CanaryAMS__State__c,CanaryAMS__Zip_Postal_Code__c from CanaryAMS__Certificate_Holder__c where Id=:holderId];
            system.debug('hldr----------->>>>>'+hldr);
            return hldr;
        }
        catch(Exception e){
            System.debug('get exception on kine number-->'+e.getLineNumber()+'bcoz-->'+e.getMessage());
            return null;
        }
        
    }
    
           @AuraEnabled 
    public static Contact newValuesFromContact(String contactId){
        
        system.debug('contactId Idddddddd-->'+contactId);
        try{
       			Contact con=new Contact();
            con=[select Phone,Fax,Email from Contact where Id=:contactId];
            system.debug('con----------->>>>>'+con);
            return con;
        }
        catch(Exception e){
            System.debug('get exception on kine number-->'+e.getLineNumber()+'bcoz-->'+e.getMessage());
            return null;
        }
        
    }

    public class cerificateHolerWrp {    // generating wraaper for the CanaryAMS__Certificate_Holder_Connection__c
        @AuraEnabled public CanaryAMS__Certificate_Holder_Connection__c chc { get; set; }
        @AuraEnabled public boolean selected { get; set; }
        @AuraEnabled public long num { get; set; }

        public CerificateHolerWrp(CanaryAMS__Certificate_Holder_Connection__c c, boolean b, long total) {
            chc = c;
            selected = b;
            num = total;
        }

    }

    public class pdfWrapper {
        @AuraEnabled public CanaryAMS__Accord_PDF__c accordPdf { get; set; }

        public pdfWrapper(CanaryAMS__Accord_PDF__c accord) {
            accordPdf = accord;

        }
    }


    public class EmailTemp {// generating wraaper for the email templates
        @AuraEnabled public EmailTemplate template { get; set; }

        public EmailTemp(EmailTemplate et) {
            template = et;
        }
    }

  

    public class salutationWrapper {
        @AuraEnabled public String sal { get; set; }
        public salutationWrapper(String salValue) {
            sal = salValue;
        }
    }
    
    

    // Method for getting the blob from URL Accord link
    public static void OpenPdfFromDownloadLink() {
        String recordId = ApexPages.currentPage().getParameters().get('id');
        System.debug('record id--->pdf -->'+recordId);
        if (recordId != null) {
            List<CanaryAMS__Accord_PDF__c> accord_pdfs = new List<CanaryAMS__Accord_PDF__c>();
            accord_pdfs = [Select CanaryAMS__url__c from CanaryAMS__Accord_PDF__c where Id = :recordId LIMIT 1];
            // CanaryAMS__url__c is my custom field where I have stored pdf download link.
            if (accord_pdfs.size() > 0) {
                if (accord_pdfs[0].CanaryAMS__url__c != null) {
                    Http http = new Http();
                    HttpRequest req = new HttpRequest();
                    String acordLinkUrl = accord_pdfs[0].CanaryAMS__url__c;
                    if (acordLinkUrl.contains(' ')) {
                        acordLinkUrl = acordLinkUrl.replace(' ', '%20');
                    }

                    req.setEndpoint(acordLinkUrl);
                    req.setMethod('GET');
                    req.setHeader('Content-Type', 'application/pdf');
                    req.setCompressed(true);
                    req.setTimeout(60000);
                    try {
                        HttpResponse res = null;
                        res = http.send(req);
                        if (res.getStatusCode() == 200) {
                            String responseValue = res.getBody();
                            system.debug('Response Body for File: ' + responseValue);
                            acordPdfBody = res.getBodyAsBlob();
                        } else {
                            System.debug('Something mishapped in callout response Status :: ' + res.getStatus());
                        }
                    } catch (Exception ex) {
                        System.debug('Exception Message :: ' + ex.getMessage() + ' and Cause :: ' + ex.getCause());
                    }
                } else {
                    System.debug('Pdf Url not found.');
                }
            }
        } else {
            System.debug('Record Id not found.');
        }
    }
    public String pdf {
        get {


            System.debug(EncodingUtil.Base64Encode(acordPdfBody));
            return EncodingUtil.Base64Encode(acordPdfBody);
          //  System.debug(EncodingUtil.Base64Decode(EncodingUtil.Base64Encode(acordPdfBody)).toString());
            //return EncodingUtil.Base64Decode(EncodingUtil.Base64Encode(acordPdfBody)).toString();

        }
    }

}