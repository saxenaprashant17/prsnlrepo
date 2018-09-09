@IsTest
public class TestUtilities {
    private static testMethod void testUtilitiesCf(){ 
        Utilities.checkCodiceFiscale('AAAA');
        Utilities.checkCodiceFiscale('XXX,,,XXX___XXX___Z');
        Utilities.checkCodiceFiscale('SNRJQS72R17Z600Y');
        Utilities.checkCodiceFiscale('SNRJQS72R17Z600W');
    }
    
    public static testMethod void testSearchdupesController() {
        //PageReference pageRef = Page.Home;
        //Test.setCurrentPage(pageRef);
        ApexPages.currentPage().getParameters().put('name', 'pippo');
        ApexPages.currentPage().getParameters().put('firstname', 'pippo');
        ApexPages.currentPage().getParameters().put('lastname', 'pippo');
        ApexPages.currentPage().getParameters().put('id', '');
        SearchdupesController controller = new SearchdupesController();
    }
    
    public static testMethod void testAssegnaListinoEMergeOppController() {
        List<Opportunity> opps = new List<Opportunity>();
        AssegnaListino.AssegnaListino(opps);
        
        Account a = new Account();
        a.FirstName = 'Unit';
        a.LastName = 'Test User';
        a.PersonEmail = 'ssineriz@gmail.com';
        a.RecordTypeId = AppSetup.recordTypePersonAccount;
        a.Agente__c = [select Id from User where Name='TestKam'].get(0).Id;
        insert(a);

        Account p = new Account();
        p.Name = 'Unit Test Professional';
        p.RecordTypeId = AppSetup.recordTypeProfessional;
        insert(p);
        
        Contact s = new Contact();
        s.AccountId = p.Id;
        s.FirstName = 'Unit';
        s.LastName = 'Test Specialista';
        s.RecordTypeId = AppSetup.recordTypeSpecialista;   
        insert(s);
        
        Product2 prod = new Product2();
        prod.Name = 'Unit Test Prodotto';
        prod.RecordTypeId = AppSetup.recordTypeServizi;
        insert prod;
        
        PricebookEntry pbe = new PricebookEntry();
        pbe.Pricebook2Id = Test.getStandardPricebookId();
        pbe.UnitPrice = 10;
        pbe.IsActive = true;
        pbe.Product2Id = prod.Id;
        insert pbe;
        
        Opportunity o = new Opportunity();
        o.RecordTypeId = AppSetup.recordTypeSS;
        o.Name = 'Opportunita Unit Test';
        o.AccountId = a.Id;
        o.StageName = 'Aperto';
        o.CloseDate = Date.today();
        
        o.AWB_verso_lab__c = '9846408246';
        insert(o);
		new UpdateTrackingData().execute();
        
        opps.add(o);

        ApexPages.currentPage().getParameters().put('id', o.Id);
        MergeOpportunitiesController  moc = new MergeOpportunitiesController();
        moc.opp1Id = o.Id;
        // copy doesn't exist
        AssegnaListino.AssegnaListino(opps);
        
        Opportunity d = o.clone(false, true, false, false);
        d.Ripetizione_di__c = o.Id;
        insert(d);
        
        Opportunity md = o.clone(false, true, false, false);
        md.RecordTypeId = AppSetup.recordTypeSS;
        insert(md);
        moc.opp2Id = md.Id;
        
        md.Data_di_spedizione_desiderata__c = Date.today();
        md.Data_di_desiderata_ricezione__c = Date.today();
        md.Data_spedizione_kit_da_decidere__c = true;
        md.StageName = 'In firma';
        try{
        	update(md);
        } catch (Exception ex){
            System.Assert(ex.getMessage().contains('FIELD_CUSTOM_VALIDATION_EXCEPTION'));
        }

        moc.mergeOpportunities();
        
        // ContactId, OpportunityId, IsPrimary, IsDeleted, Role
        OpportunityContactRole ocr = new OpportunityContactRole();
        ocr.OpportunityId = o.Id;
        ocr.Role = 'Madre';
        ocr.ContactId = [Select Id from Contact where AccountId =: a.Id].get(0).Id;
        ocr.IsPrimary = true;
        insert(ocr);
        
        // Opportunita__c, Referente__c, Ruolo__c 
		Ruolo_degli_Specialisti_Collaboratori__c rsc = new Ruolo_degli_Specialisti_Collaboratori__c();
        rsc.Opportunita__c = o.Id;
        rsc.Referente__c = s.Id;
        rsc.Ruolo__c = 'Specialista';
        insert(rsc);
        
        // OpportunityId, PriceBookEntryId, Quantity, TotalPrice, UnitPrice, ServiceDate, Description
        OpportunityLineItem oli = new OpportunityLineItem();
        oli.OpportunityId = o.Id;
        oli.PricebookEntryId = pbe.Id;
        oli.Quantity = 2;
        oli.TotalPrice = 25;
        Insert(oli);
        
        // Name, OpportunityId, Pricebook2Id, ContactId, QuoteNumber, IsSyncing, ShippingHandling, Tax, Status, ExpirationDate, Description, Subtotal,
        // TotalPrice, LineItemCount, BillingStreet,BillingCity,BillingState,BillingPostalCode,BillingCountry,ShippingStreet,ShippingCity,ShippingState,ShippingPostalCode,ShippingCountry,
        // BillingName,ShippingName,Email,Phone,Fax,AccountId,Discount,GrandTotal,Motivazione_sconto__c, Metodo_di_pagamento_servizio__c, Modalit_di_pagamento_servizio__c,
        // Metodo_di_pagamento_kit__c, Numero_rate__c, Maxi_rata__c, Cliente_Professional__c, Salva_Pagamento_senza_CF__c
        Quote qu = new Quote();
        qu.Name='Unit Test Quote';
        qu.OpportunityId = o.Id;
        qu.Pricebook2Id = Test.getStandardPricebookId();
        insert(qu);
        
        // LineNumber, QuoteId, PricebookEntryId, Quantity, UnitPrice, Discount, Description, Product2Id, SortOrder, ListPrice, Subtotal, TotalPrice
        QuoteLineItem qli = new QuoteLineItem();
        qli.QuoteId = qu.Id;
        qli.PricebookEntryId = pbe.Id;
        qli.Quantity = 2;
        qli.UnitPrice = 17;
        insert(qli);
        
        AssegnaListino.AssegnaListino(opps);
    }
    
