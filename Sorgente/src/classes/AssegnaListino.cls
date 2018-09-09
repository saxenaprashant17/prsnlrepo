public class AssegnaListino {
	@InvocableMethod
    public static void AssegnaListino(List<Opportunity> source){
        /*
        Listino Opportunità: -> 1°:'Ospedale/Punto Prelievo' (and has listino), 
                          2°:'Ruolo degli specialisti colaboratori' (and has listino), 
                          3°: standard price book
                        when: status 'I.A. Prelievo' (SG)
		*/
        if(source == null || source.size() <=0){
            return;
        }
        Opportunity opp = [Select Id, Pricebook2Id, Ospedale_Punto_prelievo__r.Listino__c from Opportunity where Id= :source.get(0).Id].get(0);
        if(opp.Pricebook2Id != null){
            // c'è già, va bene così
            return; 
        }
        
        List<OpportunityContactRole> ocrs = [Select Id, Contact.Listino_prezzi__c from OpportunityContactRole where Contact.Listino_prezzi__c != null and OpportunityId =:source.get(0).Id];
        if(ocrs != null && ocrs.size()>0){
            opp.Pricebook2Id = ocrs[0].Contact.Listino_prezzi__c;
            update(opp);
        	return;
        }
        
        if(opp.Ospedale_Punto_prelievo__r != null && opp.Ospedale_Punto_prelievo__r.Listino__c != null){
            opp.Pricebook2Id = opp.Ospedale_Punto_prelievo__r.Listino__c;
            update(opp);
        	return;
        }
        
        if (Test.isRunningTest()) {
            opp.Pricebook2Id = Test.getStandardPricebookId();
    	} else {
        	opp.Pricebook2Id = [select id, name from Pricebook2 where isStandard = true limit 1].Id;
    	}
      	update(opp);
        
    }
}