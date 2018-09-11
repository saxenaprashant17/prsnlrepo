@istest public with sharing class Parts_closed_page_controller_test {
    
    @isTest
    public static void crerate_dummy_data(){
    	
        Id pricebookId = Test.getStandardPricebookId();
    		System.debug('pricebookId-=->'+pricebookId);
        Account a=new Account();
        a.LastName='testLastname';
        a.PersonLeadSource='Bing';
        a.name='testAccount';
        insert a;
    	test.starttest();
    		Parts_closed_page_controller.call_method(a.id,a.lastname);
    		
    	test.stoptest();
    
    }
    
}