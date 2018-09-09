public class UpdateStatusReferenti {
    public void execute(){
        List<Contact> contacts = [Select Id, Status_SG__c, Status_SS__c, Opportunit_SG_60__c, 
                                  Opportunit_SS_90__c, Motivazione_perdita_SG__c, Motivazione_perdita_SS__c, 
                                  Listino_prezzi__c, Max_Opportunit_SG_60__c, Max_Opportunit_SS_90__c, Conferma_perdita_SS__c,Conferma_perdita_SG__c 
                                  from Contact where IsPersonAccount = false and RecordTypeId = :AppSetup.recordTypeSpecialista];
        for(contact r: contacts){
            Integer sg_60 = [Select Opportunita__r.Id from Ruolo_degli_Specialisti_Collaboratori__c 
                             where Referente__c = :r.Id 
                             and (Ruolo__c = 'Specialista' or Ruolo__c = 'Specialista che consiglia') 
                             and Opportunita__r.RecordTypeId = :AppSetup.recordTypeSG
                             and  Opportunita__r.StageName != 'Chiuso da ripetere'
                             and Opportunita__r.CreatedDate = LAST_N_DAYS:60
                             GROUP BY Opportunita__r.Id].size();
            r.Opportunit_SG_60__c = sg_60;
            Integer max_sg_60 = r.Max_Opportunit_SG_60__c == null ? 0 : (Integer)r.Max_Opportunit_SG_60__c;
            if(sg_60 > max_sg_60){
                r.Max_Opportunit_SG_60__c = sg_60;
                max_sg_60 = sg_60;
            }
            
            Integer ss_90 = [Select Opportunita__r.Id from Ruolo_degli_Specialisti_Collaboratori__c 
                             where Referente__c = :r.Id 
                             and (Ruolo__c = 'Specialista' or Ruolo__c = 'Specialista che consiglia') 
                             and Opportunita__r.RecordTypeId = :AppSetup.recordTypeSS
                             and  Opportunita__r.StageName != 'Chiuso da ripetere'
                             and Opportunita__r.CreatedDate = LAST_N_DAYS:90
                             GROUP BY Opportunita__r.Id].size();
            r.Opportunit_SS_90__c = ss_90;
            Integer max_ss_90 = r.Max_Opportunit_SS_90__c == null ? 0 : (Integer)r.Max_Opportunit_SS_90__c;
            if(ss_90 > max_ss_90){
                r.Max_Opportunit_SS_90__c = ss_90;
                max_ss_90 = ss_90;
            }           
            
            // change statuses?
            // TODO: Optimize
            if(r.Listino_prezzi__c != null && 
               	( ((r.Status_SG__c == 'Da affiliare o associare' || r.Status_SG__c == 'Affiliato' || r.Status_SG__c == 'Associato') && sg_60 > 0 ) || 
                  ((r.Status_SS__c == 'Da affiliare o associare' || r.Status_SS__c == 'Affiliato' || r.Status_SS__c == 'Associato') && ss_90 > 0 ) 
                )
              ){
                Pricebook2 listino = [SELECT Id, Tipo_Listino__c, Punti_Consiglio_SS__c FROM Pricebook2 where id =:r.Listino_prezzi__c].get(0);
                if((r.Status_SG__c == 'Da affiliare o associare' || r.Status_SG__c == 'Affiliato' || r.Status_SG__c == 'Associato') && sg_60 > 0 ){
                    if(listino.Tipo_Listino__c == 'Libero') {
                        r.Status_SG__c = 'Affiliato';
                    } else {
                    	r.Status_SG__c = 'Associato';
                    }
                }
                
                if((r.Status_SS__c == 'Da affiliare o associare' || r.Status_SS__c == 'Affiliato' || r.Status_SS__c == 'Associato') && ss_90 > 0 ){
                    if(listino.Punti_Consiglio_SS__c == null || listino.Punti_Consiglio_SS__c == 0) {
                        r.Status_SS__c = 'Affiliato';
                    } else {
                    	r.Status_SS__c = 'Associato';
                    }
                }            	
            }
       
            if(r.Status_SG__c == 'Affiliato' && max_sg_60 != 0 && ( (1.0 * max_sg_60 - sg_60) / max_sg_60) >= .3  ){ r.Status_SG__c = 'Da riaffiliare'; } 
            else if(r.Status_SG__c == 'Da riaffiliare' && max_sg_60 != 0 && ( (1.0 * max_sg_60 - sg_60) / max_sg_60) < .3  ){ r.Status_SG__c = 'Affiliato'; } 
            else if(r.Status_SG__c == 'Associato' && max_sg_60 != 0 && ( (1.0 * max_sg_60 - sg_60) / max_sg_60) >= .3  ){ r.Status_SG__c = 'Da riassociare'; } 
            else if(r.Status_SG__c == 'Da riassociare' && max_sg_60 != 0 && ( (1.0 * max_sg_60 - sg_60) / max_sg_60) < .3  ){ r.Status_SG__c = 'Associato'; }
 
            if(r.Status_SS__c == 'Affiliato' && max_ss_90 != 0 && ( (1.0 * max_ss_90 - ss_90) / max_ss_90) >= .3  ){ r.Status_SS__c = 'Da riaffiliare'; } 
            else if(r.Status_SS__c == 'Da riaffiliare' && max_ss_90 != 0 && ( (1.0 * max_ss_90 - ss_90) / max_ss_90) < .3  ){ r.Status_SS__c = 'Affiliato'; } 
            else if(r.Status_SS__c == 'Associato' && max_ss_90 != 0 && ( (1.0 * max_ss_90 - ss_90) / max_ss_90) >= .3  ){ r.Status_SS__c = 'Da riassociare'; } 
            else if(r.Status_SS__c == 'Da riassociare' && max_ss_90 != 0 && ( (1.0 * max_ss_90 - ss_90) / max_ss_90) < .3  ){ r.Status_SS__c = 'Associato'; }

            
            if(r.Motivazione_perdita_SG__c != 'Inattivo' && r.Conferma_perdita_SG__c == true){
                if(r.Status_SG__c == 'Associato' || r.Status_SG__c == 'Da riassociare') r.Status_SG__c = 'Associato perso';
                if(r.Status_SG__c == 'Affiliato' || r.Status_SG__c == 'Da riaffiliare') r.Status_SG__c = 'Affiliato perso';
                if(r.Status_SG__c == 'Da affiliare o associare') r.Status_SG__c = 'Perso';
            }
            if(r.Motivazione_perdita_SG__c == 'Inattivo' && r.Conferma_perdita_SG__c == true){
                r.Status_SG__c = 'Inattivo';
            }
            if(r.Motivazione_perdita_SS__c != 'Inattivo' && r.Conferma_perdita_SS__c == true){
                if(r.Status_SS__c == 'Associato' || r.Status_SS__c == 'Da riassociare') r.Status_SS__c = 'Associato perso';
                if(r.Status_SS__c == 'Affiliato' || r.Status_SS__c == 'Da riaffiliare') r.Status_SS__c = 'Affiliato perso';
                if(r.Status_SS__c == 'Da affiliare o associare') r.Status_SS__c = 'Perso';
            }
            if(r.Motivazione_perdita_SS__c == 'Inattivo' && r.Conferma_perdita_SS__c == true){
                r.Status_SS__c = 'Inattivo';
            }
            
            update(r);
        }

   
    }
}