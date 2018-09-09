trigger AllineaIndirizziOpportunita on Opportunity (before update) {
    
    Map<string, account> changed = new Map<string, account>();

    Map<String, String> nazioni = new Map<String, String>{
        'ITALIA' => 'Italia',
        'AUSTRIA' => 'Austria',
        'SVIZZERA' => 'Switzerland',
        'FRANCIA' => 'France',
        'MONACO' => 'Monaco',
        'PRINCIPATO DI MONACO' => 'Monaco',
        'GERMANIA' => 'Germany',
        'SPAGNA' => 'Spain',
        'INGHILTERRA' => 'United Kingdom',
        'REGNO UNITO' => 'United Kingdom'
        };
        
    for(Opportunity op : Trigger.New){
        
//        if(op.ID_Ind_fatt__c==null && op.ID_Ind_Sped__c==null){
//            continue;
//        }

        string provinciaFatturazione = null;
        if ((op.Provincia_fatturazione__c != null) && (op.Provincia_fatturazione__c != '')) {
            provinciaFatturazione = op.Provincia_fatturazione__c;
        }
        
        string statoFatturazione = '';
        if ((op.Stato_fatturazione__c != null) && (op.Stato_fatturazione__c != '')) {
            statoFatturazione = nazioni.get(op.Stato_fatturazione__c.toUpperCase());
        }

        string provinciaSpedizione = null;
        if ((op.Provincia_spedizione__c != null) && (op.Provincia_spedizione__c != '')) {
            provinciaSpedizione = op.Provincia_spedizione__c ;
        }

        string statoSpedizione = '';
        if ((op.Stato_spedizione__c != null) && (op.Stato_spedizione__c != '')) {
            statoSpedizione = nazioni.get(op.Stato_spedizione__c.toUpperCase());
        }

        Opportunity old = trigger.oldMap.get(op.Id);
        List<string> indFatt = new List<string> {'Via_fatturazione__c', 'Citt_fatturazione__c', 'Cap_fatturazione__c', 'Provincia_fatturazione__c', 'Stato_fatturazione__c'};      
        for(string f : indFatt){
            if(op.get(f)!=old.get(f)){
                string aid = null;
                if(op.ID_Ind_fatt__c!=null){
                    aid = op.ID_Ind_fatt__c;
                } else {
                    list<OpportunityContactRole> roles = [select Contact.AccountId from OpportunityContactRole where OpportunityId = :op.Id and Role = 'Madre'];
                    if(roles.size()==1){
                        aid = roles[0].Contact.AccountId;
                        op.ID_Ind_fatt__c = aid;
                    }
                }
                if(aid!=null){
                    Account a = changed.get(aid);
                    if(a!=null){
                        a.BillingStreet=op.Via_fatturazione__c;
                        a.BillingCity=op.Citt_fatturazione__c;
                        a.BillingPostalCode=op.Cap_fatturazione__c;
                        a.BillingState=provinciaFatturazione;
                        a.BillingCountry=statoFatturazione;
                    } else {
                        a = new Account(Id=aid, BillingStreet=op.Via_fatturazione__c, BillingCity=op.Citt_fatturazione__c,
                            BillingPostalCode=op.Cap_fatturazione__c, BillingState=provinciaFatturazione, BillingCountry=statoFatturazione);
                        changed.put(aid, a);
                    }
                }
                break;
            }
        }
        
        List<string> indSped = new List<string> {'Via_spedizione__c', 'Citt_spedizione__c', 'Cap_spedizione__c', 'Provincia_spedizione__c', 'Stato_spedizione__c'};
        for(string f : indSped){
            if(op.get(f)!=old.get(f)){
                string aid = null;
                if(op.ID_Ind_Sped__c!=null){
                    aid = op.ID_Ind_Sped__c;
                } else {
                    list<OpportunityContactRole> roles = [select Contact.AccountId from OpportunityContactRole where OpportunityId = :op.Id and Role = 'Madre'];
                    if(roles.size()==1){
                        aid = roles[0].Contact.AccountId;
                        op.ID_Ind_Sped__c = aid;
                    }
                }                    
                if(aid!=null){
                    Account a = changed.get(aid);
                    if(a!=null){
                        a.ShippingStreet=op.Via_spedizione__c;
                        a.ShippingCity=op.Citt_spedizione__c;
                        a.ShippingPostalCode=op.Cap_spedizione__c;
                        a.ShippingState=provinciaSpedizione;
                        a.ShippingCountry=statoSpedizione;
                    } else {
                        a = new Account(Id=aid, ShippingStreet=op.Via_spedizione__c, ShippingCity=op.Citt_spedizione__c,
                             ShippingPostalCode=op.Cap_spedizione__c, ShippingState=provinciaSpedizione, ShippingCountry=statoSpedizione);
                        changed.put(aid, a);
                    }
                }
                break;
            }
        }
    }
    update changed.values();
}