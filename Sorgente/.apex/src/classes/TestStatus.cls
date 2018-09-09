@isTest
public class TestStatus {
    private static testMethod void testStatus(){
       /*
        UpdateStatusAccount usa = new UpdateStatusAccount();
        UpdateStatusReferenti usr = new UpdateStatusReferenti();
        
        Account a = new Account();
        a.FirstName = 'Unit';
        a.LastName = 'Test User';
        a.PersonEmail = 'ssineriz@gmail.com';
        a.RecordTypeId = AppSetup.recordTypePersonAccount;
        a.Agente__c = [select Id from User where Name='TestKam'].get(0).Id;
        insert(a);
        
        PriceBook2 pbl = new PriceBook2();
        pbl.Tipo_Listino__c = 'Libero';
        pbl.Name = 'Unit Test Listino Libero';
        insert(pbl);
        
        PriceBook2 pbp = new PriceBook2();
        pbp.Tipo_Listino__c = 'Punti consiglio';
        pbp.Name = 'Unit Test Listino Punti';
        pbp.Punti_Consiglio_SS__c = 10;
        insert(pbp);
        
        Account p = new Account();
        p.Name = 'Unit Test Professional';
        p.RecordTypeId = AppSetup.recordTypeProfessional;
        p.Struttura_abilitata_ai_parti__c = 'Si';
        insert(p);
        
        Contact s = new Contact();
        s.AccountId = p.Id;
        s.FirstName = 'Unit';
        s.LastName = 'Test Specialista';
        s.RecordTypeId = AppSetup.recordTypeSpecialista;      

        // b.Motivazione_perdita_SG__c, SS
        // Conferma_perdita_SG__c
        // Status_SG__c
        // Listino_prezzi__c, Listino__c

        // 1 - Inattivo, Listino Libero
        p.Status_SG__c = 'Inattivo';
        p.Status_SS__c = 'Inattivo';
        s.Status_SG__c = 'Inattivo';
        s.Status_SS__c = 'Inattivo';
        p.Listino__c = pbl.Id;
        s.Listino_prezzi__c = pbl.Id;
        
        update(p);
        insert(s);
        
        usa.execute();
        usr.execute();

        
        // Create some opportunities
        Opportunity o1 = new Opportunity();
        o1.RecordTypeId = AppSetup.recordTypeSG;
        o1.Name = 'Opportunita Unit Test SG Professional';
        o1.AccountId = a.Id;
        o1.StageName = 'Aperto';
        o1.CloseDate = Date.today();
        o1.Ospedale_Punto_prelievo__c = p.id;
        insert(o1);
        
        Opportunity o2 = new Opportunity();
        o2.RecordTypeId = AppSetup.recordTypeSS;
        o2.Name = 'Opportunita Unit Test SS Professional';
        o2.AccountId = a.Id;
        o2.StageName = 'Aperto';
        o2.CloseDate = Date.today();
        o2.Ospedale_Punto_prelievo__c = p.id;
        o2.Pricebook2Id = pbp.Id;
        insert(o2);        

        Opportunity o3 = new Opportunity();
        o3.RecordTypeId = AppSetup.recordTypeSS;
        o3.Name = 'Opportunita Unit Test SS Specialista';
        o3.AccountId = a.Id;
        o3.StageName = 'Aperto';
        o3.CloseDate = Date.today();
        o3.Pricebook2Id = pbl.Id;
        insert(o3);
        
        Ruolo_degli_Specialisti_Collaboratori__c rs = new Ruolo_degli_Specialisti_Collaboratori__c();
        rs.Referente__c = s.Id;
        rs.Ruolo__c = 'Specialista';
        rs.Opportunita__c = o3.Id;
        insert(rs);

        Opportunity o4 = new Opportunity();
        o4.RecordTypeId = AppSetup.recordTypeSG;
        o4.Name = 'Opportunita Unit Test SG Specialista';
        o4.AccountId = a.Id;
        o4.StageName = 'Aperto';
        o4.CloseDate = Date.today();
        o4.Pricebook2Id = pbp.Id;
        insert(o4);
        
        rs = new Ruolo_degli_Specialisti_Collaboratori__c();
        rs.Referente__c = s.Id;
        rs.Ruolo__c = 'Specialista';
        rs.Opportunita__c = o4.Id;
        insert(rs);        
        
        // with opportunities
        usa.execute();
        usr.execute();
        
        p.Status_SG__c = 'Affiliato';
        p.Status_SS__c = 'Affiliato';
        s.Status_SG__c = 'Affiliato';
        s.Status_SS__c = 'Affiliato';       
        
        update(p);
        update(s);

        usa.execute();
        usr.execute(); 

        // listino punti
        p.Listino__c = pbp.Id;
        s.Listino_prezzi__c = pbp.Id;      
        update(p);
        update(s);
        usa.execute();
        usr.execute();
        
        // perso
        p.Conferma_perdita_SG__c = true;
        p.Conferma_perdita_SS__c = true;
        s.Conferma_perdita_SG__c = true;
        s.Conferma_perdita_SS__c = true;
        update(p);
        update(s);
        usa.execute();
        usr.execute(); 
        
        // Inattivo
        p.Motivazione_perdita_SG__c = 'Inattivo';
        p.Motivazione_perdita_SS__c = 'Inattivo';
        s.Motivazione_perdita_SG__c = 'Inattivo';
        s.Motivazione_perdita_SS__c = 'Inattivo';
        update(p);
        update(s);
        usa.execute();
        usr.execute(); 
        
        // Punti Consiglio
        AssegnaPuntiConsiglio.AssegnaPuntiConsiglio(null);
        
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
        
        List<Opportunity> opps = new List<Opportunity>();
        opps.add(o1);
        AssegnaPuntiConsiglio.AssegnaPuntiConsiglio(opps);
        o1.Pricebook2Id = Test.getStandardPricebookId();
        update(o1);

        OpportunityLineItem oli = new OpportunityLineItem();
        oli.OpportunityId = o1.Id;
        oli.PricebookEntryId = pbe.Id;
        oli.Quantity = 2;
        oli.TotalPrice = 25;
        Insert(oli);

        AssegnaPuntiConsiglio.AssegnaPuntiConsiglio(opps);
        opps.clear(); opps.add(o2);
        AssegnaPuntiConsiglio.AssegnaPuntiConsiglio(opps);
        opps.clear(); opps.add(o3);
        AssegnaPuntiConsiglio.AssegnaPuntiConsiglio(opps);
        opps.clear(); opps.add(o4);
        AssegnaPuntiConsiglio.AssegnaPuntiConsiglio(opps);
*/
    }
}