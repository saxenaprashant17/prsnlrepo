@isTest
public class TestCopyOpportunity {
    private static testMethod void testCopy(){
        Test.startTest();
        // empty list
        List<Opportunity> opps = new List<Opportunity>();
        CopyOpportunity.CopyOpportunity(opps);
        
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
        insert(pbe);
        
        Opportunity o = new Opportunity();
        o.RecordTypeId = AppSetup.recordTypeSS;
        o.Name = 'Opportunita Unit Test';
        o.AccountId = a.Id;
        o.StageName = 'Aperto';
        o.CloseDate = Date.today();
        
        o.Via_fatturazione__c = 'Via col vento';
        insert(o);
		
        opps.add(o);
        // copy doesn't exist
        CopyOpportunity.CopyOpportunity(opps);
        
        // test allinea indirizzi
        o.Via_fatturazione__c = 'Via le mani dal naso';
        update(o);
        
        Opportunity d = o.clone(false, true, false, false);
        d.Ripetizione_di__c = o.Id;
        insert(d);
        
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
        
        CopyOpportunity.CopyOpportunity(opps);
		Test.stopTest();
    }
}