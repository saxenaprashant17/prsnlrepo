public with sharing class CA_Unsubscribe_Email_Class {
    
    public CA_Unsubscribe_Email_Class(){
    
    }
    
    public void UpdateObjectUnsubscribe(){
    	
    	id IdOfObjectRecord = ApexPages.currentPage().getParameters().get('id');
    	system.debug('IdOfObjectRecord::::'+IdOfObjectRecord);
    	string query='select id,Annulla_l_iscrizione__c from';
    	
    	string CheckObject = IdOfObjectRecord.getSObjectType().getDescribe().getName();
    	system.debug('CheckObject::::'+CheckObject);
    	if(CheckObject == 'Contact'){
    		query  += ' Contact where id =: IdOfObjectRecord limit 1';
    		system.debug('query::::'+query);
    		Contact newCon = new Contact();
    		newCon = Database.query(query);
    		system.debug('newCon::::'+newCon);
    		list<Contact> UpdateContactUnsubs = new list<Contact>();
     		newCon.Annulla_l_iscrizione__c = true;
    		UpdateContactUnsubs.add(newCon);
    		
    		if(UpdateContactUnsubs.size() > 0){
    			update UpdateContactUnsubs;
    		}
    		
    	}else if(CheckObject == 'Lead'){
    		query  += ' Lead where id =: IdOfObjectRecord limit 1';
    		system.debug('query::::'+query);
    		Lead newLead = new Lead();
    		newLead = Database.query(query);
    		system.debug('Lead::::'+newLead);
    		list<Lead> UpdateLeadUnsubs = new list<Lead>();
     		newLead.Annulla_l_iscrizione__c = true;
    		UpdateLeadUnsubs.add(newLead);
    		
    		if(UpdateLeadUnsubs.size() > 0){
    			update UpdateLeadUnsubs;
    		}
    	}
    }
}