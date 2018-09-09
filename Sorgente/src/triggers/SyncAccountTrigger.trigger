trigger SyncAccountTrigger on Account (after update) {

    for (Account a : Trigger.new)
    {
        // Procede solo se il codice univoco di collegamento al Gestionale è specificato.
        if ((a.ID_Account__c != null) && (a.ID_Account__c.startsWithIgnoreCase('SSCL') || a.ID_Account__c.startsWithIgnoreCase('SSGE')))
        {
            // Se l'ultima modifica è stata effettuata dall'utente generico (Paolo Belloni), annulla la sincronizzazione per evitare effetti a catena.
            string lastModifiedById = a.LastModifiedById;
            List<User> lsu = [SELECT Id, Name FROM User WHERE Id = :lastModifiedById];
            if (lsu.size() == 0)
                continue;
            if (lsu[0].Name == 'Paolo Belloni')
                continue;

            // Recupera i dati dell'account precedenti all'aggiornamento.
            Account old = Trigger.oldMap.get(a.Id);
            
            // Scorre i campi da sincronizzare e attiva il flag di sincronizzazione sul primo campo modificato.
            Boolean datiModificati = false;
            List<string> campi = new List<string> {'FirstName', 'LastName', 
                'BillingStreet', 'BillingStateCode', 'BillingCity', 'BillingPostalCode', 'Partita_IVA__c', 'Codice_fiscale__c',
                'Phone','PersonMobilePhone','Email_principale__c','PersonEmail','Email_secondaria__pc','Fax'};
            for(string c : campi ){
                if(a.get(c)!=old.get(c)){
                    datiModificati = true;
                    break;
                }
            }

            // Se è variato almeno uno dei campi, inserisce un record nel sincronizzatore
            if (datiModificati )
            {
                Utilities.syncTrigger(a.Id, 'Account', 'Aggiornamento Dati');
                continue;
            }
        }
    }

}