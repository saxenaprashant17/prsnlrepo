global class PraticaWS {
    
    static string AccountFields = 'LastViewedDate, LastReferencedDate, ShippingStateCode, PersonOtherStateCode, PersonMailingStateCode, BillingStateCode, ShippingCountryCode, PersonOtherCountryCode, PersonMailingCountryCode, BillingCountryCode, ' +
     'Website, Type, Titolare_Lead_del__c, Tiratura__c, Tipo_prelievi__pc, Telefono_secondario__c, SystemModstamp, Status_SS__pc, Status_SS__c, Status_SG__pc, Status_SG__c, Specializzazione_specialista__pc, Sottocategoria_origine__pc, Sottocategoria_origine__c, Sottocategoria__c, ShippingStreet, ShippingState, ShippingPostalCode, ShippingCountry, ShippingCity, Servizi_proposti__pc, Salutation, Riconosci_ad_agente_del_referente__c, RecordTypeId, Punto_di_prelievo__c, Punti_consiglio_totali_SS__pc, Punti_consiglio_totali_SS__c, Punti_consiglio_totali_SG__pc, ' + 
     'Punti_consiglio_totali_SG__c, Punti_consiglio_riscattati_SS__pc, Punti_consiglio_riscattati_SS__c, Punti_consiglio_riscattati_SG__pc, Punti_consiglio_riscattati_SG__c, Privacy_3__c, Privacy_2__c, Privacy_1__c, Potenzialit_prescrittiva__pc, PhotoUrl, Phone, Personale_per_prelievo__c, PersonTitle, PersonOtherStreet, PersonOtherState, PersonOtherPostalCode, ' +
     'PersonOtherCountry, PersonOtherCity, PersonMobilePhone, PersonMailingStreet, PersonMailingState, PersonMailingPostalCode, PersonMailingCountry, PersonMailingCity, PersonLeadSource, PersonLastCUUpdateDate, PersonLastCURequestDate, PersonEmailBouncedReason, PersonEmailBouncedDate, PersonEmail, PersonDepartment, PersonContactId, Partita_IVA__pc, Partita_IVA__c, ParentId, OwnerId, Origine__pc, Origine__c, Ord_60_SG__c, Opportunit_SS_Chiuso_Perso__c, Opportunit_SS_Aperto__c, ' + 
     'Opportunit_SS_90__pc, Opportunit_SS_90__c, Opportunit_SG_Chiuso_Perso__c, Opportunit_SG_Aperto__c, Opportunit_SG_60__pc, Opportunit_SG_60__c, Numero_prelievi_ultimo_mese__pc, Numero_pazienti_annui__pc, NumberOfEmployees, Non_contattare_pazienti__c, Non_Deduplicare__c, Nome_professional__c, Nome_Numero_citofono__c, Nome_Numero_citofono_1__c, Nome_Numero_Citofono_spedizione__pc, Nome_Numero_Citofono_fatturazione__pc, Name, Motivazione_perdita_SS__pc, Motivazione_perdita_SS__c, Motivazione_perdita_SG__pc, ' +
     'Motivazione_perdita_SG__c, Monte_punti_consiglio_SS__pc, Monte_punti_consiglio_SS__c, Monte_punti_consiglio_SG__pc, Monte_punti_consiglio_SG__c, Modalit_di_pagamento__pc, Max_opportunit_SS_90__c, Max_opportunit_SG_60__c, Max_Opportunit_SS_90__pc, Max_Opportunit_SG_60__pc, MasterRecordId, Listino_prezzi__pc, Listino__c, LastName, LastModifiedDate, LastModifiedById, LastActivityDate, JigsawCompanyId, IsPersonAccount, IsDeleted, Industry, Id, ID_Referente__pc, ID_Account__c, Frequenza_pubblicazione__c, Forza_codice_fiscale__c, ' +
     'Form__c, FirstName, Email_secondaria__pc, Email_secondaria__c, Email_principale__c, Description, CreatedDate, CreatedById, Costo_per_prelievo__pc, Costo_a_refertazione__pc, Controllo_referto__c, Coniuge__c, Conferma_perdita_SS__c, Conferma_perdita_SG__c, Codice_fiscale__pc, Codice_fiscale__c, Chiusura__c, Categoria_collaboratore__pc, Business_Unit__c, Bonus_per_consiglio__pc, BillingStreet, BillingState, BillingPostalCode, BillingCountry, BillingCity, Agente__c, Addizionali_mese_precedente__pc, Struttura_abilitata_ai_parti__c, ' +
     'Data_ricontatto__c, Dettaglio_origine_aperto__c, Dettaglio_origine_sconosciuto__c, Dettaglio_professional__c, Dettaglio_origine__c, Note_per_operatore__c, Referente_programma_amico__c, Richiesta_guida__c, Richiesta_guida_telematica__c, Ruolo_creatore__c, ' +
     'Raccolta_tessuto__c, Documenti_aggiuntivi_raccolta_tessuto__c, Agente_che_fa_appuntamento__c, Titolare_ginecologo_opport_correlat__c, Regione__c, Costo_servizio_scelto__c, Tipo_di_Origine__c, Origine_definitiva__c';
        
    static string PersonAccountFields = 'LastViewedDate, LastReferencedDate, ShippingStateCode, PersonOtherStateCode, PersonMailingStateCode, BillingStateCode, ShippingCountryCode, PersonOtherCountryCode, PersonMailingCountryCode, BillingCountryCode, ' + 
     'Website, Type, Titolare_Lead_del__c, Tiratura__c, Tipo_prelievi__pc, Telefono_secondario__c, SystemModstamp, Status_SS__pc, Status_SS__c, Status_SG__pc, Status_SG__c, Specializzazione_specialista__pc, Sottocategoria_origine__pc, Sottocategoria_origine__c, Sottocategoria__c, ShippingStreet, ShippingState, ShippingPostalCode, ShippingCountry, ShippingCity, Servizi_proposti__pc, Salutation, Riconosci_ad_agente_del_referente__c, RecordTypeId, Punto_di_prelievo__c, Punti_consiglio_totali_SS__pc, Punti_consiglio_totali_SS__c, Punti_consiglio_totali_SG__pc, ' + 
     'Punti_consiglio_totali_SG__c, Punti_consiglio_riscattati_SS__pc, Punti_consiglio_riscattati_SS__c, Punti_consiglio_riscattati_SG__pc, Punti_consiglio_riscattati_SG__c, Privacy_3__c, Privacy_2__c, Privacy_1__c, Potenzialit_prescrittiva__pc, PhotoUrl, Phone, Personale_per_prelievo__c, PersonTitle, PersonOtherStreet, PersonOtherState, PersonOtherPostalCode, ' +
     'PersonOtherCountry, PersonOtherCity, PersonMobilePhone, PersonMailingStreet, PersonMailingState, PersonMailingPostalCode, PersonMailingCountry, PersonMailingCity, PersonLeadSource, PersonLastCUUpdateDate, PersonLastCURequestDate, PersonEmailBouncedReason, PersonEmailBouncedDate, PersonEmail, PersonDepartment, PersonContactId, Partita_IVA__pc, Partita_IVA__c, ParentId, OwnerId, Origine__pc, Origine__c, Ord_60_SG__c, Opportunit_SS_Chiuso_Perso__c, Opportunit_SS_Aperto__c, ' + 
     'Opportunit_SS_90__pc, Opportunit_SS_90__c, Opportunit_SG_Chiuso_Perso__c, Opportunit_SG_Aperto__c, Opportunit_SG_60__pc, Opportunit_SG_60__c, Numero_prelievi_ultimo_mese__pc, Numero_pazienti_annui__pc, NumberOfEmployees, Non_contattare_pazienti__c, Non_Deduplicare__c, Nome_professional__c, Nome_Numero_citofono__c, Nome_Numero_citofono_1__c, Nome_Numero_Citofono_spedizione__pc, Nome_Numero_Citofono_fatturazione__pc, Name, Motivazione_perdita_SS__pc, Motivazione_perdita_SS__c, Motivazione_perdita_SG__pc, ' +
     'Motivazione_perdita_SG__c, Monte_punti_consiglio_SS__pc, Monte_punti_consiglio_SS__c, Monte_punti_consiglio_SG__pc, Monte_punti_consiglio_SG__c, Modalit_di_pagamento__pc, Max_opportunit_SS_90__c, Max_opportunit_SG_60__c, Max_Opportunit_SS_90__pc, Max_Opportunit_SG_60__pc, MasterRecordId, Listino_prezzi__pc, Listino__c, LastName, LastModifiedDate, LastModifiedById, LastActivityDate, JigsawCompanyId, IsPersonAccount, IsDeleted, Industry, Id, ID_Referente__pc, ID_Account__c, Frequenza_pubblicazione__c, Forza_codice_fiscale__c, ' +
     'Form__c, FirstName, Email_secondaria__pc, Email_secondaria__c, Email_principale__c, Description, CreatedDate, CreatedById, Costo_per_prelievo__pc, Costo_a_refertazione__pc, Controllo_referto__c, Coniuge__c, Conferma_perdita_SS__c, Conferma_perdita_SG__c, Codice_fiscale__pc, Codice_fiscale__c, Chiusura__c, Categoria_collaboratore__pc, Business_Unit__c, Bonus_per_consiglio__pc, BillingStreet, BillingState, BillingPostalCode, BillingCountry, BillingCity, Agente__c, Addizionali_mese_precedente__pc, ' +
     'Data_ricontatto__c, Dettaglio_origine_aperto__c, Dettaglio_origine_sconosciuto__c, Dettaglio_professional__c, Dettaglio_origine__c, Note_per_operatore__c, Referente_programma_amico__c, Richiesta_guida__c, Richiesta_guida_telematica__c, Ruolo_creatore__c';

// MiddleName, Suffix, LastViewedDate, LastReferencedDate, MailingStateCode, MailingCountryCode
    static string ContactFields = 'LastViewedDate, LastReferencedDate, MailingStateCode, MailingCountryCode, ' +
        'Id, IsDeleted, MasterRecordId, AccountId, IsPersonAccount, LastName, FirstName, Salutation, Name, RecordTypeId, MailingStreet, MailingCity, MailingPostalCode, Phone, Fax, MobilePhone, ReportsToId, Email, Title, Department, Birthdate, OwnerId, CreatedDate, CreatedById, lastModifiedDate, LastModifiedById, SystemModstamp, LastActivityDate, LastCURequestDate, LastCUUpdateDate, EmailBouncedReason, EmailBouncedDate, IsEmailBounced, PhotoUrl, JigsawContactId, ' +
        'Addizionali_mese_precedente__c, Bonus_per_consiglio__c, Candidato__c, Categoria_collaboratore__c, Codice_fiscale__c, Conferma_perdita_SG__c, Conferma_perdita_SS__c, Controllo_referto__c, Costo_a_refertazione__c, Costo_per_prelievo__c, Effettua_prelievi__c, Email_secondaria__c, Fattura_il_professional__c, ID_Referente__c, Listino_prezzi__c, Max_Opportunit_SG_60__c, Max_Opportunit_SS_90__c, Modalit_di_pagamento__c, Monte_punti_consiglio_SG__c, Monte_punti_consiglio_SS__c, Motivazione_perdita_SG__c, Motivazione_perdita_SS__c, Nome_Numero_Citofono_fatturazione__c, Nome_Numero_Citofono_spedizione__c, Numero_pazienti_annui__c, Numero_prelievi_ultimo_mese__c, Opportunit_SG_60__c, Opportunit_SS_90__c, Origine__c, Partita_IVA__c, ' +
        'Potenzialit_prescrittiva__c, Refertazione__c, Servizi_proposti__c, Sottocategoria_origine__c, Specializzazione_specialista__c, Status_SS__c, Status_SG__c, Tipo_prelievi__c, Non_contattare_pazienti__c, Punti_consiglio_riscattati_SG__c, Punti_consiglio_riscattati_SS__c, Punti_consiglio_totali_SG__c, Punti_consiglio_totali_SS__c';
    
// LastViewedDate, LastReferencedDate   
    static string OpportunityFields = 'AWB_della_spedizione_verso_cliente__c, AWB_verso_GS__c, AWB_verso_lab__c, AccountId, Addizionale_trasferta_Op_Pre__c, Agente__c, ' +
        'Agente_che_fa_appuntamento__c, Agente_gestionale_c__c, Agente_referente__c, Agente_titolare_ginecologo__c, Amount, Analisi__c, Appuntamento_gi_fatto__c, ' +
        'Business_Unit__c, CAP_fatturazione__c, CAP_spedizione__c, CampaignId, Campione_conservato__c, Campione_raccolto__c, Canale__c, Canale_del__c, ' +
        'Cellulare_Fatturazione__c, Certificato_data_del_parto__c, CheckWorkflow2__c, CheckWorkflow__c, ' +
        'Citt_fatturazione__c, Citt_spedizione__c, Cliente_pagante__c, CloseDate, Codice_campione_1__c, Codice_campione_2__c, Codice_campione_3__c, Codice_campione_4__c, ' +
        'Codice_fiscale_fatturazione__c, Codice_ordine__c, Cognome_Fatturazione__c, Cognome_figlio__c, Cognome_spedizione__c, Conservazione_tessuto__c, Contratto_on_line__c, ' +
        'Corriere__c, Corriere_estero__c, Counseling_effettuato__c, CreatedById, CreatedDate, DPP_pi_5__c, Data_Assegnazione_Agente__c, Data_Riconoscimento_Agente__c, ' +
        'Data_arrivo_a_lab__c, Data_di_desiderata_ricezione__c, Data_di_spedizione_desiderata__c, Data_di_spedizione_effettiva__c, Data_effettiva_ricezione_kit__c, ' +
        'Data_firma_contratto__c, Data_invio_a_lab__c, Data_ora_attivazione__c, Data_ora_effettiva_parto__c, Data_ora_invio_a_SG__c, Data_ora_prelievo_effettiva__c, ' +
        'Data_ora_prelievo_prevista__c, Data_ora_ritiro_campione__c, Data_ordine__c, Data_pagamento_kit__c, Data_presunta_parto__c, Data_prevista_arrivo_GS__c, ' +
        'Data_prevista_arrivo_lab__c, Data_refertazione_accettata__c, Data_refertazione_completata__c, Data_referto_comunicato__c, Data_ricezione_a_GS__c, ' +
        'Data_ricezione_analisi__c, Data_ricezione_modulo_ASG__c, Data_ricontatto__c, Data_ricontatto_preparto__c, Data_spedizione_kit_da_decidere__c, ' +
        'Data_spedizione_screening_neonatale__c, Data_ultimo_contatto__c, Description, Descrizione_ricontatto_preparto__c, Dettaglio__c, Dettaglio_origine_aperto__c, ' +
        'Dettaglio_origine_professional__c, Dettaglio_origine_sconosciuto__c, Dettaglio_programma_amico__c, Email_Fatturazione__c, Email_person_account__c, Fiscal, FiscalQuarter, ' +
        'FiscalYear, ForecastCategory, ForecastCategoryName, Forza_Codice_Fiscale__c, Ginecologo__c, Ginecologo_da_verificare__c, Ginecologo_non_ancora_deciso__c, Giorni_da_ultimo_contatto__c, ' +
        'Giorni_mancanti__c, HasOpenActivity, HasOpportunityLineItem, HasOverdueTask, ID_Ginecologo__c, ID_Ind_Sped__c, ID_Ind_fatt__c, ID_opportunit__c, Icona__c, Id, ' +
        'Importo_maxi_rata__c, IsClosed, IsDeleted, IsWon, Kit_utilizzato__c, LastActivityDate, LastModifiedById, LastModifiedDate, LeadSource, Letto__c, ' +
        'Link_Contratto_Online__c, Link_Fattura_Kit__c, Loss_Reason__c, Metodo_di_pagamento_kit__c, Metodo_pagamento_servizio__c, Modalit_di_pagamento_c__c, ' +
        'Motivazione_Sconto__c, Motivazione_ripetizione__c, N_operatori_prelievo__c, N_special__c, Name, NextStep, Nome_Fatturazione__c, Nome_Numero_citofono_1__c, ' +
        'Nome_Numero_citofono__c, Nome_figlio_1__c, Nome_figlio_2__c, Nome_figlio_3__c, Nome_figlio_4__c, Nome_tutore_legale__c, Non_contattare_SS__c, Note_problemi_spedizione__c, ' +
        'Notifica_ordine_kit_ctr_agente__c, Numero_di_telefono_spedizione__c, Numero_pratica_DHL__c, Numero_pratica__c, Numero_rate_agevolazione__c, Operatore_prelievo__c, Opzione_Terapia__c, Origine__c, ' +
        'Origine_in_fase_di_ordine__c, Ospedale_Punto_prelievo__c, Ospedale_non_ancora_deciso__c, Ospedale_prelievo_parto__c, OwnerId, Partita_IVA__c, Parto_In_Emilia_Romagna__c, ' +
        'Piano__c, Prelievo_ripetuto__c, Pricebook2Id, Probability, Problemi_con_consegna__c, Provincia_fatturazione__c, Provincia_prelievo_workflow__c, Provincia_spedizione__c, ' +
        'Punto_prelievo__c, Ragione_sociale_citofono__c, RecordTypeId, Regione_Parto__c, Reparto__c, Responsabile_originario__c, Responsabile_prevendita__c, ' +
        'Restituzione_Kit__c, Riaperto__c, Rilascio_nulla_osta__c, Ripetizione_di__c, Sconto_Totale__c, Sconto_su_Kit__c, Sconto_su_Servizio__c, Screening_Neonatale_report__c, ' +
        'Screening_neonatale__c, Segnalazione_ginex_non_assegnato_a_SAM__c, Servic_point__c, Sottocategoria_origine__c, Sottocategoria_origine_in_fase_di_ordine__c, Spedizione_certificato__c, StageName, Stanza__c, ' +
        'Stato_amministrazione__c, Stato_fatturazione__c, Stato_modulistica__c, Stato_referti__c, Stato_spedizione__c, Status_analisi__c, SyncedQuoteId, SystemModstamp, TAT__c, ' +
        'Telefono_reperibile__c, Tempo_ricezione_analisi__c, Tipizzazione_HLA__c, Tipo_di_spedizione__c, Tipo_parto__c, Titolo_Contatto_Fatturazione__c, Titolo_Fatturazione__c, ' +
        'Type, Ultima_nota__c, Via_fatturazione__c, Via_spedizione__c, X20_anni__c';
        
    static string UserFields = 'Id, Username, LastName, FirstName, Name, Email, Phone, MobilePhone, IsActive';
    
    static string OpportunityLineItemsFields = 'Id, OpportunityId, SortOrder, PriceBookEntryId, Product2Id, ProductCode, Name, Quantity, Discount, TotalPrice, UnitPrice, ListPrice, ServiceDate, Description, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, IsDeleted';

    static string SynchronizerFields = 'Id, OwnerId, IsDeleted, Name, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, ObjectId__c, ObjectType__c, Operation__c, MigrationDate__c';

    global class Pratica {
        webService Opportunity Opportunity;
        webService Account Madre;
        webService Account Padre;
        webService Account Altro;
        webService Account Ospedale;
        webService Contact Ginecologo;
        webService Contact Specialista; // ex SpecialistaProgrammaAmico
        webService Account ProgrammaAmico;
        webService User AgenteAssegnato;
        webService User AgenteDaRiconoscere;
        webService List<OpportunityLineItem> Prodotti;
        // ...
    }
    
    
    // USER
    
    webService static User getUserById(string Id) {
        List<User> ls = database.query('SELECT Id, Username, Name, FirstName, LastName, Email, Phone, MobilePhone FROM User WHERE Id = \'' + Id + '\'');
        if (ls.isEmpty()) return null; else return ls.get(0);
    }
    
    webService static User getUserByName(string name) {
        List<User> ls = database.query('SELECT Id, Username, Name, FirstName, LastName, Email, Phone, MobilePhone FROM User WHERE Name = \'' + name + '\'');
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
    
    webService static Account getPersonAccountByExternalId(string id) {
        List<Account> ls = database.query('SELECT ' + PersonAccountFields + ' FROM Account WHERE Id_Account__c = \'' + id + '\'');
        if (ls.isEmpty()) return null; else return ls.get(0);
    }
    
    webService static Account getPersonAccountById(string id) {
        List<Account> ls = database.query('SELECT ' + PersonAccountFields + ' FROM Account WHERE Id = \'' + id + '\'');
        if (ls.isEmpty()) return null; else return ls.get(0);
    }
    
    webService static Account getPersonAccountByName(string name) {
        List<Account> ls = database.query('SELECT ' + PersonAccountFields + ' FROM Account WHERE Name = \'' + name + '\'');
        if (ls.isEmpty()) return null; else return ls.get(0);
    }
    
    
    // CONTACT
    
    webService static Contact getContactById(string Id) {
        List<Contact> ls = database.query('SELECT ' + ContactFields + ' FROM Contact WHERE Id = \'' + Id + '\'');
        if (ls.isEmpty()) return null; else return ls.get(0);
    }
    
    webService static Contact getContactByIDReferente(string IdReferente) {
        List<Contact> ls = database.query('SELECT ' + ContactFields + ' FROM Contact WHERE ID_Referente__c = \'' + IdReferente + '\'');
        if (ls.isEmpty()) return null; else return ls.get(0);
    }
    
    webService static Contact getContactByName(string name) {
        List<Contact> ls = database.query('SELECT ' + ContactFields + ' FROM Contact WHERE Name = \'' + name + '\'');
        if (ls.isEmpty()) return null; else return ls.get(0);
    }
    
    webService static Contact upsertContact(Contact c) {
        if (c != null) upsert c;
        return c;
    }


    // PRATICA

    webService static Pratica getNuovaPratica() {
        Pratica p = new Pratica();
        p.Opportunity = new Opportunity(RecordTypeId = AppSetup.recordTypeSS);
        p.Madre = new Account(RecordTypeId = AppSetup.recordTypePersonAccount);
        p.Padre = new Account(RecordTypeId = AppSetup.recordTypePersonAccount);
        p.Altro = new Account(RecordTypeId = AppSetup.recordTypePersonAccount);
        p.Ospedale = new Account(RecordTypeId = AppSetup.recordTypeProfessional);
        p.Ginecologo = new Contact(RecordTypeId = AppSetup.recordTypeSpecialista);
        p.AgenteAssegnato = new User();
        p.AgenteDaRiconoscere = new User();
        p.Prodotti = new List<OpportunityLineItem>();
        List<Pricebook2> pbs = [SELECT Id, Name FROM Pricebook2 WHERE Name = 'SS Standard'];
        if (!pbs.isEmpty()) p.Opportunity.Pricebook2Id = pbs.get(0).Id;
        return p;
    }

    
    webService static Pratica getPraticaById(string Id){
        
        Pratica p = getNuovaPratica();
        List<Opportunity> opps = database.query('SELECT ' + OpportunityFields + ' FROM Opportunity WHERE Id = \'' + Id + '\'');
        if (opps.isEmpty()) return p;
        p.Opportunity = opps.get(0);
        List<OpportunityContactRole> roles = [SELECT Id, Role, ContactId, IsPrimary, Contact.AccountId FROM OpportunityContactRole WHERE OpportunityId =:Id];
        if (!roles.isEmpty()) {
            for (OpportunityContactRole role : roles) {
                // check if IsPrimary (fatturazione)
                if (role.Contact.AccountId != null) {
                    if (role.Role == 'Madre') {
                        p.Madre = database.query('SELECT ' + PersonAccountFields + ' FROM Account WHERE Id = \'' + role.Contact.AccountId + '\'');
                    } else if (role.Role == 'Padre') {
                        p.Padre = database.query('SELECT ' + PersonAccountFields + ' FROM Account WHERE Id = \'' + role.Contact.AccountId + '\'');
                    } else {
                        // altro
                        p.Altro = database.query('SELECT ' + PersonAccountFields + ' FROM Account WHERE Id = \'' + role.Contact.AccountId + '\'');
                    }
                }
            }
        }
        // Se non ho recuperato la madre fra i ruoli dei referenti, la madre coincide con l'account dell'opportunità SOLO SE diverso dall'eventuale padre.
        if ((p.Madre == null) || (p.Madre.Id == null)) {
            Account oppAccount = database.query('SELECT ' + PersonAccountFields + ' FROM Account WHERE Id = \'' + p.Opportunity.AccountId + '\'');
            if ((p.Padre == null) || (p.Padre.Id == null)) {
                p.Madre = oppAccount;
            } else if (p.Padre.Id != oppAccount.Id) {
                p.Madre = oppAccount;
            } else {
                p.Madre = new Account(RecordTypeId = AppSetup.recordTypePersonAccount);
                p.Madre.FirstName = '* Madre *';
                p.Madre.LastName = '* ' + oppAccount.Name + ' *';
            }
            // p.Madre = database.query('SELECT ' + PersonAccountFields + ' FROM Account WHERE Id = \'' + p.Opportunity.AccountId + '\'');
        }

        // Se non ho padre o altro, creo vuoti
        if ((p.Padre == null) || (p.Padre.Id == null)) {
            p.Padre = new Account(RecordTypeId = AppSetup.recordTypePersonAccount);
        }
        if ((p.Altro == null) || (p.Altro.Id == null)) {
            p.Altro = new Account(RecordTypeId = AppSetup.recordTypePersonAccount);
        }
        
        // Ospedale
        if (p.Opportunity.Ospedale_Punto_prelievo__c == null) {
            p.Ospedale = new Account(RecordTypeId = AppSetup.recordTypeProfessional);
        } else {
            p.Ospedale = database.query('SELECT ' + AccountFields + ' FROM Account WHERE Id = \'' + p.Opportunity.Ospedale_Punto_prelievo__c + '\'');
        }
        
        // Ginecologo
        if (p.Opportunity.Ginecologo__c == null) {
            p.Ginecologo = new Contact(RecordTypeId = AppSetup.recordTypeSpecialista);
        } else {
            p.Ginecologo = database.query('SELECT ' + ContactFields + ' FROM Contact WHERE Id = \'' + p.Opportunity.Ginecologo__c + '\'');
        }
        
        // Dettaglio Specialista
        if (p.Opportunity.Dettaglio__c != null) {
            List<Contact> ls = database.query('SELECT ' + ContactFields + ' FROM Contact WHERE Id = \'' + p.Opportunity.Dettaglio__c + '\'');
            if (ls.isEmpty()) p.Specialista = null; else p.Specialista = ls.get(0);
        }

        // Dettaglio ProgrammaAmico
        if (p.Opportunity.Dettaglio_programma_amico__c != null) {
            List<Account> ls = database.query('SELECT ' + PersonAccountFields + ' FROM Account WHERE Id = \'' + p.Opportunity.Dettaglio_programma_amico__c + '\'');
            if (ls.isEmpty()) p.ProgrammaAmico = null; else p.ProgrammaAmico = ls.get(0);
        }
        
        // Agenti
        if (p.Opportunity.Agente_che_fa_appuntamento__c != null) {
            p.AgenteAssegnato = database.query('SELECT ' + UserFields + ' FROM User WHERE Id = \'' + p.Opportunity.Agente_che_fa_appuntamento__c + '\'');
        }
        if (p.Opportunity.Agente__c != null) {
            p.AgenteDaRiconoscere = database.query('SELECT ' + UserFields + ' FROM User WHERE Id = \'' + p.Opportunity.Agente__c + '\'');
        }

        // Prodotti
        p.Prodotti = database.query('SELECT ' + OpportunityLineItemsFields + ' FROM OpportunityLineItem WHERE OpportunityId = \'' + Id + '\' ORDER BY ProductCode');
        return p;
        
    }

    
    webService static Pratica getPraticaByCodiceOrdine(string codOrdine){
        List<Opportunity> opps = [SELECT Id FROM Opportunity WHERE Codice_ordine__c =:codOrdine];
        if(opps.size()==1)
            return getPraticaById(opps[0].Id);
        return getNuovaPratica();
    }

    
    webService static Pratica getPraticaByNumeroPratica(string numPratica){
        List<Opportunity> opps = [SELECT Id FROM Opportunity WHERE Numero_pratica__c =:numPratica];
        if(opps.size()==1)
            return getPraticaById(opps[0].Id);
        return getNuovaPratica();        
    }

    
    webService static Pratica getPraticaByAccountId(string accountId){
        List<Opportunity> opps = [SELECT Id FROM Opportunity WHERE AccountId =:accountId AND Business_Unit__c = 'SS' AND IsClosed = false ORDER BY CreatedDate DESC LIMIT 1];
        if(opps.size()==1)
            return getPraticaById(opps[0].Id);
        return getNuovaPratica();        
    }

    
    webService static Pratica createOpportunity(Opportunity opp, Account madre, Boolean isPrimary) {

        // Crea o aggiorna l'account della madre.        
        madre = updatePersonAccount(madre, null, null, null);
        // Recupera il listino "Standard SS".
        Pricebook2 pb = null;
        List<Pricebook2> pbs = [SELECT Id, Name FROM Pricebook2 WHERE Name = 'SS Standard' LIMIT 1];
        if(pbs.size() > 0) {
            pb = pbs[0];
        }
        // Verifica se c'è un'opporunità aperta per la madre.
        Pratica p = getPraticaByAccountId(madre.Id);
        // Se l'opportunità non esiste, usa l'opportunità passata in parametro con alcuni campi già impostati e la lega all'account della madre.
        if (p.Opportunity.Id == null) {
            p.Opportunity = opp;
            p.Opportunity.AccountId = madre.Id;
            p.Opportunity.Name = madre.FirstName + ' ' + madre.LastName;
            if (pb != null) {
                p.Opportunity.Pricebook2Id = pb.Id;
            }
            p.Madre = madre;
            upsert p.Opportunity;
        }
        // Aggiunge la madre ai referenti dell'opportunità.
        updateOpportunityContactRole(opp.Id, madre.Id, 'Madre', isPrimary);
        
        return p;
    }

    
    webService static Pratica updateOpportunity(Pratica p) {
        if ((p != null) && (p.Opportunity != null)) {
            if (p.Opportunity.RecordTypeId == null) p.Opportunity.RecordTypeId = AppSetup.recordTypeSS;
            upsert p.Opportunity;
            p = getPraticaById(p.Opportunity.Id);
        }
        return p;
    }
    
    
    webService static Account insertPersonAccount(Account a) {
        
        if (a != null) {
            if (a.RecordTypeId == null) a.RecordTypeId = AppSetup.recordTypePersonAccount;
            insert(a);
        }
        
        return a;
    }

    
    webService static Account updatePersonAccount(Account a, string opportunityId, string roleName, Boolean isPrimary) {    
        Account ac = null;
        if (a.Id != null) ac = a;
        else {
            List<Account> accs = database.query('SELECT ' + PersonAccountFields + ' FROM Account WHERE Id_Account__c = \'' + a.ID_Account__c + '\'');
            if (accs.isEmpty()) {
                ac = a;
                ac.RecordTypeId = AppSetup.recordTypePersonAccount;
            } else ac = accs.get(0);
        }
        upsert ac;
        if ((opportunityId != null) && (roleName != null)) {
            updateOpportunityContactRole(opportunityId, ac.Id, roleName, isPrimary);
        }
        return ac;
    }

    
    webService static Account getPrimaryAccount(string opportunityId) {
        Account a = null;
        List<OpportunityContactRole> ocrs = [SELECT Id, Role, ContactId, IsPrimary, Contact.AccountId FROM OpportunityContactRole WHERE OpportunityId = :opportunityId];
        if(!ocrs.isEmpty()){
            for(OpportunityContactRole role : ocrs) {
                if(role.IsPrimary) a = database.query('SELECT ' + PersonAccountFields + ' FROM Account WHERE Id = \'' + role.Contact.AccountId + '\'');
            }
        }
        return a;
    }
    
    
    webService static OpportunityContactRole updateOpportunityContactRole(string opportunityId, string AccountId, string roleName, Boolean isPrimary) {
        OpportunityContactRole ocr = null;
        List<OpportunityContactRole> ocrs = [SELECT Id, Role, ContactId, IsPrimary, Contact.AccountId FROM OpportunityContactRole WHERE OpportunityId = :opportunityId AND Role = :roleName LIMIT 1];
        if(ocrs.size() > 0) {
            ocr = ocrs[0];
        } else {
            ocr = new OpportunityContactRole();
            ocr.OpportunityId = opportunityId;
            ocr.ContactId = [SELECT Id, Name FROM Contact where AccountId = :accountId].Id;
            ocr.Role = roleName;
            if (isPrimary == null) { ocr.isPrimary = false; } else { ocr.IsPrimary = isPrimary; }
            upsert ocr;
        }
        return ocr;
    }    

    /*MailingStateCode, */
    webService static List<Contact> getGinecologi() {
        return [SELECT Id, FirstName, LastName, MailingStateCode, MailingCity, Phone, ID_Referente__c FROM Contact WHERE Specializzazione_specialista__c = 'Ginecologia' ORDER BY LastName, FirstName];
    }

    
    webService static Contact getGinecologoByCodiceUnivoco(string codiceUnivoco) {
        List<Contact> ls = database.query('SELECT ' + ContactFields + ' FROM Contact WHERE ID_Referente__c = \'' + codiceUnivoco + '\'');
        if (ls.isEmpty()) return null; else return ls.get(0);
    }

    
    webService static List<Account> getOspedali() {
        return [SELECT Id, Name, BillingCity, BillingStateCode, BillingStreet, BillingPostalCode, BillingCountryCode, ID_Account__c, Raccolta_tessuto__c FROM Account WHERE Struttura_abilitata_ai_parti__c = 'Si' ORDER BY Name];
    }

    
    webService static List<Account> getOspedaliAbilitatiParto() {
        return [SELECT Id, Name, BillingCity, BillingStateCode, BillingStreet, BillingPostalCode, BillingCountryCode, ID_Account__c, Raccolta_tessuto__c FROM Account WHERE Struttura_abilitata_ai_parti__c = 'Si' ORDER BY Name];
    }

    
    webService static List<Account> getOspedaliByStato(string siglaStato) {
        return [SELECT Id, Name, BillingCity, BillingStateCode, BillingStreet, BillingPostalCode, BillingCountryCode, ID_Account__c, Raccolta_tessuto__c FROM Account WHERE Struttura_abilitata_ai_parti__c = 'Si' AND BillingCountryCode = :siglaStato ORDER BY Name];
    }

    
    webService static List<Account> getOspedaliByProvinciaCitta(string provincia, string citta) {
        return [SELECT Id, Name, BillingCity, BillingStateCode, BillingStreet, BillingPostalCode, BillingCountryCode, ID_Account__c, Raccolta_tessuto__c FROM Account WHERE Struttura_abilitata_ai_parti__c = 'Si' AND BillingStateCode = :provincia AND BillingCity = :citta ORDER BY Name];
    }

    
    webService static Account getOspedaleByCodiceUnivoco(string codiceUnivoco) {
        List<Account> ls = database.query('SELECT ' + AccountFields + ' FROM Account WHERE Id_Account__c = \'' + codiceUnivoco + '\'');
        if (ls.isEmpty()) return null; else return ls.get(0);
    }

    
    webservice static Pratica removeProductByCode(Pratica p, string productCode) {
        List<OpportunityLineItem> prodotti = [SELECT Id FROM OpportunityLineItem WHERE ProductCode = :productCode];
        if (!prodotti.isEmpty()) {
            for (OpportunityLineItem pr : prodotti) {
                database.delete(pr.Id);
            }
        }
        return getPraticaById(p.Opportunity.Id);
    }

    
    webService static Pratica updateGenitori(Pratica p){
        List<OpportunityContactRole> ruoliPadre = [SELECT Id, Role, ContactId, IsPrimary, Contact.AccountId FROM OpportunityContactRole WHERE OpportunityId = :p.Opportunity.Id AND Role = 'Padre' LIMIT 1];
        OpportunityContactRole rolePadre = null;
        // Controllo extra perché potrebbe anche non esserci un padre (LIMIT 1 ritorna l'elemento solo se c'è almeno uno, altrimenti, va in errore)
        if((ruoliPadre != null) && (ruoliPadre.size()==1)){
            rolePadre = ruoliPadre[0];
        }
        if ((p.Padre == null) || (p.Padre.Id == null)) {
            if (rolePadre != null) {
                database.delete(rolePadre.Id);
            }
            p.Madre.Coniuge__c = null;
        } else {
            if ((p.Padre.FirstName != null) && (p.Padre.LastName != null)) {
                p.Padre.Coniuge__c = p.Madre.Id;
                upsert p.Padre;
                p.Madre.Coniuge__c = p.Padre.Id;
                if (rolePadre == null) {
                    rolePadre = new OpportunityContactRole();
                    rolePadre.OpportunityId = p.Opportunity.Id;
                    rolePadre.ContactId = [SELECT Id, Name FROM Contact where AccountId = :p.Padre.Id].Id;
                    rolePadre.Role = 'Padre';
                    rolePadre.IsPrimary = false;
                    upsert rolePadre;
                }
            }
        }
        List<OpportunityContactRole> ruoliMadre = [SELECT Id, Role, ContactId, IsPrimary, Contact.AccountId FROM OpportunityContactRole WHERE OpportunityId = :p.Opportunity.Id AND Role = 'Madre' LIMIT 1];
        OpportunityContactRole roleMadre = null;
        // Controllo extra perché potrebbe anche non esserci una madre (LIMIT 1 ritorna l'elemento solo se c'è almeno uno, altrimenti, va in errore)
        if((ruoliMadre != null) && (ruoliMadre.size()==1)){
            roleMadre = ruoliMadre[0];
        }
        if ((p.Madre == null) || (p.Madre.Id == null)) {
            if (roleMadre != null) {
                database.delete(roleMadre.Id);
            }
        } else {
            if ((p.Madre.FirstName != null) && (p.Madre.LastName != null)) {
                if (roleMadre == null) {
                    roleMadre = new OpportunityContactRole();
                    roleMadre.OpportunityId = p.Opportunity.Id;
                    roleMadre.ContactId = [SELECT Id, Name FROM Contact where AccountId = :p.Madre.Id].Id;
                    roleMadre.Role = 'Madre';
                    roleMadre.IsPrimary = false;
                    upsert roleMadre;
                }
            }
        }

        upsert p.Madre;

        return getPraticaById(p.Opportunity.Id);
    }

    
    webService static Pratica updateDatiSanitari(string opportunityId, Contact ginecologo, Account ospedale){

        Pratica p = getPraticaById(opportunityId);

        if ((ginecologo != null) && (ginecologo.LastName != null)) {
            ginecologo = upsertGinecologo(ginecologo);
            p.Opportunity.Ginecologo__c = ginecologo.Id;
            p.Opportunity.Ginecologo_non_ancora_deciso__c = false;
        } else {
            p.Opportunity.Ginecologo__c = null;
            p.Opportunity.Ginecologo_non_ancora_deciso__c = true;
        }

        if ((ospedale != null) && (ospedale.Name != null)) {
            ospedale = upsertOspedale(ospedale);
            p.Opportunity.Ospedale_Punto_prelievo__c = ospedale.Id;
            p.Opportunity.Ospedale_non_ancora_deciso__c = false;
        } else {
            p.Opportunity.Ospedale_Punto_prelievo__c = null;
            p.Opportunity.Ospedale_non_ancora_deciso__c = true;
        }
        
        upsert p.Opportunity;
        
        return getPraticaById(opportunityId);
    }

    
    webservice static Pratica updateOpportunityLineItems(Pratica p) {

        // Scorre i prodotti esistenti nel database di Salesforce. Quelli che non esistono più nella nuova lista devono essere eliminati.
        List<OpportunityLineItem> prodotti = [SELECT Id FROM OpportunityLineItem WHERE OpportunityId =:p.Opportunity.Id];
        if (!prodotti.isEmpty()) {
            for (OpportunityLineItem pr : prodotti) {
                Boolean exists = false;
                for (OpportunityLineItem oli : p.Prodotti) {
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
        for (OpportunityLineItem oli : p.Prodotti) {
            upsert oli;
        }
        
        return getPraticaById(p.Opportunity.Id);        
    }
    
    
    webService static Contact upsertGinecologo(Contact ginecologo) {
        
        if (ginecologo != null) {
            Account g;
            // Se il contact del ginecologo ha un account collegato, lo recupera, altrimenti lo crea nuovo con gli stessi dati del contact.
            if (ginecologo.AccountId != null) {
                try {
                    g = database.query('SELECT ' + AccountFields + ' FROM Account WHERE Id = \'' + ginecologo.AccountId + '\' LIMIT 1');
                } catch (Exception e) {
                    g = new Account(RecordTypeId = AppSetup.recordTypeProfessional);
                }
            } else {
                g = new Account(RecordTypeId = AppSetup.recordTypeProfessional);
            }
            if (g.Id == null) {
                g.Type = 'Studio medico';
                g.Name = 'Studio medico ' + ginecologo.FirstName + ' ' + ginecologo.LastName;
                g.Business_Unit__c = 'SS';
                if (ginecologo.MailingCountryCode != null) g.BillingCountryCode = ginecologo.MailingCountryCode;
                if (ginecologo.MailingStateCode != null) g.BillingStateCode = ginecologo.MailingStateCode;
                if (ginecologo.MailingCity != null) g.BillingCity = ginecologo.MailingCity;
                upsert g;
            }
            // Se il contact del ginecologo non ha l'account collegato, imposta l'account appena recuperato o creato.
            if (ginecologo.AccountId == null) ginecologo.AccountId = g.Id;
            if (ginecologo.RecordTypeId == null) {
                ginecologo.RecordTypeId = AppSetup.recordTypeSpecialista;
            }
            upsert(ginecologo);
        }
        
        return ginecologo;
    }
    
    
    webService static Account upsertOspedale(Account ospedale) {
        
        if (ospedale != null) {
            if (ospedale.RecordTypeId == null) {
                ospedale.RecordTypeId = AppSetup.recordTypeProfessional;
            }
            upsert(ospedale);
        }
        return ospedale;
    }

    
    // LISTINO
    
    webService static List<PricebookEntry> getListinoByName(string name) {
        return [SELECT Id, Name, Pricebook2Id, Product2Id, UnitPrice, IsActive, UseStandardPrice, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, ProductCode, IsDeleted, Prezzo_al_professional__c, Punti_Consiglio__c, Sconto_al_prezzo_per_professional__c, Soglia_sconto__c FROM PricebookEntry WHERE Pricebook2.Name = :name];
    }

    
    // SYNCHRONIZER

    webService static List<Synchronizer__c> getSynchronizer() {
        // return database.query('SELECT ' + SynchronizerFields  + ' FROM Synchronizer__c WHERE ObjectType__c = \'Opportunity\' AND MigrationDate__c = NULL AND IsDeleted = false ORDER BY Name');
        return database.query('SELECT ' + SynchronizerFields  + ' FROM Synchronizer__c WHERE MigrationDate__c = NULL AND IsDeleted = false ORDER BY Name');
    }

    
    webService static void updateSynchronizer(Synchronizer__c s) {
        if (s.Id != null) {
            s.MigrationDate__c = datetime.now();
            update s;
        }
    }
    
}