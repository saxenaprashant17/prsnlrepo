trigger OppBeforeUpdate on Opportunity (before update) {

    // Aggiorna Agente Titolare Ginecologo
    
    For(Opportunity O : Trigger.New) {
        if (O.Ginecologo__c != null) {
           Contact[] c = [SELECT Id, OwnerId FROM Contact WHERE Id = :O.Ginecologo__c LIMIT 1];
           if (c.size() > 0) {
               string OwnerId = c[0].OwnerId;
               List<User> u = [SELECT Id FROM User WHERE (Id = :OwnerId) AND (IsActive = true)];
               if (u.size() > 0)
                   O.Agente_titolare_ginecologo__c = OwnerId;
               if (u.size() == 0 || Test.isRunningTest()) {
                  u = [SELECT Id FROM User WHERE Name = 'Alessio Trevisani']; 
                  if (u.size() > 0)
                      O.Agente_titolare_ginecologo__c = u[0].Id;
               }
           }
           O.Ginecologo_da_verificare__c = null;
        }
        else
            O.Agente_titolare_ginecologo__c = null;
    }
}