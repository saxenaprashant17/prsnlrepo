@isTest
private class OpportunityFlowExtensionTestclass {
     static testMethod void myUnitTest() {
  
        Account a = new Account(LastName='OpportunityPipelineChangeTest',Data_Source__c='Bing');
        insert a;
        
        
        Opportunity O = new Opportunity(Name='TestPipelineChange',AccountId=a.id,
                                        CloseDate=System.today(),StageName='Contacted via Email');
        insert O;
        
        Test.Starttest();
            ApexPages.StandardController stdController = new ApexPages.StandardController(O);
            OpportunityFlowExtension ext = new OpportunityFlowExtension(stdController);
            ext.getFinishPage();
        Test.Stoptest();
  
    } 
}