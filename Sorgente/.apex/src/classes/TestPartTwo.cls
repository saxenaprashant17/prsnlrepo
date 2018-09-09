@isTest
public class TestPartTwo {
	// Test.setCreatedDate(id, dt)
    private static testMethod void testMails(){
		// Create Data
        Account a = new Account();
        a.FirstName = 'Unit';
        a.LastName = 'Test User';
        a.PersonEmail = 'ssineriz@gmail.com';
        a.RecordTypeId = AppSetup.recordTypePersonAccount;
        insert(a);
        
        Opportunity o = new Opportunity();
        o.RecordTypeId = AppSetup.recordTypeSS;
        o.Name = 'Opportunita Unit Test';
        o.AccountId = a.Id;
        o.StageName = 'Aperto';
        o.CloseDate = Date.today();
        insert(o);
        
        List<Opportunity> optests = new List<Opportunity>();  // test empty list
        

        MailMemoParto.MailMemoParto(optests);
        MailProgrammaAmico.MailProgrammaAmico(optests);
        MailRecessoKitIntegro.MailRecessoKitIntegro(optests);
        MailRecessoKitNonIntegro.MailRecessoKitNonIntegro(optests);
        MailRestituzioneKit.MailRestituzioneKit(optests);  
        MailRicezioneContratto.MailRicezioneContratto(optests);
        Mail1InvioCertificato.Mail1InvioCertificato(optests);
        
        optests = [Select Id, AccountId from Opportunity where Id = :o.Id];

        MailMemoParto.MailMemoParto(optests);
        MailProgrammaAmico.MailProgrammaAmico(optests);
        MailRecessoKitIntegro.MailRecessoKitIntegro(optests);
        MailRecessoKitNonIntegro.MailRecessoKitNonIntegro(optests);
        MailRestituzioneKit.MailRestituzioneKit(optests);  
        MailRicezioneContratto.MailRicezioneContratto(optests);
        Mail1InvioCertificato.Mail1InvioCertificato(optests);
    }
	
}