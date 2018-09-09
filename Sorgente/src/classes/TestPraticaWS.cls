@IsTest
public class TestPraticaWS {
    public static testMethod void testGetPraticaWS() {
        
        PraticaWS.getUserById('0014E00000MhYI6QAN');
        PraticaWS.getUserByName('0014E00000MhYI6QAN');
        PraticaWS.getAccountByExternalId('0014E00000MhYI6QAN');
        PraticaWS.getAccountById('0014E00000MhYI6QAN');
        PraticaWS.getPersonAccountByExternalId('0014E00000MhYI6QAN');
        PraticaWS.getPersonAccountById('0014E00000MhYI6QAN');
        PraticaWS.getContactByName('0014E00000MhYI6QAN');
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

        PraticaWS.upsertContact(null);
    }
    
    public static testMethod void testGetPraticaWS2() {
        Account a = new Account();
        a.FirstName = 'Unit';
        a.LastName = 'Test User';
        a.PersonEmail = 'sfdebug@bemerconsulting.com';
        a.RecordTypeId = AppSetup.recordTypePersonAccount;
        a.Agente__c = [select Id from User where Name='TestKam'].get(0).Id;
        insert(a);

        Account am = new Account();
        am.FirstName = 'Unit';
        am.LastName = 'Test User';
        am.PersonEmail = 'sfdebug@bemerconsulting.com';
        am.RecordTypeId = AppSetup.recordTypePersonAccount;
        am.Agente__c = [select Id from User where Name='TestKam'].get(0).Id;
        insert(am);
        
        PraticaWS.Pratica p = PraticaWS.getNuovaPratica();
        p.Opportunity.Name='TestOpp';
        p.Opportunity.StageName='Aperto';
        p.Opportunity.CloseDate= Date.today();
        p.Opportunity.AccountId = a.Id;
        p = PraticaWS.updateOpportunity(p);
        p = PraticaWS.getPraticaById(p.Opportunity.Id);
        p = PraticaWS.updateGenitori(p);
        
        p.Padre = a;
        p.Madre = am;
        p = PraticaWS.updateGenitori(p);
    }

    public static testMethod void testGetPraticaWS3() {
        Account a = new Account();
        a.FirstName = 'Unit';
        a.LastName = 'Test User';
        a.PersonEmail = 'sfdebug@bemerconsulting.com';
        a.RecordTypeId = AppSetup.recordTypePersonAccount;
        a.Agente__c = [select Id from User where Name='TestKam'].get(0).Id;
        insert(a);

        PraticaWS.Pratica p = PraticaWS.getNuovaPratica();
        p.Opportunity.Name='TestOpp';
        p.Opportunity.StageName='Aperto';
        p.Opportunity.CloseDate= Date.today();
        p.Opportunity.AccountId = a.Id;
        p = PraticaWS.updateOpportunity(p);

        Account a2 = new Account();
        a2.FirstName = 'Unit';
        a2.LastName = 'Test User';
        a2.PersonEmail = 'sfdebug@bemerconsulting.com';
        a2.RecordTypeId = AppSetup.recordTypePersonAccount;
        a2.Agente__c = [select Id from User where Name='TestKam'].get(0).Id;
        insert(a2);
        
        PraticaWS.createOpportunity(p.Opportunity, a2, true);
    }
    
    public static testMethod void testGetPraticaWS4() {
        Account a = new Account();
        a.FirstName = 'Unit';
        a.LastName = 'Test User';
        a.PersonEmail = 'sfdebug@bemerconsulting.com';
        a.RecordTypeId = AppSetup.recordTypePersonAccount;
        a.Agente__c = [select Id from User where Name='TestKam'].get(0).Id;
        insert(a);
        PraticaWS.Pratica p = PraticaWS.getNuovaPratica();
        p.Opportunity.Name='TestOpp';
        p.Opportunity.StageName='Aperto';
        p.Opportunity.CloseDate= Date.today();
        p.Opportunity.AccountId = a.Id;
        p = PraticaWS.updateOpportunity(p);
        Account a3 = new Account();
        a3.FirstName = 'Unit';
        a3.LastName = 'Test User';
        a3.PersonEmail = 'sfdebug@bemerconsulting.com';
        a3.Agente__c = [select Id from User where Name='TestKam'].get(0).Id;
        PraticaWS.insertPersonAccount(a3);
        PraticaWS.updatePersonAccount(a3, p.Opportunity.Id, 'Madre', true);

        PraticaWS.getPrimaryAccount(p.Opportunity.Id);

        PraticaWS.getOspedaliAbilitatiParto();
        PraticaWS.getOspedaliByStato('IT');
        PraticaWS.getOspedaliByProvinciaCitta('AT', 'Asti');
        
        PraticaWS.removeProductByCode(p, 'RC-T');
    }
    
