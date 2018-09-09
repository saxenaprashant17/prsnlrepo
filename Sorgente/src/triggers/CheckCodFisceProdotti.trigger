trigger CheckCodFisceProdotti on Opportunity (before insert, before update, after insert, after update) {
    for(Opportunity op : Trigger.new){
        boolean checkCF = false;
        boolean checkProds = false;
        if(Trigger.IsBefore && ( op.Codice_fiscale_fatturazione__c != '' && op.Codice_fiscale_fatturazione__c != null && !op.Forza_Codice_Fiscale__c )){
            if(Trigger.IsInsert || op.Codice_fiscale_fatturazione__c != trigger.oldMap.get(op.Id).get('Codice_fiscale_fatturazione__c')){
                checkCF = true;
            }
        }
        if(Trigger.isAfter && ( op.Tipo_parto__c !='' && op.RecordTypeId == AppSetup.recordTypeSS )){
            if(Trigger.IsInsert || op.Tipo_parto__c != trigger.oldMap.get(op.Id).get('Tipo_parto__c')){
                // se non viene da ordine online
                if(op.Codice_ordine__c == null /*&& op.Numero_pratica__c==null*/){
                   checkProds = true;
                }
            }            
        }
        
        if(checkProds){

/*
Per il parto singolo:
- 6307 (Kit Singolo) o 6354 (Kit Singolo sangue e tessuto)
- 6329 (Operazioni di laboratorio)
- 6330 (Crioconservazione e restituzione)
- 6356 (Raccolta e conservazione tessuto) !!! SOLO IN CASO DI CONSERVAZIONE TESSUTO !!!

Per il parto gemellare:
- 6308 (Kit Gemellare) o 6355 (Kit Gemellare sangue e tessuto)
- 6329 (Operazioni di laboratorio)
- 6330 (Crioconservazione e restituzione)
- 6331 (Costo aggiuntivo Kit di raccolta)
- 6332 (Costo aggiuntivo operazioni di laboratorio)
- 6333 (Costo aggiuntivo crioconservazione)
- 6356 (Raccolta e conservazione tessuto) !!! SOLO IN CASO DI CONSERVAZIONE TESSUTO !!!

I prodotti "Costo aggiuntivo..." vanno aggiunti in quantità uguale a Numero Figli - 1 ... ad esempio per un trigemellare ci vuole una quantità 2, per gemellare ci vuole una quantità 1.
Il prodotto "Raccolta e conservazione tessuto" va aggiunto in quantità uguale a Numero Figli.
*/
            
            // Map pricebookentry <code><id (Unit price) >
            List<PriceBookEntry> listino = [Select Id, ProductCode, UnitPrice from PriceBookEntry where Pricebook2Id =:AppSetup.SSPricebookId];
            Map<String, PriceBookEntry> prodotti = new Map<String, PriceBookEntry>();
            for(PriceBookEntry pbe :listino){
                prodotti.put(pbe.ProductCode, pbe);
            }            
            
            List<OpportunityLineItem> olis = [SELECT Id, ProductCode, Quantity from OpportunityLineItem where OpportunityId=:op.Id];
            Map<String, OpportunityLineItem> lines = new Map<String, OpportunityLineItem>();
            for(OpportunityLineItem oli :olis){
                lines.put(oli.ProductCode, oli);
            }

            // Se non è prevista la conservazione del tessuto, elimina i prodotti di conservazione sangue e tessuto.
            //if(!op.Conservazione_tessuto__c) {
            //    Utilities.ensureProduct(op.Id, lines, prodotti, '6354', 0); // (Elimina il Kit Singolo sangue e tessuto)
            //    Utilities.ensureProduct(op.Id, lines, prodotti, '6355', 0); // (Elimina il Kit Gemellare sangue e tessuto)
            //    Utilities.ensureProduct(op.Id, lines, prodotti, '6356', 0); // (Elimina la raccolta e conservazione tessuto)
            //}
            
            // Aggiunge i prodotti di analisi e conservazione standard.
            Utilities.ensureProduct(op.Id, lines, prodotti, '6329', 1);
            Utilities.ensureProduct(op.Id, lines, prodotti, '6330', 1);

            if(op.Tipo_parto__c == 'Singolo'){
                Utilities.ensureProduct(op.Id, lines, prodotti, '6308', 0); // (Elimina il Kit Gemellare)
                Utilities.ensureProduct(op.Id, lines, prodotti, '6331', 0); // (Elimina il costo aggiuntivo Kit di raccolta)
                Utilities.ensureProduct(op.Id, lines, prodotti, '6332', 0); // (Elimina il costo aggiuntivo operazioni di laboratorio)
                Utilities.ensureProduct(op.Id, lines, prodotti, '6333', 0); // (Elimina il costo aggiuntivo crioconservazione)
				Utilities.ensureProduct(op.Id, lines, prodotti, '6307', 1);
                if(op.Conservazione_tessuto__c){
                    Utilities.ensureProduct(op.Id, lines, prodotti, '6356', 1); // (Aggiunge 1 raccolta e conservazione tessuto)
                }
            } else if(op.Tipo_parto__c == 'Gemellare') {
                Utilities.ensureProduct(op.Id, lines, prodotti, '6307', 0); // (Elimina il Kit Singolo)
                Utilities.ensureProduct(op.Id, lines, prodotti, '6308', 1); // (Aggiunge il Kit Gemellare)
                Utilities.ensureProduct(op.Id, lines, prodotti, '6331', 1); // (Aggiunge 1 costo aggiuntivo Kit di raccolta)
                Utilities.ensureProduct(op.Id, lines, prodotti, '6332', 1); // (Aggiunge 1 costo aggiuntivo operazioni di laboratorio)
                Utilities.ensureProduct(op.Id, lines, prodotti, '6333', 1); // (Aggiunge 1 costo aggiuntivo crioconservazione)
                if(op.Conservazione_tessuto__c){
                    Utilities.ensureProduct(op.Id, lines, prodotti, '6356', 2); // (Aggiunge 2 raccolta e conservazione tessuto)
                }
            } else if(op.Tipo_parto__c == 'Trigemellare') {
                Utilities.ensureProduct(op.Id, lines, prodotti, '6307', 0); // (Elimina il Kit Singolo)
                Utilities.ensureProduct(op.Id, lines, prodotti, '6308', 1); // (Aggiunge il Kit Gemellare)
                Utilities.ensureProduct(op.Id, lines, prodotti, '6331', 2); // (Aggiunge 2 costo aggiuntivo Kit di raccolta)
                Utilities.ensureProduct(op.Id, lines, prodotti, '6332', 2); // (Aggiunge 2 costo aggiuntivo operazioni di laboratorio)
                Utilities.ensureProduct(op.Id, lines, prodotti, '6333', 2); // (Aggiunge 2 costo aggiuntivo crioconservazione)
                if(op.Conservazione_tessuto__c){
                    Utilities.ensureProduct(op.Id, lines, prodotti, '6356', 3); // (Aggiunge 2 raccolta e conservazione tessuto)
                }
            } else if(op.Tipo_parto__c == 'Quadrigemellare') {
                Utilities.ensureProduct(op.Id, lines, prodotti, '6307', 0); // (Elimina il Kit Singolo)
                Utilities.ensureProduct(op.Id, lines, prodotti, '6308', 1); // (Aggiunge il Kit Gemellare)
                Utilities.ensureProduct(op.Id, lines, prodotti, '6331', 3); // (Aggiunge 3 costo aggiuntivo Kit di raccolta)
                Utilities.ensureProduct(op.Id, lines, prodotti, '6332', 3); // (Aggiunge 3 costo aggiuntivo operazioni di laboratorio)
                Utilities.ensureProduct(op.Id, lines, prodotti, '6333', 3); // (Aggiunge 3 costo aggiuntivo crioconservazione)             
                if(op.Conservazione_tessuto__c){
                    Utilities.ensureProduct(op.Id, lines, prodotti, '6356', 4); // (Aggiunge 4 raccolta e conservazione tessuto)
                }
            }
        }
        
        if(checkCF){
            Utilities.CheckResult res = Utilities.checkCodiceFiscale(op.Codice_fiscale_fatturazione__c);
            if(res.ErrorNumber!=0){
                op.addError('Codice Fiscale formalmente non corretto: ' + res.ErrorMessage);
            }
        }
    }    
}