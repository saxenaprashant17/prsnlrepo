trigger AllineaProvinciaDaAccount on Opportunity (before insert, before update) {
    
    // Esegue l'allineamento solo se l'opportunità è in status "Aperto" e se la provincia di spedizione è vuota.
    if ((Trigger.New[0].StageName == 'Aperto') && ((Trigger.New[0].Provincia_spedizione__c == null) || (Trigger.New[0].Provincia_spedizione__c == '')))
    {
        // Seleziona l'account dell'opportunità.
        string AccountId = Trigger.New[0].AccountId;
        List<Account> a = [SELECT Id, Name, ShippingState FROM Account WHERE Id = :AccountId];
        
        // Se la provincia di spedizione dell'account è specificata, la salva in quella dell'opportunità.
        if ((a[0].ShippingState != null) || (a[0].ShippingState != ''))
        {
            Trigger.New[0].Provincia_spedizione__c = a[0].ShippingState;
        }
        
    }
 
}