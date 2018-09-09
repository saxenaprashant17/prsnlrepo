@isTest
public class TestOppTriggers {

    private static testMethod void testOppTriggersInsert(){
        Account a = new Account();
        a.FirstName = 'Unit';
        a.LastName = 'Test User';
        a.PersonEmail = 'sf_debug@bemerconsulting.com';
        a.RecordTypeId = AppSetup.recordTypePersonAccount;
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

        Contact con = new Contact();
        con.PC_SS__c = 10;
        con.LastName = 'Ginecologo';
        con.RecordTypeId = Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Specialista').getRecordTypeId();
        List<User> u = [SELECT Id FROM User WHERE (IsActive = true)];
        if (u.size() > 0)
            con.OwnerId = u[0].Id;
        insert con;

        DateTime now = DateTime.now();
        Opportunity o1 = new Opportunity();
        o1.RecordTypeId = AppSetup.recordTypeSG;
        o1.Name = 'Opportunita Unit Test';
        o1.AccountId = a.Id;
        o1.StageName = 'Aperto';
        o1.CloseDate = Date.today();
        o1.Data_ora_prelievo_effettiva__c = now.addMonths(-1);
        o1.Operatore_prelievo__c = s.Id;
        o1.Ginecologo__c = con.Id;
        o1.Agente_titolare_ginecologo__c = con.OwnerId;
        insert(o1);
    }
}