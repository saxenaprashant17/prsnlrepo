public class AssegnaPuntiConsiglio {
	@InvocableMethod
    public static void AssegnaPuntiConsiglio(List<Opportunity> source){
    	// valido per SS e SG
    	if(source == null || source.size() <=0){
            return;
        }
        
        Opportunity opp = source.get(0);
        if(opp.Pricebook2Id == null){
            return;
        }
        Double punti = 0;
		List<PriceBook2> pbl = [select Punti_Consiglio_SS__c, Tipo_Listino__c FROM PriceBook2 where Id = :opp.Pricebook2Id];
        if(pbl.size()<1){ return; }        
        PriceBook2 pb = pbl.get(0);
        if(opp.RecordTypeId == AppSetup.recordTypeSS){
            if(pb==null || pb.Punti_Consiglio_SS__c == null || pb.Punti_Consiglio_SS__c <= 0){
                return;
            }
            punti = pb.Punti_Consiglio_SS__c;
        } else if (opp.RecordTypeId == AppSetup.recordTypeSG){ 
            if(pb == null || pb.Tipo_Listino__c != 'Punti consiglio'){ 	return;  }
            List<OpportunityLineItem> items = [Select PricebookEntry.Punti_consiglio__c from OpportunityLineItem where OpportunityId =:opp.Id];
            for(OpportunityLineItem opli : items){ punti += (opli.PricebookEntry.Punti_consiglio__c == null ? 0 : opli.PricebookEntry.Punti_consiglio__c); }
        } // else {  return;  }
        // Specialista
        List<Ruolo_degli_Specialisti_Collaboratori__c> refs = [Select Referente__c from Ruolo_degli_Specialisti_Collaboratori__c 
                                                               where Opportunita__c = :opp.Id 
                                                               and (Ruolo__c = 'Specialista' or Ruolo__c = 'Specialista che consiglia')];                 
        if(refs.size() > 0){
            String refId = refs.get(0).Referente__c;
            Contact c = [SELECT Id, Punti_consiglio_totali_SS__c, Punti_consiglio_totali_SG__c  FROM Contact where Id = :refId].get(0);
            if(opp.RecordTypeId == AppSetup.recordTypeSS){
                double mpt = c.Punti_consiglio_totali_SS__c;
                c.Punti_consiglio_totali_SS__c = (mpt == null ? punti : (mpt + punti));
                update(c);
            } else if (opp.RecordTypeId == AppSetup.recordTypeSG){ 
                double mpt = c.Punti_consiglio_totali_SG__c;
                c.Punti_consiglio_totali_SG__c = (mpt == null ? punti : (mpt + punti));
                update(c);            
            }
            return;
        }
        // Professional
        if(opp.Ospedale_Punto_prelievo__c !=null){
            Account a = [SELECT Id, Punti_consiglio_totali_SS__c, Punti_consiglio_totali_SG__c FROM Account where Id = :opp.Ospedale_Punto_prelievo__c].get(0);
            if(opp.RecordTypeId == AppSetup.recordTypeSS){
                double mpt = a.Punti_consiglio_totali_SS__c;
                a.Punti_consiglio_totali_SS__c = (mpt == null ? punti : (mpt + punti));
                update(a);
            } else if (opp.RecordTypeId == AppSetup.recordTypeSG){ 
                double mpt = a.Punti_consiglio_totali_SG__c;
                a.Punti_consiglio_totali_SG__c = (mpt == null ? punti : (mpt + punti));
                update(a);
            }
            return;
        }  
    }
}