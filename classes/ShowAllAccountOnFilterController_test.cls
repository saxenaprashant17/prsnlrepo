@istest
public with sharing class ShowAllAccountOnFilterController_test {
	
	@istest
	public static void testmethod1(){
		
		RecordType rt = [select id,Name from RecordType where SobjectType='Account' and recordtype.Name like '%Person%' Limit 1]; 
		
		Account a=new Account();
		a.lastname='testAccount';
		a.Machine_Sold__c='2000';
		a.Rating='Problem Resolved (Bitter)';
		a.recordTypeid=rt.id; 
		a.billingStreet='test street';
		a.billingcity='test city';
		a.billingCountry='test country';
		a.billingState='teststate';
		a.BillingPostalCode='billingPostalCode';
		a.Quote_Requested_for__c='2000;';
		insert a;
		
				
		Account a1=new Account();
		a1.lastname='testAccount';
		a1.Machine_Sold__c='2000';
		a1.Rating='Problem Resolved (Bitter)';
		a1.recordTypeid=rt.id; 
		a1.billingStreet='test street';
		a1.billingcity='test city';
		a1.billingCountry='test country';
		a.billingState='teststate';
		a.BillingPostalCode='billingPostalCode';
		a1.Quote_Requested_for__c='2000;';
		insert a1;
		
		Opportunity op=new Opportunity();
		op.name='testOpportunity';
		op.closedate=date.today().addDays(-15);
		op.AccountID=a1.id;
		op.StageName='Closed Won';
		//op.IsWon=true;
		insert op;
		
		System.debug('test Opportunity-->'+op);
		System.debug('test Opportunity-->'+op.Closed_won__C);
		System.debug('test Opportunity is won-->'+op.IsWon);
		
		Opportunity o=new Opportunity();
		o=[select id,ISWon from Opportunity where ID=:op.id];
		//System.debug('opportunity details->'+o);
		//update op;
		system.debug('op uodate->'+op.ISwon);
		
		
		
		system.debug('test account 2-->'+a1);
		system.debug('test account 2L'+a1.Last_WON_Date_RUS__c);
		system.debug('test account 2LLast_Sale_Days_Ago_F__c'+a1.Last_Sale_Days_Ago_F__c);
		
		
		
			test.starttest();
		
			for(integer i=0;i<=1;i++){
				 PageReference pageRef = Page.ShowAllAccountOnFilter;
				 Test.setCurrentPage(pageRef);
				
				if(i == 0)
	     		ApexPages.currentPage().getParameters().put('id',a.Id);
	     		
	     		if(i==1)
	     		ApexPages.currentPage().getParameters().put('id',a1.Id);
	     		
				String id = ApexPages.currentPage().getParameters().get('id');
			
				ApexPages.StandardController sc = new ApexPages.StandardController(a);
			 	ShowAllAccountOnFilterController o1 = new ShowAllAccountOnFilterController(sc); 
			 	o1.SearchAccounts();
			 	o1.ToAccountPage();
			 	o1.Last_Sale_Days_Ago=150;
			 	o1.selectclick();
			 	o1.unselectclick();
			 	o1.getunSelectedValues();
			 	o1.getSelectedValues();
			}	
			test.stoptest(); 	 
	}
    
}