    public static testMethod void testGetPraticaWS5() {
        Account a = new Account();
        a.Name = 'Unit Test Professional';
        a.RecordTypeId = AppSetup.recordTypeProfessional;
        insert(a);

        Contact s = new Contact();
        s.AccountId = a.Id;
        s.FirstName = 'Unit';
        s.LastName = 'Test Specialista';
        s.RecordTypeId = AppSetup.recordTypeSpecialista;
        insert(s);

        Account o = new Account();
        o.Name = 'Unit Test Hospital';
        o.RecordTypeId = AppSetup.recordTypeProfessional;
        o.Punto_di_prelievo__c = true;
        insert(o);

        Account ap = new Account();
        ap.FirstName = 'Unit';
        ap.LastName = 'Test User';
        ap.PersonEmail = 'sfdebug@bemerconsulting.com';
        ap.RecordTypeId = AppSetup.recordTypePersonAccount;
        ap.Agente__c = [select Id from User where Name='TestKam'].get(0).Id;
        insert(ap);

        PraticaWS.Pratica p = PraticaWS.getNuovaPratica();
        p.Opportunity.Name='TestOpp';
        p.Opportunity.StageName='Aperto';
        p.Opportunity.CloseDate= Date.today();
        p.Opportunity.AccountId = ap.Id;
        p = PraticaWS.updateOpportunity(p);
    }

    public static testMethod void testGetPraticaWS6() {
        Account ap = new Account();
        ap.FirstName = 'Unit';
        ap.LastName = 'Test User';
        ap.PersonEmail = 'sfdebug@bemerconsulting.com';
        ap.RecordTypeId = AppSetup.recordTypePersonAccount;
        ap.Agente__c = [select Id from User where Name='TestKam'].get(0).Id;
        insert(ap);

        PraticaWS.Pratica p = PraticaWS.getNuovaPratica();
        p.Opportunity.Name='TestOpp';
        p.Opportunity.StageName='Aperto';
        p.Opportunity.CloseDate= Date.today();
        p.Opportunity.AccountId = ap.Id;
        p = PraticaWS.updateOpportunity(p);
        PraticaWS.updateDatiSanitari(p.Opportunity.Id, null, null);
    }
    
    public static testMethod void testGetPraticaWS7() {
        Account ap = new Account();
        ap.FirstName = 'Unit';
        ap.LastName = 'Test User';
        ap.PersonEmail = 'sfdebug@bemerconsulting.com';
        ap.RecordTypeId = AppSetup.recordTypePersonAccount;
        ap.Agente__c = [select Id from User where Name='TestKam'].get(0).Id;
        insert(ap);

        PraticaWS.Pratica p = PraticaWS.getNuovaPratica();
        p.Opportunity.Name='TestOpp';
        p.Opportunity.StageName='Aperto';
        p.Opportunity.CloseDate= Date.today();
        p.Opportunity.AccountId = ap.Id;
        p = PraticaWS.updateOpportunity(p);

        PraticaWS.updateOpportunityLineItems(p);
    }
    
    public static testMethod void testGetPraticaWS8() {
        Account a = new Account();
        a.Name = 'Unit Test Professional';
        a.RecordTypeId = AppSetup.recordTypeProfessional;
        insert(a);

        Contact s = new Contact();
        s.AccountId = a.Id;
        s.FirstName = 'Unit';
        s.LastName = 'Test Specialista';
        s.RecordTypeId = AppSetup.recordTypeSpecialista;
        insert(s);

        Account o = new Account();
        o.Name = 'Unit Test Hospital';
        o.RecordTypeId = AppSetup.recordTypeProfessional;
        o.Punto_di_prelievo__c = true;
        insert(o);

        PraticaWS.upsertGinecologo(s);
        PraticaWS.upsertOspedale(o);
        PraticaWS.getListinoByName('test');
    }
    
    public static testMethod void testGetPraticaWS9() {
        Synchronizer__c c = new Synchronizer__c();
        PraticaWS.getSynchronizer();
        PraticaWS.updateSynchronizer(c);
    }
}