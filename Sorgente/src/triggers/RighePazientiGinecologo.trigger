trigger RighePazientiGinecologo on Opportunity (after insert, after update) 
{
   map <String, Elenco_Pazienti__c> new_map = new map <String, Elenco_Pazienti__c>();
   
   for( Elenco_Pazienti__c p:[SELECT id, Opportunita__c, Ginecologo__c, Nome_Account__c, Punti_Consiglio__c, Stato_Paziente__c,
                                     Status_Opportunit__c
                              FROM Elenco_Pazienti__c
                              WHERE Opportunita__c IN: trigger.newMap.keySet()])
   {
      new_map.put(String.valueOf(p.Opportunita__c) + p.Stato_Paziente__c,p);
   }
    
    list <Elenco_Pazienti__c> Da_Creare = new list <Elenco_Pazienti__c>();
    list <Elenco_Pazienti__c> Da_Aggiornare = new list <Elenco_Pazienti__c>();
    list <Elenco_Pazienti__c> Da_Cancellare = new list <Elenco_Pazienti__c>();
    
    for(Opportunity opp: Trigger.new)
      {
        if(opp.RecordTypeId == Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('SS').getRecordTypeId() 
            && opp.Ginecologo__c != null && opp.Data_ordine__c >= Date.parse('01/01/2018'))
          {
            if(opp.StageName == 'In firma' || opp.StageName == 'In attesa parto' || opp.StageName == 'Preparto' || 
               opp.StageName == 'Post parto' || opp.StageName == 'Chiuso vinto')
              {
                if(new_map.containsKey(String.valueOf(opp.Id) + 'Gestito') == False && 
                   new_map.containsKey(String.valueOf(opp.Id) + 'Da gestire' ) == False)
                 {
                   Elenco_Pazienti__c new_record = new Elenco_Pazienti__c();
                   new_record.Opportunita__c = opp.Id;
                   new_record.Ginecologo__c = opp.ID_Ginecologo__c;
                   new_record.Stato_Paziente__c = 'Da gestire';
                   new_record.Punti_Consiglio__c = opp.Punti_Consiglio__c;
                   new_record.Status_Opportunit__c = opp.StageName;
                   Da_Creare.add(new_record);
                 }
                else if(new_map.containsKey(String.valueOf(opp.Id) + 'Gestito') == false && 
                          new_map.containsKey(String.valueOf(opp.Id) + 'Da gestire' ) == true)
                 { 
                    Elenco_Pazienti__c agg_record = new_map.get(String.valueOf(opp.Id) + 'Da gestire');
                    agg_record.Status_Opportunit__c = opp.StageName;
                    Da_Aggiornare.add(agg_record);
                 }
              } 
              
           if(opp.StageName == 'Chiuso perso')
            { 
              if(new_map.containsKey(String.valueOf(opp.Id) + 'Gestito') == False && new_map.containsKey(String.valueOf(opp.Id) + 'Da gestire') == True)
                {
                  Elenco_Pazienti__c canc_record = new_map.get(String.valueOf(opp.Id) + 'Da gestire');
                  Da_Cancellare.add(canc_record);
                }
              else if(new_map.containsKey(String.valueOf(opp.Id) + 'Gestito') == True && 
                      new_map.containsKey(String.valueOf(opp.Id) + 'Da gestire') == False)
                {
                  Elenco_Pazienti__c r = new_map.get(String.valueOf(opp.Id) + 'Gestito');
                  Elenco_Pazienti__c c = r.clone(False,True,False,False);
                  c.Stato_Paziente__c = 'Gestito';
                  c.Status_Opportunit__c = opp.StageName;
                  c.Punti_Consiglio__c = c.Punti_Consiglio__c * (-1);
                  Da_Creare.add(c); 
                }
              else if(new_map.containsKey(String.valueOf(opp.Id) + 'Gestito') == False && 
                      new_map.containsKey(String.valueOf(opp.Id) + 'Da gestire' ) == False)
               { 
                 Elenco_Pazienti__c new_record = new Elenco_Pazienti__c();
                 new_record.Opportunita__c = opp.Id;
                 new_record.Ginecologo__c = opp.ID_Ginecologo__c;
                 new_record.Stato_Paziente__c = 'Gestito';
                 new_record.Status_Opportunit__c = opp.StageName;
                 new_record.Punti_Consiglio__c = opp.Punti_Consiglio__c *(-1);
                 Da_Creare.add(new_record);
               }
            }
         }
      }
    insert Da_Creare;
    update Da_Aggiornare;
    delete Da_Cancellare;
}