trigger AllineaProvinciaSpedizioneDaOpportunita on Account (before update) {

    // Esegue l'allineamento solo se la provincia di spedizione è vuota.
    if ((Trigger.New[0].ShippingState == null) || (Trigger.New[0].ShippingState == ''))
    {
    
        // Cerca l'opportunità più recente in status Aperto e con provincia di spedizione vuota.
        string AccountId = Trigger.New[0].Id;
        List<Opportunity> O = [SELECT Id, Provincia_spedizione__c FROM Opportunity WHERE AccountId = :AccountId AND StageName = 'Aperto' AND ((Provincia_spedizione__c <> NULL) AND (Provincia_spedizione__c <> '')) ORDER BY CreatedDate DESC LIMIT 1];

        // Se l'opportunità esiste, allinea la provincia di spedizione dell'account.
        if (O.size()==1)
        {
            Trigger.New[0].ShippingCountry = 'Italia';
            Trigger.New[0].ShippingState = O[0].Provincia_spedizione__c;
        }
        
    }

}