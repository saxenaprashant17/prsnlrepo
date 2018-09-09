public class CopyOpportunity {
    @InvocableMethod
    public static void CopyOpportunity(List<Opportunity> source){
        if(source == null || source.isEmpty()) return;
        Opportunity src = source.get(0);
        List<Opportunity> dests = [select ID from Opportunity where Ripetizione_di__c =: src.Id];
        if(dests.isEmpty()) {
            return;
        }
        // return;
        Opportunity dest = dests.get(0);
        
        /* RR */
        List<OpportunityContactRole> oppContacts = [Select ID, ContactId, OpportunityId, IsPrimary, IsDeleted, Role from OpportunityContactRole Where OpportunityId = :src.Id];

        List<OpportunityContactRole> opdests = oppcontacts.deepClone();
        for(OpportunityContactRole opdest : opdests){
            opdest.OpportunityId = dest.Id;
        }
        Insert(opdests);
        
        for(Ruolo_degli_Specialisti_Collaboratori__c rsrc : [select Id, Opportunita__c, Referente__c, Ruolo__c 
            from Ruolo_degli_Specialisti_Collaboratori__c where Opportunita__c = :src.Id]){
            Ruolo_degli_Specialisti_Collaboratori__c rdest = new Ruolo_degli_Specialisti_Collaboratori__c();
            rdest.Opportunita__c = dest.Id;
            rdest.Referente__c = rsrc.Referente__c;
            rdest.Ruolo__c = rsrc.Ruolo__c;
            Insert(rdest);
        }
        
        for(OpportunityLineItem isrc : [select Id, OpportunityId, PriceBookEntryId, 
            Quantity, TotalPrice, UnitPrice, ServiceDate, Description 
            from OpportunityLineItem where OpportunityId =:src.Id]){
            OpportunityLineItem idest = new OpportunityLineItem();
            idest.OpportunityId = src.Id;
            idest.PricebookEntryId = isrc.PricebookEntryId;
            idest.Quantity = isrc.Quantity;
            // idest.TotalPrice = isrc.TotalPrice;
            idest.UnitPrice = isrc.UnitPrice;
            idest.ServiceDate = isrc.ServiceDate;
            idest.Description = isrc.Description;
            Insert(idest);
        }
        // Clone quotes
       	List<Quote> srcQuotes = [Select Id, Name, OpportunityId, Pricebook2Id, ContactId, QuoteNumber, IsSyncing, ShippingHandling, Tax, Status, ExpirationDate, Description, Subtotal,
                                 TotalPrice, LineItemCount, BillingStreet,BillingCity,BillingState,BillingPostalCode,BillingCountry,ShippingStreet,ShippingCity,ShippingState,ShippingPostalCode,ShippingCountry,
                                 BillingName,ShippingName,Email,Phone,Fax,AccountId,Discount,GrandTotal,Motivazione_sconto__c, Metodo_di_pagamento_servizio__c, Modalit_di_pagamento_servizio__c,
                                 Metodo_di_pagamento_kit__c, Numero_rate__c, Maxi_rata__c, Cliente_Professional__c, Salva_Pagamento_senza_CF__c
                                 from Quote where OpportunityId = :src.Id];
        // List<Quote> destQuotes = srcQuotes.deepClone();
        
        for(Quote qsrc : srcQuotes){
            Quote qdest = qsrc.clone(false, true, false, false);
            qdest.OpportunityId = dest.Id;
            Insert(qdest);
            
            List<QuoteLineItem> srcQlis = [Select Id, LineNumber, QuoteId, PricebookEntryId, Quantity, UnitPrice, Discount, Description, 
                                       Product2Id, SortOrder, ListPrice, Subtotal, TotalPrice
                                       from QuoteLineItem where QuoteId =:qsrc.Id];
            
            List<QuoteLineItem> destQlis = srcQlis.deepClone();
            for(QuoteLineItem destQli :  destQlis){
                destQli.QuoteId = qdest.Id;
            }
            Insert(destQlis);
        }

        
    }
}