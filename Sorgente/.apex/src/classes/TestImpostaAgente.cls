@isTest
public class TestImpostaAgente {
    private static testMethod void testImpostaAgente(){
        List<Opportunity> opps = new List<Opportunity>();
        ImpostaAgenteOpportunita.ImpostaAgenteOpportunita(opps);
        
        String SamId = [select Id from User where Name='TestKam'].get(0).Id;
        
        Account a = new Account();
        a.FirstName = 'Unit';
        a.LastName = 'Test User';
        a.PersonEmail = 'ssineriz@gmail.com';
        a.RecordTypeId = AppSetup.recordTypePersonAccount;
        // a.Agente__c = samId;
        insert(a);
        
        Account p = new Account();
        p.Name = 'Unit Test Professional';
        p.RecordTypeId = AppSetup.recordTypeProfessional;
		p.OwnerId = SamId;
        p.Struttura_abilitata_ai_parti__c = 'Si';
        insert(p);
        
        Contact s = new Contact();
        s.AccountId = p.Id;
        s.FirstName = 'Unit';
        s.LastName = 'Test Specialista';
        s.RecordTypeId = AppSetup.recordTypeSpecialista;      
        s.OwnerId = SamId;
        insert(s);


		Opportunity o1 = new Opportunity();
        o1.RecordTypeId = AppSetup.recordTypeSG;
        o1.Name = 'Opportunita Unit Test';
        o1.AccountId = a.Id;
        o1.StageName = 'Aperto';
        o1.CloseDate = Date.today();
        o1.Ospedale_Punto_prelievo__c = p.id;
        insert(o1);
      	opps.add(o1);
        
        // solo professional
        ImpostaAgenteOpportunita.ImpostaAgenteOpportunita(opps);
        
        Ruolo_degli_Specialisti_Collaboratori__c rs = new Ruolo_degli_Specialisti_Collaboratori__c();
        rs.Referente__c = s.Id;
        rs.Ruolo__c = 'Specialista';
        rs.Opportunita__c = o1.Id;
        insert(rs);

        // specialista
        ImpostaAgenteOpportunita.ImpostaAgenteOpportunita(opps);

        rs = new Ruolo_degli_Specialisti_Collaboratori__c();
        rs.Referente__c = s.Id;
        rs.Ruolo__c = 'Specialista che consiglia';
        rs.Opportunita__c = o1.Id;
        insert(rs);
        
        // Specialista che consiglia
        ImpostaAgenteOpportunita.ImpostaAgenteOpportunita(opps);

        a.Agente__c = SamId;
        update(a);

        // agente
        ImpostaAgenteOpportunita.ImpostaAgenteOpportunita(opps);
    
    }
}