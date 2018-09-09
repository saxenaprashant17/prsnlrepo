@isTest
public class TestUpdates {
    private static testMethod void testMails(){  // split in two because more than 10 emails would raise limit error
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
        
    	MailRestituzioneKit.MailRestituzioneKit(optests);
        MailAttivazioneCorriere.MailAttivazioneCorriere(optests);
        MailCertificatiEmiliaRomagna.MailCertificatiEmiliaRomagna(optests);
        MailCertificatiOP.MailCertificatiOP(optests);
        MailCertificatoGemellare.MailCertificatoGemellare(optests);
        MailConfermaCrioconservazione.MailConfermaCrioconservazione(optests);
        MailFinePagamento.MailFinePagamento(optests);
        MailGGAnalisi.MailGGAnalisi(optests);
        
        optests = [Select Id, AccountId from Opportunity where Id = :o.Id];
    	MailRestituzioneKit.MailRestituzioneKit(optests);
        MailAttivazioneCorriere.MailAttivazioneCorriere(optests);
        MailCertificatiEmiliaRomagna.MailCertificatiEmiliaRomagna(optests);
        MailCertificatiOP.MailCertificatiOP(optests);
        MailCertificatoGemellare.MailCertificatoGemellare(optests);
        MailConfermaCrioconservazione.MailConfermaCrioconservazione(optests);
        MailFinePagamento.MailFinePagamento(optests);
        MailGGAnalisi.MailGGAnalisi(optests);
    }
}