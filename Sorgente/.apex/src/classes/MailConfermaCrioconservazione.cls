public class MailConfermaCrioconservazione {
	@InvocableMethod
    public static void MailConfermaCrioconservazione(List<Opportunity> source){
        List<EmailTemplate> templates = [Select Id, Name from EmailTemplate where DeveloperName ='ConfermaCrioconservazione'];
        if(source.size() <=0 || templates.size() <=0) {
            return;
        }
        Opportunity opp = source.get(0);
        Contact pa = [Select Id from Contact where AccountId =:opp.AccountId].get(0);
 
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setTargetObjectId(pa.Id);
   		mail.setTemplateId(templates.get(0).Id);
        mail.setWhatId(opp.Id);   
        mail.setBccSender(false);
        mail.setUseSignature(false);
        mail.setSaveAsActivity(true);
		Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
}