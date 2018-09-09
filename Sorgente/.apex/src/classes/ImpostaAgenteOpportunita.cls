public class ImpostaAgenteOpportunita {
	@InvocableMethod
    public static void ImpostaAgenteOpportunita(List<Opportunity> source){
        if(source == null || source.size() <=0){
            return;
        }
        Opportunity opp = [Select Id, Agente__c, AccountId, Ospedale_Punto_prelievo__c, RecordTypeId, Origine__c, Operatore_prelievo__c, Operatore_prelievo__r.OwnerId from Opportunity where Id= :source.get(0).Id].get(0);
                
        List<OpportunityContactRole> pas = [select ContactId, Contact.OwnerId from OpportunityContactRole where Role = 'Programma Amico' and OpportunityId=:opp.Id]; 
        if(pas.size()>0){
            opp.Agente__c = pas[0].Contact.OwnerId;
            update(opp);
        	return;
        }

        Account pa = [Select Id, Agente__c from Account where Id =:opp.AccountId].get(0);
        if(pa.Agente__c != null){
            opp.Agente__c = pa.Agente__c;
            update(opp);
        	return;
        }
		
        // Solo SG: If Origine__c dell'opportunità = 'Collaboratore' and Operatore prelievo in Ruolo_degli_Specialisti_Collaboratori__c -> Coll.Contact.OwnerId
        if(opp.RecordTypeId == AppSetup.recordTypeSG && opp.Origine__c == 'Collaboratore'){
            /*
            List<Ruolo_degli_Specialisti_Collaboratori__c> ops = [select Id, Referente__c, Referente__r.OwnerId from Ruolo_degli_Specialisti_Collaboratori__c 
                                                                  where Ruolo__c = 'Operatore prelievo' and Opportunita__c=:opp.Id]; 
            if(ops.size()>0){
                opp.Agente__c = ops[0].Referente__r.OwnerId;
                update(opp);
                return;
            } 
			*/
            if(opp.Operatore_prelievo__c != null && opp.Operatore_prelievo__r.OwnerId!=null){
                opp.Agente__c = opp.Operatore_prelievo__r.OwnerId;
                update(opp);
                return;
            }
        }
        // If recordtype == SG and [Riconosci_ad_agente_del_referente__c]==false
        if(opp.RecordTypeId == AppSetup.recordTypeSG && opp.Ospedale_Punto_prelievo__c !=null){
            Account acc = [SELECT Id, OwnerId, Riconosci_ad_agente_del_referente__c FROM Account where Id = :opp.Ospedale_Punto_prelievo__c].get(0);
            if(acc.OwnerId != null && acc.Riconosci_ad_agente_del_referente__c == false){
              	opp.Agente__c = acc.OwnerId;
                update(opp);
        		return;              
            }
        }  
        
        List<Ruolo_degli_Specialisti_Collaboratori__c> scc = [Select Id, Referente__c from Ruolo_degli_Specialisti_Collaboratori__c 
                             where Opportunita__c = :opp.Id 
                             and Ruolo__c = 'Specialista che consiglia'];
        
        if(scc.size() > 0){
            Contact cnt = [Select Id, OwnerId from Contact where Id =: scc.get(0).Referente__c].get(0);
            if(cnt.OwnerId != null){
              	opp.Agente__c = cnt.OwnerId;
                update(opp);
        		return;              
            }
        }
        
        List<Ruolo_degli_Specialisti_Collaboratori__c> sc = [Select Id, Referente__c from Ruolo_degli_Specialisti_Collaboratori__c 
                             where Opportunita__c = :opp.Id 
                             and Ruolo__c = 'Specialista'];
        
        if(sc.size() > 0){
            Contact cnt = [Select Id, OwnerId from Contact where Id =: sc.get(0).Referente__c].get(0);
            if(cnt.OwnerId != null){
              	opp.Agente__c = cnt.OwnerId;
                update(opp);
        		return;              
            }
        }

    }
}