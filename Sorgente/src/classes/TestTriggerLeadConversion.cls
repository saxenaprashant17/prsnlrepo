@isTest
public class TestTriggerLeadConversion {
	private static testMethod void testConversion(){
    	Lead l = new Lead(FirstName = 'Test', LastName = 'Lead');
        insert l;
        Database.LeadConvert lc = new Database.LeadConvert();
        lc.setLeadId(l.id);
        lc.setDoNotCreateOpportunity(false);
        lc.setConvertedStatus('Qualified');
        Test.startTest();
        Database.convertLead(lc);
		Test.stopTest();
    }
}