global class VerificaOrdine {
    webservice static String verificaOrdine(string OpportunityId){
		Opportunity opp = [Select RecordTypeId, StageName, Data_di_desiderata_ricezione__c, Data_di_spedizione_desiderata__c, Data_spedizione_kit_da_decidere__c,
                           Metodo_di_pagamento_kit__c, Regione_Parto__c, Data_presunta_parto__c, Tipo_parto__c, Codice_fiscale_fatturazione__c,
                           Via_fatturazione__c, CAP_fatturazione__c, Citt_fatturazione__c, Nome_Fatturazione__c,
                           Via_spedizione__c, CAP_spedizione__c, Citt_spedizione__c, Nome_Numero_citofono__c,
                           Numero_di_telefono_spedizione__c, Origine_in_fase_di_ordine__c, Data_ricontatto_preparto__c, Descrizione_ricontatto_preparto__c,
                           Ospedale_Punto_prelievo__c, Ospedale_non_ancora_deciso__c, Ginecologo_non_ancora_deciso__c
                           from Opportunity where Id= :OpportunityId];
        return getWarningMessage(opp);
    }
    
    public static string getWarningMessage(Opportunity opp) {
        if(opp==null) {
            return 'Id opportunità non valido';
        }
        if(opp.RecordTypeId != AppSetup.recordTypeSS){
        	return 'L\'opportunità non è di Sorgente Staminali';
        }
        if(opp.StageName!='Aperto'){
            return 'L\'opportunità non è in stato "Aperto"';
        }

        String warn='';
        if(opp.Data_di_desiderata_ricezione__c == null && opp.Data_spedizione_kit_da_decidere__c!=true){
            if(warn!='') warn+=', ';
            warn+='la Data di ricezione';
        }               
        if(opp.Data_di_spedizione_desiderata__c == null && opp.Data_spedizione_kit_da_decidere__c!=true){
            if(warn!='') warn+=', ';
            warn+='la Data di spedizione';
        }            
        if(opp.Metodo_di_pagamento_kit__c == null){
            if(warn!='') warn+=', ';
            warn+='la Modalità pagamento kit';
        }
        if(opp.Regione_Parto__c == null){
            if(warn!='') warn+=', ';
            warn+='la Regione parto';
        }
        if(opp.Data_presunta_parto__c == null){
            if(warn!='') warn+=', ';
            warn+='la data presunta del parto';
        }
        if(opp.Tipo_parto__c == null){
            if(warn!='') warn+=', ';
            warn+=' il Tipo parto';
        }           
        if(opp.Codice_fiscale_fatturazione__c == null){
            if(warn!='') warn+=', ';
            warn+='il Codice fiscale fatturazione';
        }
        // Indirizzi: testare via, cap, città e citofono (contatto sped)
        if(opp.Via_fatturazione__c == null || opp.CAP_fatturazione__c == null || opp.Citt_fatturazione__c == null || opp.Nome_Fatturazione__c == null){
            if(warn!='') warn+=', ';
            warn+='l\'indirizzo di fatturazione';
        }
        if(opp.Via_spedizione__c == null || opp.CAP_spedizione__c == null || opp.Citt_spedizione__c == null || opp.Nome_Numero_citofono__c == null){
            if(warn!='') warn+=', ';
            warn+='l\'indirizzo di spedizione';
        }
        if(opp.Numero_di_telefono_spedizione__c == null){
            if(warn!='') warn+=', ';
            warn+='il Numero di telefono spedizione';
        }
        if(opp.Origine_in_fase_di_ordine__c == null){
            if(warn!='') warn+=', ';
            warn+='l\'origine al momento dell\'ordine';
        }
        if(opp.Data_ricontatto_preparto__c == null){
            if(warn!='') warn+=', ';
            warn+='la data di ricontatto preparto';
        }
        if(opp.Descrizione_ricontatto_preparto__c == null){
            if(warn!='') warn+=', ';
            warn+='la descrizione di ricontatto preparto';
        }
        if(opp.Ospedale_Punto_prelievo__c == null && opp.Ospedale_non_ancora_deciso__c != true){
            if(warn!='') warn+=', ';
            warn+='l\'ospedale';
        }            
        boolean hasGinecologo = opp.Ginecologo_non_ancora_deciso__c == true;
        if(!hasGinecologo && [select Id from Ruolo_degli_Specialisti_Collaboratori__c where Ruolo__c='Specialista' and opportunita__c=:opp.Id].size()<=0){
            if(warn!='') warn+=', ';
            warn+='il ginecologo';                
        }
        
        boolean hasParent = false;
        boolean hasTelefono = false;
        for(OpportunityContactRole r : [SELECT Id, Role, Contact.Phone from OpportunityContactRole where OpportunityId = :opp.id]){
            if(r.Role == 'Padre' || r.Role == 'Madre'){
                hasParent = true;
                if(r.Contact.Phone !=null){
                    hasTelefono = true;
                    break;
                }
            }
        }
        if(!hasParent){
            if(warn!='') warn+=', ';
            warn+='sia il padre che la madre in ruolo dei referenti';                
        } else if(!hasTelefono){
            if(warn!='') warn+=', ';
            warn+='il numero di telefono di almeno uno dei genitori';                
        }
        
        // Prodotti
        boolean hasKit = false;
        boolean hasAnalisi = false;
        boolean hasCanone = false;
        
        for(OpportunityLineItem k : [SELECT Id, Quantity, Product2Id, ProductCode from OpportunityLineItem where OpportunityId = :opp.id]){
            if(AppSetup.KitCodes.contains(k.ProductCode) && k.Quantity > 0) hasKit = true;
            if(AppSetup.KitAnalisi.contains(k.ProductCode) && k.Quantity > 0) hasAnalisi = true;
            if(AppSetup.KitConservazione.contains(k.ProductCode) && k.Quantity > 0) hasCanone = true;
        }
        if(!hasKit){
            if(warn!='') warn+=', ';
            warn+='il KIT Staminali standard';                
        }
        if(!hasAnalisi){
            if(warn!='') warn+=', ';
            warn+='l\'Analisi di laboratorio del campione di sangue cordonale';                
        }
        if(!hasCanone){
            if(warn!='') warn+=', ';
            warn+='il Canone di conservazione ventennale del campione';                
        }
        
        if(warn!=''){         
            return 'Manca ' + warn;
        } else {
            return 'Ok';
        }
    }
}
/*
"Campi obligatori:
x ""Ruoli dei referenti"" almeno Madre o Padre
x ""Tipo parto""
x almeno 1 ""Ruolo dei referenti"" con email o telefono
x ""indirizzo fatturazione""
x ""indirizzo Spedizione""
x ""contatto spedizione""
x ""contatto fatturazione""
x Prodotti deve contenere almeno: ""kit"" ""analisi di laboratorio"" e ""canone di conservazione""
x Modalità pagamento kit
x Regione parto
x ""Codice fiscale fatturazione""
x ""origine al momento dell'ordine"""
*/
/*
x Data presunta parto
x Numero di telefono spedizione
x data di ricontatto preparto
x descrizione di ricontatto preparto
x Ospedale Punto prelievo
*/