    public static testMethod void testGetPraticaWS() {
        
        PraticaWS.getUserByName('0014E00000MhYI6QAN');
        PraticaWS.getAccountByExternalId('0014E00000MhYI6QAN');
        PraticaWS.getAccountById('0014E00000MhYI6QAN');
        PraticaWS.getPersonAccountByExternalId('0014E00000MhYI6QAN');
        PraticaWS.getPersonAccountById('0014E00000MhYI6QAN');
        PraticaWS.getContactByIDReferente('0014E00000MhYI6QAN');
        PraticaWS.getGinecologi();
        PraticaWS.getGinecologoByCodiceUnivoco('0014E00000MhYI6QAN');
        PraticaWS.getOspedali();
        PraticaWS.getOspedaleByCodiceUnivoco('0014E00000MhYI6QAN');
        PraticaWS.getPersonAccountByName('Test');
        PraticaWS.getContactById('0014E00000MhYI6QAN');
        PraticaWS.getPersonAccountByName('Test');
        PraticaWS.getPraticaByCodiceOrdine('12345');
        PraticaWS.getPraticaByNumeroPratica('54321');
        PraticaWS.getPraticaByAccountId('0014E00000MhYI6QAN');
            
        Account a = new Account();
        a.FirstName = 'Unit';
        a.LastName = 'Test User';
        a.PersonEmail = 'ssineriz@gmail.com';
        a.RecordTypeId = AppSetup.recordTypePersonAccount;
        a.Agente__c = [select Id from User where Name='TestKam'].get(0).Id;
        insert(a);
        
    	PraticaWS.Pratica p = PraticaWS.getNuovaPratica();
        // [Name, StageName, CloseDate
        p.Opportunity.Name='TestOpp';
        p.Opportunity.StageName='Aperto';
        p.Opportunity.CloseDate= Date.today();
        p.Opportunity.AccountId = a.Id;
    	p = PraticaWS.updateOpportunity(p);
        p = PraticaWS.getPraticaById(p.Opportunity.Id);
        p = PraticaWS.updateGenitori(p);
    }
    
    public static testMethod void testReassign() {
        Lead l = new Lead(FirstName='New Lead', LastName='Lead New');
        insert(l);
        List<Id> leads = new List<Id>();
        leads.add(l.Id);
        ReassignAfterConversion.processRecords(leads);
    }

    public static testMethod void testStatics() {
        ButtonResetFlagGuida.Reset();
        LeadQueue__c lq = new LeadQueue__c(Nome__c = 'Harry', Cognome__c='Potter', Email__c='a@b.c');
        insert lq;
        Lead l = new Lead(FirstName='Harry', LastName='Potter', Email='a@b.c');
        insert(l);
        
    }    

    public static testMethod void testGeneticaWs() {
        GeneticaWS.getUserByName('Test');
        GeneticaWS.getAccountByExternalId('0014E00000MhYI6QAN');
        GeneticaWS.getAccountById('0014E00000MhYI6QAN');
        GeneticaWS.getNuoviOrdini();
        GeneticaWS.getNuovaGestioneCliente();
        GeneticaWS.getListinoByName('Listino');		
    }
}