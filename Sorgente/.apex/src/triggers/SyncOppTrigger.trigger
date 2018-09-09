trigger SyncOppTrigger on Opportunity (after update) {
    for(Opportunity op : Trigger.new){
        Opportunity old = trigger.oldMap.get(op.Id);
        if(op.StageName == 'In firma' && old.get('StageName') != 'In firma'){
            // Nuovo ordine
            Utilities.syncTrigger(op.Id, 'Opportunity', 'Nuovo Ordine');
            continue;
        }
        if((op.StageName == 'Prospect perso' && old.get('StageName') != 'Prospect perso') && op.Numero_pratica__c != ''){
            // Prospect perso
            Utilities.syncTrigger(op.Id, 'Opportunity', 'Prospect perso');
            continue;
        }
        Boolean varSpedizione = false;
        List<string> fieldsSpedizione = new List<string> {'Nome_Numero_citofono__c', 'Cognome_spedizione__c', 'Ragione_sociale_citofono__c', 
            'Via_spedizione__c', 'Citt_spedizione__c', 'Provincia_spedizione__c', 'CAP_spedizione__c', 'Stato_spedizione__c'};
        for(string f : fieldsSpedizione){
            if(op.get(f)!=old.get(f)){
                varSpedizione = true;
                break;
            }
        }
        Boolean varFatturazione = false;
        List<string> fieldsFatturazione = new List<string> {'Titolo_Contatto_Fatturazione__c', 'Nome_Fatturazione__c', 'Cognome_Fatturazione__c', 
            'Via_fatturazione__c', 'Citt_fatturazione__c', 'Provincia_fatturazione__c', 'CAP_fatturazione__c', 'Stato_fatturazione__c', 
            'Codice_fiscale_fatturazione__c', 'Partita_IVA__c', 'Metodo_di_pagamento_kit__c'};
        for(string f : fieldsFatturazione){
            if(op.get(f)!=old.get(f)){
                varFatturazione = true;
                break;
            }
        }
        Boolean varSpedizioneKit = false;
        List<string> fieldsSpedizioneKit = new List<string> {'Data_di_spedizione_desiderata__c', 'Data_di_desiderata_ricezione__c', 'Tipo_di_spedizione__c', 
            'Numero_di_telefono_spedizione__c', 'Email_person_account__c', 'Data_ricontatto_preparto__c', 'Descrizione_ricontatto_preparto__c'};
        for(string f : fieldsSpedizioneKit){
            if(op.get(f)!=old.get(f)){
                varSpedizioneKit = true;
                break;
            }
        }
        if (((op.StageName == 'In firma') || (op.StageName == 'Preparto') || (op.StageName == 'In attesa parto') || (op.StageName == 'Post parto')) && 
            (op.Numero_pratica__c != null) && (varSpedizione || varFatturazione || varSpedizioneKit)) {
            // Aggiornamento ordine
            Utilities.syncTrigger(op.Id, 'Opportunity', 'Aggiornamento Ordine');
            continue;
        }
/*        
        if(op.AWB_della_spedizione_verso_cliente__c != old.get('AWB_della_spedizione_verso_cliente__c')){
            // AWB Spedizione
            Utilities.syncTrigger(op.Id, 'Opportunity', 'Codici AWB');  
        }

        if(op.Data_firma_contratto__c != old.get('Data_firma_contratto__c')){
            // Data Firma Contratto
            Utilities.syncTrigger(op.Id, 'Opportunity', 'Data firma contratto');
        }
        
        // Aggiornamento preparto        
        List<string> fieldsPreparto = new List<string> {'Analisi__c', 'Stato_modulistica__c', 'Stato_referti__c', 'Rilascio_nulla_osta__c', 'Certificato_data_del_parto__c',
        'Counseling_effettuato__c', 'Data_firma_contratto__c', 'Contratto_on_line__c', 'Metodo_pagamento_servizio__c', 'Restituzione_Kit__c', 'Numero_rate_agevolazione__c'};
        for(string f : fieldsPreparto){
            if(op.get(f)!=old.get(f)){
                Utilities.syncTrigger(op.Id, 'Opportunity', 'Aggiornamento preparto');
                break;
            }
        }

        // Aggiornamento parto
        List<string> fieldsParto = new List<string> {'Nome_figlio_1__c', 'Nome_figlio_2__c', 'Nome_figlio_3__c', 'Nome_figlio_4__c', 'Campione_raccolto__c', 'Kit_utilizzato__c',
            'Data_ora_effettiva_parto__c', 'Data_ora_attivazione__c', 'Reparto__c', 'Piano__c', 'Stanza__c', 'Letto__c', 'Corriere__c', 'Telefono_reperibile__c'};
        for(string f : fieldsParto){
            if(op.get(f)!=old.get(f)){
                Utilities.syncTrigger(op.Id, 'Opportunity', 'Aggiornamento parto');
                break;
            }
        }
*/       
        // Spedizione a cliente
        // Spedizione a laboratorio
        
        // Aggiornamento prodotti
         
        
    }
}