global class WebForms {
	webService static string CompleteLead(string nome, string cognome, string email, 
                                           string via, string cap, string citta, string provincia, string nazione,
                                           string telefono, date data_ricontatto, string fascia_oraria,
                                           string origine, string sottocategoria_origine, string note, boolean richiesta_guida_cartacea) {
        List<LeadQueue__c> dl = [SELECT Id from LeadQueue__c where Nome__c=:nome and Cognome__c=:cognome and email__c=:email];
        if(dl.size() > 0){
            return 'Dati Lead già in coda';
        }
        try{
            LeadQueue__c nq = new LeadQueue__c(Nome__c=nome, Cognome__c=cognome, Email__c=email, Via__c=via, Cap__c=cap, Citta__c=citta,
                Provincia__c=provincia, Nazione__c=nazione, Telefono__c=telefono, Data_ricontatto__c=data_ricontatto, Fascia_oraria__c=fascia_oraria,
                Origine__c=origine, Sottocategoria_origine__c=sottocategoria_origine, Note__c=note, Richiesta_guida_cartacea__c=richiesta_guida_cartacea);
            insert nq;
            ConciliaDatiLead(); // ci provo subito...
            return 'OK';
        } catch (Exception ex){
            return ex.getMessage();
        }
    }
    
    static public void ConciliaDatiLead(){
        List<Lead> updated = new List<Lead>();
        List<LeadQueue__c> deleted = new List<LeadQueue__c>();
        // TODO: prevedere un "timeout" dei record o una cleanup periodica
        for(LeadQueue__c lq : [SELECT Nome__c, Cognome__c, Email__c, Via__c, Cap__c, Citta__c,
                Provincia__c, Nazione__c, Telefono__c, Data_ricontatto__c, Fascia_oraria__c,
                               Origine__c, Sottocategoria_origine__c, Note__c, Richiesta_guida_cartacea__c FROM LeadQueue__c]){
			List<Lead> leads = [Select Id from Lead where FirstName=:lq.Nome__c and LastName=:lq.Cognome__c and Email=:lq.Email__c];
            if(leads.size()<=0){
            	// Not found, will try later. Consider here if record is old enough to be deleted
            	continue;
            }
            Lead cl = leads.get(0);
            if(String.isNotBlank(lq.Via__c)) cl.Street = lq.Via__c;
            if(String.isNotBlank(lq.Cap__c))cl.PostalCode = lq.Cap__c;
            if(String.isNotBlank(lq.Citta__c))cl.City = lq.Citta__c;
            if(String.isNotBlank(lq.Provincia__c))cl.StateCode = lq.Provincia__c;
            if(String.isNotBlank(lq.Nazione__c))cl.CountryCode = lq.Nazione__c;
            if(String.isNotBlank(lq.Telefono__c))cl.Phone = lq.Telefono__c;
            if(lq.Data_ricontatto__c != null) cl.Data_ora_ricontatto__c = lq.Data_ricontatto__c;
            if(String.isNotBlank(lq.Fascia_oraria__c)) cl.Fascia_Oraria__c = lq.Fascia_oraria__c;
            if(String.isNotBlank(lq.Origine__c)) cl.Origine__c = lq.Origine__c;
            if(String.isNotBlank(lq.Sottocategoria_origine__c)) cl.Sottocategoria_origine__c = lq.Sottocategoria_origine__c;
            if(String.isNotBlank(lq.Note__c)) cl.Note__c = lq.Note__c;
            if(lq.Richiesta_guida_cartacea__c !=null) cl.Richiesta_guida__c = lq.Richiesta_guida_cartacea__c;
            updated.add(cl);
            deleted.add(lq);
        }
        update updated;
        delete deleted;
    }
}