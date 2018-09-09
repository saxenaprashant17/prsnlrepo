@isTest
public class TestSchedules {
    private static testMethod void testSchedules(){
        Account a = new Account(FirstName='Test', LastName='Account', Richiesta_guida__c=true, RecordTypeId=AppSetup.recordTypePersonAccount);
        insert a;
        a = [select PersonContactId from Account where Id=:a.ID];
        insert new Task(Subject='Documenti di stampa unione generati: Modello stampa busta guida cartacea', WhoId = a.PersonContactId);
        
        new ScheduledWorkflow().execute(null);
        new ScheduledWorkflowMonthly().execute(null);
    }
}