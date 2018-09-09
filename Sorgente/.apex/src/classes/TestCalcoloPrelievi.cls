@isTest
public class TestCalcoloPrelievi {
    private static testMethod void testCalcoloPrelievi(){
        Account a = new Account();
        a.FirstName = 'Unit';
        a.LastName = 'Test User';
        a.PersonEmail = 'ssineriz@gmail.com';
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
        
        DateTime now = DateTime.now();
        Opportunity o1 = new Opportunity();
        o1.RecordTypeId = AppSetup.recordTypeSG;
        o1.Name = 'Opportunita Unit Test';
        o1.AccountId = a.Id;
        o1.StageName = 'Aperto';
        o1.CloseDate = Date.today();
        o1.Data_ora_prelievo_effettiva__c = now.addMonths(-1);
        o1.Operatore_prelievo__c = s.Id;
        insert(o1);
        
        /*
        Ruolo_degli_Specialisti_Collaboratori__c rs = new Ruolo_degli_Specialisti_Collaboratori__c();
        rs.Referente__c = s.Id;
        rs.Ruolo__c = 'Operatore prelievo';
        rs.Opportunita__c = o1.Id;
        insert(rs);
        */
        new CalcoloPrelievi().execute();
    }
}