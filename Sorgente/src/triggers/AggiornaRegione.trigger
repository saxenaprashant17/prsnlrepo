trigger AggiornaRegione on Opportunity (before insert, before update) {
/*
    string Provincia = Trigger.New[0].Provincia_spedizione__c;
    string Regione = 'Da verificare';
    
    // Esegue l'aggiornamento solo se la provincia di spedizione è compilata.
    if ((Provincia != null) && (Provincia != ''))
    {
        
        do
        {
            if ('Chieti,L\'Aquila,Pescara,Teramo'.contains(Provincia))
            {
                Regione = 'Abruzzo'; break;
            }
            if ('Matera,Potenza'.contains(Provincia))
            {
                Regione = 'Basilicata'; break;
            }
            if ('Catanzaro,Cosenza,Crotone,Reggio Calabria,Vibo Valentia'.contains(Provincia))
            {
                Regione = 'Calabria'; break;
            }
            if ('Avellino,Benevento,Caserta,Napoli,Salerno'.contains(Provincia))
            {
                Regione = 'Campania'; break;
            }
            if ('Bologna,Ferrara,Forlì-Cesena,Modena,Parma,Piacenza,Ravenna,Reggio Emilia,Rimini'.contains(Provincia))
            {
                Regione = 'Emilia-Romagna'; break;
            }
            if ('Gorizia,Pordenone,Trieste,Udine'.contains(Provincia))
            {
                Regione = 'Friuli-Venezia Giulia'; break;
            }
            if ('Frosinone,Latina,Rieti,Roma,Viterbo'.contains(Provincia))
            {
                Regione = 'Lazio'; break;
            }
            if ('Genova,Imperia,La Spezia,Savona'.contains(Provincia))
            {
                Regione = 'Liguria'; break;
            }
            if ('Bergamo,Brescia,Como,Cremona,Lecco,Lodi,Mantova,Milano,Monza e Brianza,Pavia,Sondrio,Varese'.contains(Provincia))
            {
                Regione = 'Lombardia'; break;
            }
            if ('Ancona,Ascoli Piceno,Fermo,Macerata,Pesaro e Urbino'.contains(Provincia))
            {
                Regione = 'Marche'; break;
            }
            if ('Campobasso,Isernia'.contains(Provincia))
            {
                Regione = 'Molise'; break;
            }
            if ('Alessandria,Asti,Biella,Cuneo,Novara,Torino,Verbano-Cusio-Ossola,Vercelli'.contains(Provincia))
            {
                Regione = 'Piemonte'; break;
            }
            if ('Bari,Barletta-Andria-Trani,Brindisi,Foggia,Lecce,Taranto'.contains(Provincia))
            {
                Regione = 'Puglia'; break;
            }
            if ('Cagliari,Carbonia-Iglesias,Medio Campidano,Nuoro,Ogliastra,Olbia-Tempio,Oristano,Sassari'.contains(Provincia))
            {
                Regione = 'Sardegna'; break;
            }
            if ('Agrigento,Caltanissetta,Catania,Enna,Messina,Palermo,Ragusa,Siracusa,Trapani'.contains(Provincia))
            {
                Regione = 'Sicilia'; break;
            }
            if ('Arezzo,Firenze,Grosseto,Livorno,Lucca,Massa e Carrara,Pisa,Pistoia,Prato,Siena'.contains(Provincia))
            {
                Regione = 'Toscana'; break;
            }
            if ('Bolzano,Trento'.contains(Provincia))
            {
                Regione = 'Trentino-Alto Adige'; break;
            }
            if ('Perugia,Terni'.contains(Provincia))
            {
                Regione = 'Umbria'; break;
            }
            if ('Aosta'.contains(Provincia))
            {
                Regione = 'Valle d\'Aosta'; break;
            }
            if ('Belluno,Padova,Rovigo,Treviso,Venezia,Verona,Vicenza'.contains(Provincia))
            {
                Regione = 'Veneto'; break;
            }
        }
        while (false);
        
        // Se la regione dell'opportunità non corrisponde a quella calcolata, la aggiorna.
        if (Trigger.New[0].Regione__c != Regione)
        {
            Trigger.New[0].Regione__c = Regione;
        }
        
        // Seleziona l'account dell'opportunità.
        string AccountId = Trigger.New[0].AccountId;
        List<Account> a = [SELECT Id, IsPersonAccount, Regione__c FROM Account WHERE Id = :AccountId];
        
        // Se è un person account e la regione non corrisponde a quella calcolata, la aggiorna.
        if ((a[0].IsPersonAccount == true) && (a[0].Regione__c != Regione))
        {
            a[0].Regione__c = Regione;
            update a[0];
        }
        
    }
 */
}