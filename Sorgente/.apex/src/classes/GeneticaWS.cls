global class GeneticaWS {

// LastViewedDate, LastReferencedDate, ShippingStateCode, PersonOtherStateCode, PersonMailingStateCode, BillingStateCode, ShippingCountryCode, PersonOtherCountryCode, PersonMailingCountryCode, BillingCountryCode
    static string AccountFields = 'LastViewedDate, LastReferencedDate, ShippingStateCode, PersonOtherStateCode, PersonMailingStateCode, BillingStateCode, ShippingCountryCode, PersonOtherCountryCode, PersonMailingCountryCode, BillingCountryCode, ' +
     'Website, Type, Titolare_Lead_del__c, Tiratura__c, Tipo_prelievi__pc, Telefono_secondario__c, SystemModstamp, Status_SS__pc, Status_SS__c, Status_SG__pc, Status_SG__c, Specializzazione_specialista__pc, Sottocategoria_origine__pc, Sottocategoria_origine__c, Sottocategoria__c, ShippingStreet, ShippingState, ShippingPostalCode, ShippingCountry, ShippingCity, Servizi_proposti__pc, Salutation, Riconosci_ad_agente_del_referente__c, RecordTypeId, Punto_di_prelievo__c, Punti_consiglio_totali_SS__pc, Punti_consiglio_totali_SS__c, Punti_consiglio_totali_SG__pc, ' + 
     'Punti_consiglio_totali_SG__c, Punti_consiglio_riscattati_SS__pc, Punti_consiglio_riscattati_SS__c, Punti_consiglio_riscattati_SG__pc, Punti_consiglio_riscattati_SG__c, Privacy_3__c, Privacy_2__c, Privacy_1__c, Potenzialit_prescrittiva__pc, PhotoUrl, Phone, Personale_per_prelievo__c, PersonTitle, PersonOtherStreet, PersonOtherState, PersonOtherPostalCode, ' +
     'PersonOtherCountry, PersonOtherCity, PersonMobilePhone, PersonMailingStreet, PersonMailingState, PersonMailingPostalCode, PersonMailingCountry, PersonMailingCity, PersonLeadSource, PersonLastCUUpdateDate, PersonLastCURequestDate, PersonHasOptedOutOfEmail, PersonEmailBouncedReason, PersonEmailBouncedDate, PersonEmail, PersonDepartment, PersonContactId, Partita_IVA__pc, Partita_IVA__c, ParentId, OwnerId, Origine__pc, Origine__c, Ord_60_SG__c, Opportunit_SS_Chiuso_Perso__c, Opportunit_SS_Aperto__c, ' + 
     'Opportunit_SS_90__pc, Opportunit_SS_90__c, Opportunit_SG_Chiuso_Perso__c, Opportunit_SG_Aperto__c, Opportunit_SG_60__pc, Opportunit_SG_60__c, Numero_prelievi_ultimo_mese__pc, Numero_pazienti_annui__pc, NumberOfEmployees, Non_contattare_pazienti__c, Non_Deduplicare__c, Nome_professional__c, Nome_Numero_citofono__c, Nome_Numero_citofono_1__c, Nome_Numero_Citofono_spedizione__pc, Nome_Numero_Citofono_fatturazione__pc, Name, Motivazione_perdita_SS__pc, Motivazione_perdita_SS__c, Motivazione_perdita_SG__pc, ' +
     'Motivazione_perdita_SG__c, Monte_punti_consiglio_SS__pc, Monte_punti_consiglio_SS__c, Monte_punti_consiglio_SG__pc, Monte_punti_consiglio_SG__c, Modalit_di_pagamento__pc, Max_opportunit_SS_90__c, Max_opportunit_SG_60__c, Max_Opportunit_SS_90__pc, Max_Opportunit_SG_60__pc, MasterRecordId, Listino_prezzi__pc, Listino__c, LastName, LastModifiedDate, LastModifiedById, LastActivityDate, JigsawCompanyId, IsPersonAccount, IsDeleted, Industry, Id, ID_Referente__pc, ID_Account__c, Frequenza_pubblicazione__c, Forza_codice_fiscale__c, ' +
     'Form__c, FirstName, Fax, Email_secondaria__pc, Email_secondaria__c, Email_principale__c, Description, CreatedDate, CreatedById, Costo_per_prelievo__pc, Costo_a_refertazione__pc, Controllo_referto__c, Coniuge__c, Conferma_perdita_SS__c, Conferma_perdita_SG__c, Codice_fiscale__pc, Codice_fiscale__c, Chiusura__c, Categoria_collaboratore__pc, Business_Unit__c, Bonus_per_consiglio__pc, BillingStreet, BillingState, BillingPostalCode, BillingCountry, BillingCity, Agente__c, Addizionali_mese_precedente__pc, Struttura_abilitata_ai_parti__c';
// LastViewedDate, LastReferencedDate, ShippingStateCode, PersonOtherStateCode, PersonMailingStateCode, BillingStateCode, ShippingCountryCode, PersonOtherCountryCode, PersonMailingCountryCode, BillingCountryCode
    static string PersonAccountFields = 'LastViewedDate, LastReferencedDate, ShippingStateCode, PersonOtherStateCode, PersonMailingStateCode, BillingStateCode, ShippingCountryCode, PersonOtherCountryCode, PersonMailingCountryCode, BillingCountryCode, ' + 
     'Website, Type, Titolare_Lead_del__c, Tiratura__c, Tipo_prelievi__pc, Telefono_secondario__c, SystemModstamp, Status_SS__pc, Status_SS__c, Status_SG__pc, Status_SG__c, Specializzazione_specialista__pc, Sottocategoria_origine__pc, Sottocategoria_origine__c, Sottocategoria__c, ShippingStreet, ShippingState, ShippingPostalCode, ShippingCountry, ShippingCity, Servizi_proposti__pc, Salutation, Riconosci_ad_agente_del_referente__c, Refertazione__pc, RecordTypeId, Punto_di_prelievo__c, Punti_consiglio_totali_SS__pc, Punti_consiglio_totali_SS__c, Punti_consiglio_totali_SG__pc, ' + 
     'Punti_consiglio_totali_SG__c, Punti_consiglio_riscattati_SS__pc, Punti_consiglio_riscattati_SS__c, Punti_consiglio_riscattati_SG__pc, Punti_consiglio_riscattati_SG__c, Privacy_3__c, Privacy_2__c, Privacy_1__c, Potenzialit_prescrittiva__pc, PhotoUrl, Phone, Personale_per_prelievo__c, PersonTitle, PersonOtherStreet, PersonOtherState, PersonOtherPostalCode, ' +
     'PersonOtherCountry, PersonOtherCity, PersonMobilePhone, PersonMailingStreet, PersonMailingState, PersonMailingPostalCode, PersonMailingCountry, PersonMailingCity, PersonLeadSource, PersonLastCUUpdateDate, PersonLastCURequestDate, PersonHasOptedOutOfEmail, PersonEmailBouncedReason, PersonEmailBouncedDate, PersonEmail, PersonDepartment, PersonContactId, Partita_IVA__pc, Partita_IVA__c, ParentId, OwnerId, Origine__pc, Origine__c, Ord_60_SG__c, Opportunit_SS_Chiuso_Perso__c, Opportunit_SS_Aperto__c, ' + 
     'Opportunit_SS_90__pc, Opportunit_SS_90__c, Opportunit_SG_Chiuso_Perso__c, Opportunit_SG_Aperto__c, Opportunit_SG_60__pc, Opportunit_SG_60__c, Numero_prelievi_ultimo_mese__pc, Numero_pazienti_annui__pc, NumberOfEmployees, Non_contattare_pazienti__pc, Non_contattare_pazienti__c, Non_Deduplicare__c, Nome_professional__c, Nome_Numero_citofono__c, Nome_Numero_citofono_1__c, Nome_Numero_Citofono_spedizione__pc, Nome_Numero_Citofono_fatturazione__pc, Name, Motivazione_perdita_SS__pc, Motivazione_perdita_SS__c, Motivazione_perdita_SG__pc, ' +
     'Motivazione_perdita_SG__c, Monte_punti_consiglio_SS__pc, Monte_punti_consiglio_SS__c, Monte_punti_consiglio_SG__pc, Monte_punti_consiglio_SG__c, Modalit_di_pagamento__pc, Max_opportunit_SS_90__c, Max_opportunit_SG_60__c, Max_Opportunit_SS_90__pc, Max_Opportunit_SG_60__pc, MasterRecordId, Listino_prezzi__pc, Listino__c, LastName, LastModifiedDate, LastModifiedById, LastActivityDate, JigsawCompanyId, IsPersonAccount, IsDeleted, Industry, Id, ID_Referente__pc, ID_Account__c, Frequenza_pubblicazione__c, Forza_codice_fiscale__c, ' +
     'Form__c, FirstName, Fax, Fattura_il_professional__pc, Email_secondaria__pc, Email_secondaria__c, Email_principale__c, Effettua_prelievi__pc, Description, CreatedDate, CreatedById, Costo_per_prelievo__pc, Costo_a_refertazione__pc, Controllo_referto__pc, Controllo_referto__c, Coniuge__c, Conferma_perdita_SS__pc, Conferma_perdita_SS__c, Conferma_perdita_SG__pc, Conferma_perdita_SG__c, Codice_fiscale__pc, Codice_fiscale__c, Chiusura__c, Categoria_collaboratore__pc, Candidato__pc, Business_Unit__c, Bonus_per_consiglio__pc, BillingStreet, BillingState, BillingPostalCode, BillingCountry, BillingCity, Agente__c, Addizionali_mese_precedente__pc';

// MiddleName, Suffix, LastViewedDate, LastReferencedDate, MailingStateCode, MailingCountryCode
    static string ContactFields = 'LastViewedDate, LastReferencedDate, MailingStateCode, MailingCountryCode, ' +
        'Id, IsDeleted, MasterRecordId, AccountId, IsPersonAccount, LastName, FirstName, Salutation, Name, RecordTypeId, MailingStreet, MailingCity, MailingPostalCode, Phone, Fax, MobilePhone, ReportsToId, Email, Title, Department, Birthdate, OwnerId, CreatedDate, CreatedById, lastModifiedDate, LastModifiedById, SystemModstamp, LastActivityDate, LastCURequestDate, LastCUUpdateDate, EmailBouncedReason, EmailBouncedDate, IsEmailBounced, PhotoUrl, JigsawContactId, ' +
        'Addizionali_mese_precedente__c, Bonus_per_consiglio__c, Candidato__c, Categoria_collaboratore__c, Codice_fiscale__c, Conferma_perdita_SG__c, Conferma_perdita_SS__c, Controllo_referto__c, Costo_a_refertazione__c, Costo_per_prelievo__c, Effettua_prelievi__c, Email_secondaria__c, Fattura_il_professional__c, ID_Referente__c, Listino_prezzi__c, Max_Opportunit_SG_60__c, Max_Opportunit_SS_90__c, Modalit_di_pagamento__c, Monte_punti_consiglio_SG__c, Monte_punti_consiglio_SS__c, Motivazione_perdita_SG__c, Motivazione_perdita_SS__c, Nome_Numero_Citofono_fatturazione__c, Nome_Numero_Citofono_spedizione__c, Numero_pazienti_annui__c, Numero_prelievi_ultimo_mese__c, Opportunit_SG_60__c, Opportunit_SS_90__c, Origine__c, Partita_IVA__c, ' +
        'Potenzialit_prescrittiva__c, Refertazione__c, Servizi_proposti__c, Sottocategoria_origine__c, Specializzazione_specialista__c, Status_SS__c, Status_SG__c, Tipo_prelievi__c, Non_contattare_pazienti__c, Punti_consiglio_riscattati_SG__c, Punti_consiglio_riscattati_SS__c, Punti_consiglio_totali_SG__c, Punti_consiglio_totali_SS__c';
    
// LastViewedDate, LastReferencedDate   
    static string OpportunityFields = 'Via_spedizione__c, Via_fatturazione__c, Type, Titolo_Fatturazione__c, Tipo_parto__c, Tipo_di_spedizione__c, Telefono_reperibile__c, SystemModstamp, SyncedQuoteId, Status_analisi__c, Stato_spedizione__c, Stato_referti__c, Stato_modulistica__c, Stato_fatturazione__c, Stato_amministrazione__c, Stanza__c, StageName, Spedizione_certificato__c, Sottocategoria_origine__c, Servic_point__c, Sconto_su_Servizio__c, Sconto_su_Kit__c, Ripetizione_di__c, ' +
        'Rilascio_nulla_osta__c, Restituzione_Kit__c, Responsabile_prevendita__c, Reparto__c, Regione_Parto__c, RecordTypeId, Ragione_sociale_citofono__c, Punto_prelievo__c, Provincia_spedizione__c, Provincia_prelievo_workflow__c, Provincia_fatturazione__c, Problemi_con_consegna__c, Probability, Pricebook2Id, Prelievo_ripetuto__c, Piano__c, Partita_IVA__c, OwnerId, Ospedale_Punto_prelievo__c, Origine_in_fase_di_ordine__c, Origine__c, Operatore_prelievo__c, ' +
        'Numero_pratica__c, Numero_di_telefono_spedizione__c, Note_problemi_spedizione__c, Non_contattare_SS__c, Nome_tutore_legale__c, Nome_figlio_4__c, Nome_figlio_3__c, Nome_figlio_2__c, Nome_figlio_1__c, Nome_Numero_citofono__c, Cognome_spedizione__c, Nome_Numero_citofono_1__c, Nome_Fatturazione__c, NextStep, Name, N_special__c, Numero_pratica_DHL__c, N_operatori_prelievo__c, Motivazione_ripetizione__c, Motivazione_Sconto__c, Modalit_di_pagamento_c__c, Metodo_di_pagamento_kit__c, Metodo_pagamento_servizio__c, Numero_rate_agevolazione__c, Importo_maxi_rata__c, Loss_Reason__c, Letto__c, LeadSource, ' +
        'LastModifiedDate, LastModifiedById, LastActivityDate, Kit_utilizzato__c, IsWon, IsDeleted, IsClosed, Id, ID_opportunit__c, HasOverdueTask, HasOpportunityLineItem, HasOpenActivity, ForecastCategoryName, ForecastCategory, FiscalYear, FiscalQuarter, Fiscal, Email_person_account__c, Email_Fatturazione__c, Description, Data_ricezione_modulo_ASG__c, Data_ricezione_analisi__c, Data_ricezione_a_GS__c, Data_referto_comunicato__c, Data_refertazione_completata__c, Data_refertazione_accettata__c, ' +
        'Data_prevista_arrivo_lab__c, Data_prevista_arrivo_GS__c, Data_presunta_parto__c, Data_pagamento_kit__c, Data_ora_ritiro_campione__c, Data_ora_prelievo_prevista__c, Data_ora_prelievo_effettiva__c, Data_ora_invio_a_SG__c, Data_ora_effettiva_parto__c, Data_ora_attivazione__c, Data_invio_a_lab__c, Data_firma_contratto__c, Data_di_spedizione_effettiva__c, Data_di_spedizione_desiderata__c, Data_di_desiderata_ricezione__c, Data_arrivo_a_lab__c, CreatedDate, CreatedById, Counseling_effettuato__c, Corriere__c, Contratto_on_line__c, Cognome_figlio__c, ' +
        'Cognome_Fatturazione__c, Codice_ordine__c, Codice_fiscale_fatturazione__c, Codice_campione_4__c, Codice_campione_3__c, Codice_campione_2__c, Codice_campione_1__c, CloseDate, Cliente_pagante__c, Citt_spedizione__c, Citt_fatturazione__c, CheckWorkflow__c, CheckWorkflow2__c, Certificato_data_del_parto__c, Cellulare_Fatturazione__c, Campione_raccolto__c, Campione_conservato__c, CampaignId, CAP_spedizione__c, CAP_fatturazione__c, Business_Unit__c, Analisi__c, Amount, Agente_che_fa_appuntamento__c, Agente__c, Addizionale_trasferta_Op_Pre__c, AccountId, ' +
        'AWB_verso_lab__c, AWB_verso_GS__c, AWB_della_spedizione_verso_cliente__c, Link_Fattura_Kit__c, ' + 
        'Agente_gestionale_c__c, Canale_del__c, Data_ordine__c, Data_ricontatto__c, Data_spedizione_kit_da_decidere__c, Data_spedizione_screening_neonatale__c, Dettaglio_origine_aperto__c, Dettaglio_origine_sconosciuto__c, Dettaglio_origine_professional__c, Dettaglio__c, Dettaglio_programma_amico__c, ' +
        'Ginecologo__c, Ginecologo_non_ancora_deciso__c, Ospedale_non_ancora_deciso__c, Responsabile_originario__c, Titolo_Contatto_Fatturazione__c, Data_ricontatto_preparto__c, Descrizione_ricontatto_preparto__c';

    static string UserFields = 'Id, Username, LastName, FirstName, Name, Email, Phone, MobilePhone, IsActive';
    
    static string OpportunityLineItemsFields = 'Id, OpportunityId, SortOrder, PriceBookEntryId, Product2Id, ProductCode, Name, Quantity, Discount, TotalPrice, UnitPrice, ListPrice, ServiceDate, Description, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, IsDeleted';

    static string SynchronizerFields = 'Id, OwnerId, IsDeleted, Name, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, ObjectId__c, ObjectType__c, Operation__c, MigrationDate__c';

    global class GestioneCliente {
        webService Opportunity Opportunity;
        webService Account Cliente;
        webService List<OpportunityLineItem> Prodotti;
        webService User KAM;
        // ...
    }
    
    
    // USER
    
    webService static User getUserByName(string name) {
        List<User> ls = database.query('SELECT ' + UserFields + ' FROM User WHERE Name = \'' + name + '\'');
        if (ls.isEmpty()) return null; else return ls.get(0);
    }

    
    // ACCOUNT
    
    webService static Account getAccountByExternalId(string id) {
        List<Account> ls = database.query('SELECT ' + AccountFields + ' FROM Account WHERE Id_Account__c = \'' + id + '\'');
        if (ls.isEmpty()) return null; else return ls.get(0);
    }
    
    webService static Account getAccountById(string id) {
        List<Account> ls = database.query('SELECT ' + AccountFields + ' FROM Account WHERE Id = \'' + id + '\'');
        if (ls.isEmpty()) return null; else return ls.get(0);
    }
    
    webService static Account upsertAccount(Account a) {
        if (a != null) {
            upsert(a);
        }
        return a;
    }
    
    
    // GESTIONE CLIENTI
    
    webService static List<Opportunity> getNuoviOrdini() {
        List<Opportunity> ls = database.query('SELECT ' + OpportunityFields + ' FROM Opportunity WHERE RecordType.Name = \'SG\' AND Numero_pratica__c = null');
        if (ls.isEmpty()) return null; else return ls;
    }
 
    webService static GestioneCliente getNuovaGestioneCliente() {
		GestioneCliente gc = new GestioneCliente();
        gc.Opportunity = new Opportunity(RecordTypeId = AppSetup.recordTypeSG);
        gc.Cliente = new Account(RecordTypeId = AppSetup.recordTypePersonAccount);
        gc.KAM = new User();
        gc.Prodotti = new List<OpportunityLineItem>();
        List<Pricebook2> pbs = [SELECT Id, Name FROM Pricebook2 WHERE Name = 'SG Standard'];
        if (!pbs.isEmpty()) {
            gc.Opportunity.Pricebook2Id = pbs.get(0).Id;
        }
		return gc;
    }
   
    webService static GestioneCliente getGestioneClienteById(string Id) {
        
        GestioneCliente gc = getNuovaGestioneCliente();
        List<Opportunity> ls = database.query('SELECT ' + OpportunityFields + ' FROM Opportunity WHERE Id = \'' + Id + '\'');
        if (ls.isEmpty()) return gc;
        gc.Opportunity = ls.get(0);
        gc.Cliente = getAccountById(gc.Opportunity.AccountId);
        if (gc.Opportunity.Agente_che_fa_appuntamento__c != null) {
            gc.KAM = database.query('SELECT ' + UserFields + ' FROM User WHERE Id = \'' + gc.Opportunity.Agente_che_fa_appuntamento__c + '\'');
        }
        gc.Prodotti = database.query('SELECT ' + OpportunityLineItemsFields + ' FROM OpportunityLineItem WHERE OpportunityId = \'' + Id + '\' ORDER BY ProductCode');
        
        return gc;
    }
    
    webService static GestioneCliente updateOpportunity(GestioneCliente gc) {
        if ((gc != null) && (gc.Opportunity != null)) {
            if (gc.Opportunity.RecordTypeId == null) {
                gc.Opportunity.RecordTypeId = AppSetup.recordTypeSG;
            }
            upsert gc.Opportunity;
            gc = getGestioneClienteById(gc.Opportunity.Id);
        }
        return gc;
    }

    
    // PRODOTTI
    
    webservice static GestioneCliente updateOpportunityLineItems(GestioneCliente gc) {

        // Scorre i prodotti esistenti nel database di Salesforce. Quelli che non esistono più nella nuova lista devono essere eliminati.
        List<OpportunityLineItem> prodotti = [SELECT Id FROM OpportunityLineItem WHERE OpportunityId =:gc.Opportunity.Id];
        if (!prodotti.isEmpty()) {
            for (OpportunityLineItem pr : prodotti) {
                Boolean exists = false;
                for (OpportunityLineItem oli : gc.Prodotti) {
                    if (pr.Id == oli.Id) {
                        exists = true;
                    }
                }
                if (! exists) {
                    database.delete(pr.Id);
                }
            }
        }
        
        // Scorre i prodotti della nuova lista. Quelli senza Id devono essere inseriti, quelli con Id vanno aggiornati nella quantità.
        for (OpportunityLineItem oli : gc.Prodotti) {
            upsert oli;
        }
        
        return getGestioneClienteById(gc.Opportunity.Id);        
    }

    
    // LISTINO
    
    webService static List<PricebookEntry> getListinoByName(string name) {
        return [SELECT Id, Name, Pricebook2Id, Product2Id, UnitPrice, IsActive, UseStandardPrice, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, ProductCode, IsDeleted, Prezzo_al_professional__c, Punti_Consiglio__c, Sconto_al_prezzo_per_professional__c, Soglia_sconto__c FROM PricebookEntry WHERE Pricebook2.Name = :name];
    }

}