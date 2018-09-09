public with sharing class MergeOpportunitiesController{

    public List<Opportunity> availableOpportunities {get;set;}
    public String opp1Id {get;set;}
    public String opp2Id {get;set;}
    
    public MergeOpportunitiesController (){} // testing purposes
    
    public MergeOpportunitiesController(ApexPages.StandardController controller) {
        opp1Id = ApexPages.currentPage().getParameters().get('id');
        availableOpportunities = [
            SELECT Id, Name
            FROM Opportunity
            WHERE
                Id != :opp1Id
            // TODO: Add some reasonable search criteria
        ];
    }

    public PageReference mergeOpportunities() { 
        
        List<Opportunity> oppsList = [
            SELECT
                //Contract, Campaign, SyncedQuote, Pricebook2, Account, RecordType
                Id, Amount, ForecastCategoryName, CloseDate, Description, StageName, NextStep, LeadSource, Name, IsPrivate, Probability, TotalOpportunityQuantity, 
                Addizionale_trasferta_Op_Pre__c, Agente_che_fa_appuntamento__c, Analisi__c, AWB_della_spedizione_verso_cliente__c, AWB_verso_lab__c, AWB_verso_GS__c, 
                Budget_Confirmed__c, Business_Unit__c, Campione_conservato__c, Campione_raccolto__c, CAP_spedizione__c, CAP_fatturazione__c, Certificato_data_del_parto__c, 
                CheckWorkflow__c, CheckWorkflow2__c, Citt_spedizione__c, Citt_fatturazione__c, Cliente_pagante__c, Codice_campione_1__c, Codice_campione_2__c, 
                Codice_campione_3__c, Codice_campione_4__c, Codice_fiscale_fatturazione__c, Cognome_figlio__c, Non_contattare_SS__c, Nome_Numero_citofono_1__c, 
                Contratto_on_line__c, Corriere__c, Counseling_effettuato__c, Data_ora_attivazione__c, Data_ora_effettiva_parto__c, Data_ora_invio_a_SG__c, 
                Data_ora_prelievo_effettiva__c, Data_ora_prelievo_prevista__c, Data_ora_ritiro_campione__c, Data_arrivo_a_lab__c, Data_di_desiderata_ricezione__c, 
                Data_di_spedizione_desiderata__c, Data_di_spedizione_effettiva__c, Data_firma_contratto__c, Data_invio_a_lab__c, Data_pagamento_kit__c, Data_presunta_parto__c, 
                Data_prevista_arrivo_lab__c, Data_prevista_arrivo_GS__c, Data_refertazione_accettata__c, Data_refertazione_completata__c, Data_referto_comunicato__c, 
                Data_ricezione_analisi__c, Data_ricezione_a_GS__c, Data_ricezione_modulo_ASG__c, Discovery_Completed__c, Email_person_account__c, ID_opportunit__c, 
                Via_spedizione__c, Kit_utilizzato__c, Letto__c, Metodo_di_pagamento_kit__c, Modalit_di_pagamento_c__c, Loss_Reason__c, Motivazione_ripetizione__c, 
                Stato_spedizione__c, Stato_fatturazione__c, Nome_Numero_citofono__c, Nome_figlio_1__c, Nome_figlio_2__c, Nome_figlio_3__c, Nome_figlio_4__c, 
                Note_problemi_spedizione__c, N_special__c, Numero_di_telefono_spedizione__c, Numero_pratica__c, Operatore_prelievo__c, Ospedale_Punto_prelievo__c, Partita_IVA__c, 
                Piano__c, Prelievo_ripetuto__c, Problemi_con_consegna__c, Provincia_spedizione__c, Provincia_fatturazione__c, Punto_prelievo__c, 
// Provincia_prelievo_workflow__c,
                Ragione_sociale_citofono__c, Regione_Parto__c, Reparto__c, Responsabile_prevendita__c, Restituzione_Kit__c, Rilascio_nulla_osta__c, Ripetizione_di__c, 
                ROI_Analysis_Completed__c, Servic_point__c, Sottocategoria_origine__c, Spedizione_certificato__c, Stanza__c, Stato_amministrazione__c, Stato_modulistica__c, 
                Stato_referti__c, Status_analisi__c, Telefono_reperibile__c, Tipo_di_spedizione__c, Tipo_parto__c, Via_fatturazione__c, Origine__c, Agente__c
            FROM Opportunity
            WHERE Id IN (:opp1Id, :opp2Id)
            ORDER BY CreatedDate ASC LIMIT 2
        ];
        System.debug('Opp1Id:' + opp1Id + ', Opp2Id:' + opp2Id);
        Opportunity oldestOpp = oppsList.get(0);
        Opportunity mostRecentOpp = oppsList.get(1);

        
        // Can't retrieve fields
//        OldestOpp.Contract = mostRecentOpp.Contract;
//        OldestOpp.Campaign = mostRecentOpp.Campaign;
//        OldestOpp.Pricebook2 = mostRecentOpp.Pricebook2;
//        OldestOpp.Account = mostRecentOpp.Account;
//        OldestOpp.SyncedQuote = mostRecentOpp.SyncedQuote;
//        OldestOpp.RecordType = mostRecentOpp.RecordType;
        
                
        OldestOpp.Amount = mostRecentOpp.Amount;
        OldestOpp.ForecastCategoryName = mostRecentOpp.ForecastCategoryName;
        OldestOpp.CloseDate = mostRecentOpp.CloseDate;
        OldestOpp.Description = mostRecentOpp.Description;
        OldestOpp.StageName = mostRecentOpp.StageName;
        OldestOpp.NextStep = mostRecentOpp.NextStep;
        OldestOpp.LeadSource = mostRecentOpp.LeadSource;
        OldestOpp.IsPrivate = mostRecentOpp.IsPrivate;
        OldestOpp.Probability = mostRecentOpp.Probability;
        OldestOpp.TotalOpportunityQuantity = mostRecentOpp.TotalOpportunityQuantity;
        OldestOpp.Addizionale_trasferta_Op_Pre__c = mostRecentOpp.Addizionale_trasferta_Op_Pre__c;
        OldestOpp.Agente_che_fa_appuntamento__c = mostRecentOpp.Agente_che_fa_appuntamento__c;
        OldestOpp.Analisi__c = mostRecentOpp.Analisi__c;
        OldestOpp.AWB_della_spedizione_verso_cliente__c = mostRecentOpp.AWB_della_spedizione_verso_cliente__c;
        OldestOpp.AWB_verso_lab__c = mostRecentOpp.AWB_verso_lab__c;
        OldestOpp.AWB_verso_GS__c = mostRecentOpp.AWB_verso_GS__c;
        OldestOpp.Budget_Confirmed__c = mostRecentOpp.Budget_Confirmed__c;
        OldestOpp.Business_Unit__c = mostRecentOpp.Business_Unit__c;
        OldestOpp.Campione_conservato__c = mostRecentOpp.Campione_conservato__c;
        OldestOpp.Campione_raccolto__c = mostRecentOpp.Campione_raccolto__c;
        OldestOpp.CAP_spedizione__c = mostRecentOpp.CAP_spedizione__c;
        OldestOpp.CAP_fatturazione__c = mostRecentOpp.CAP_fatturazione__c;
        OldestOpp.Certificato_data_del_parto__c = mostRecentOpp.Certificato_data_del_parto__c;
        OldestOpp.CheckWorkflow__c = mostRecentOpp.CheckWorkflow__c;
        OldestOpp.CheckWorkflow2__c = mostRecentOpp.CheckWorkflow2__c;
        OldestOpp.Citt_spedizione__c = mostRecentOpp.Citt_spedizione__c;
        OldestOpp.Citt_fatturazione__c = mostRecentOpp.Citt_fatturazione__c;
        OldestOpp.Cliente_pagante__c = mostRecentOpp.Cliente_pagante__c;
        OldestOpp.Codice_campione_1__c = mostRecentOpp.Codice_campione_1__c;
        OldestOpp.Codice_campione_2__c = mostRecentOpp.Codice_campione_2__c;
        OldestOpp.Codice_campione_3__c = mostRecentOpp.Codice_campione_3__c;
        OldestOpp.Codice_campione_4__c = mostRecentOpp.Codice_campione_4__c;
        OldestOpp.Codice_fiscale_fatturazione__c = mostRecentOpp.Codice_fiscale_fatturazione__c;
        OldestOpp.Cognome_figlio__c = mostRecentOpp.Cognome_figlio__c;
        OldestOpp.Non_contattare_SS__c = mostRecentOpp.Non_contattare_SS__c;
        OldestOpp.Nome_Numero_citofono_1__c = mostRecentOpp.Nome_Numero_citofono_1__c;
        OldestOpp.Contratto_on_line__c = mostRecentOpp.Contratto_on_line__c;
        OldestOpp.Corriere__c = mostRecentOpp.Corriere__c;
        OldestOpp.Counseling_effettuato__c = mostRecentOpp.Counseling_effettuato__c;
        OldestOpp.Data_ora_attivazione__c = mostRecentOpp.Data_ora_attivazione__c;
        OldestOpp.Data_ora_effettiva_parto__c = mostRecentOpp.Data_ora_effettiva_parto__c;
        OldestOpp.Data_ora_invio_a_SG__c = mostRecentOpp.Data_ora_invio_a_SG__c;
        OldestOpp.Data_ora_prelievo_effettiva__c = mostRecentOpp.Data_ora_prelievo_effettiva__c;
        OldestOpp.Data_ora_prelievo_prevista__c = mostRecentOpp.Data_ora_prelievo_prevista__c;
        OldestOpp.Data_ora_ritiro_campione__c = mostRecentOpp.Data_ora_ritiro_campione__c;
        OldestOpp.Data_arrivo_a_lab__c = mostRecentOpp.Data_arrivo_a_lab__c;
        OldestOpp.Data_di_desiderata_ricezione__c = mostRecentOpp.Data_di_desiderata_ricezione__c;
        OldestOpp.Data_di_spedizione_desiderata__c = mostRecentOpp.Data_di_spedizione_desiderata__c;
        OldestOpp.Data_di_spedizione_effettiva__c = mostRecentOpp.Data_di_spedizione_effettiva__c;
        OldestOpp.Data_firma_contratto__c = mostRecentOpp.Data_firma_contratto__c;
        OldestOpp.Data_invio_a_lab__c = mostRecentOpp.Data_invio_a_lab__c;
        OldestOpp.Data_pagamento_kit__c = mostRecentOpp.Data_pagamento_kit__c;
        OldestOpp.Data_presunta_parto__c = mostRecentOpp.Data_presunta_parto__c;
        OldestOpp.Data_prevista_arrivo_lab__c = mostRecentOpp.Data_prevista_arrivo_lab__c;
        OldestOpp.Data_prevista_arrivo_GS__c = mostRecentOpp.Data_prevista_arrivo_GS__c;
        OldestOpp.Data_refertazione_accettata__c = mostRecentOpp.Data_refertazione_accettata__c;
        OldestOpp.Data_refertazione_completata__c = mostRecentOpp.Data_refertazione_completata__c;
        OldestOpp.Data_referto_comunicato__c = mostRecentOpp.Data_referto_comunicato__c;
        OldestOpp.Data_ricezione_analisi__c = mostRecentOpp.Data_ricezione_analisi__c;
        OldestOpp.Data_ricezione_a_GS__c = mostRecentOpp.Data_ricezione_a_GS__c;
        OldestOpp.Data_ricezione_modulo_ASG__c = mostRecentOpp.Data_ricezione_modulo_ASG__c;
        OldestOpp.Discovery_Completed__c = mostRecentOpp.Discovery_Completed__c;
        OldestOpp.Email_person_account__c = mostRecentOpp.Email_person_account__c;
        OldestOpp.ID_opportunit__c = mostRecentOpp.ID_opportunit__c;
        OldestOpp.Via_spedizione__c = mostRecentOpp.Via_spedizione__c;
        OldestOpp.Kit_utilizzato__c = mostRecentOpp.Kit_utilizzato__c;
        OldestOpp.Letto__c = mostRecentOpp.Letto__c;
        OldestOpp.Metodo_di_pagamento_kit__c = mostRecentOpp.Metodo_di_pagamento_kit__c;
        OldestOpp.Modalit_di_pagamento_c__c = mostRecentOpp.Modalit_di_pagamento_c__c;
        OldestOpp.Loss_Reason__c = mostRecentOpp.Loss_Reason__c;
        OldestOpp.Motivazione_ripetizione__c = mostRecentOpp.Motivazione_ripetizione__c;
        OldestOpp.Stato_spedizione__c = mostRecentOpp.Stato_spedizione__c;
        OldestOpp.Stato_fatturazione__c = mostRecentOpp.Stato_fatturazione__c;
        OldestOpp.Nome_Numero_citofono__c = mostRecentOpp.Nome_Numero_citofono__c;
        OldestOpp.Nome_figlio_1__c = mostRecentOpp.Nome_figlio_1__c;
        OldestOpp.Nome_figlio_2__c = mostRecentOpp.Nome_figlio_2__c;
        OldestOpp.Nome_figlio_3__c = mostRecentOpp.Nome_figlio_3__c;
        OldestOpp.Nome_figlio_4__c = mostRecentOpp.Nome_figlio_4__c;
        OldestOpp.Note_problemi_spedizione__c = mostRecentOpp.Note_problemi_spedizione__c;
        OldestOpp.N_special__c = mostRecentOpp.N_special__c;
        OldestOpp.Numero_di_telefono_spedizione__c = mostRecentOpp.Numero_di_telefono_spedizione__c;
        OldestOpp.Numero_pratica__c = mostRecentOpp.Numero_pratica__c;
        OldestOpp.Operatore_prelievo__c = mostRecentOpp.Operatore_prelievo__c;
        OldestOpp.Ospedale_Punto_prelievo__c = mostRecentOpp.Ospedale_Punto_prelievo__c;
        OldestOpp.Partita_IVA__c = mostRecentOpp.Partita_IVA__c;
        OldestOpp.Piano__c = mostRecentOpp.Piano__c;
        OldestOpp.Prelievo_ripetuto__c = mostRecentOpp.Prelievo_ripetuto__c;
        OldestOpp.Problemi_con_consegna__c = mostRecentOpp.Problemi_con_consegna__c;      
        OldestOpp.Provincia_spedizione__c = mostRecentOpp.Provincia_spedizione__c;
        OldestOpp.Provincia_fatturazione__c = mostRecentOpp.Provincia_fatturazione__c;

//        OldestOpp.Provincia_prelievo_workflow__c = mostRecentOpp.Provincia_prelievo_workflow__c;

        OldestOpp.Punto_prelievo__c = mostRecentOpp.Punto_prelievo__c;
        OldestOpp.Ragione_sociale_citofono__c = mostRecentOpp.Ragione_sociale_citofono__c;
        OldestOpp.Regione_Parto__c = mostRecentOpp.Regione_Parto__c;
        OldestOpp.Reparto__c = mostRecentOpp.Reparto__c;
        OldestOpp.Responsabile_prevendita__c = mostRecentOpp.Responsabile_prevendita__c;
        OldestOpp.Restituzione_Kit__c = mostRecentOpp.Restituzione_Kit__c;
        OldestOpp.Rilascio_nulla_osta__c = mostRecentOpp.Rilascio_nulla_osta__c;
       	OldestOpp.Ripetizione_di__c = mostRecentOpp.Ripetizione_di__c;
        OldestOpp.ROI_Analysis_Completed__c = mostRecentOpp.ROI_Analysis_Completed__c;
        OldestOpp.Servic_point__c = mostRecentOpp.Servic_point__c;
        OldestOpp.Sottocategoria_origine__c = mostRecentOpp.Sottocategoria_origine__c;
        OldestOpp.Spedizione_certificato__c = mostRecentOpp.Spedizione_certificato__c;
        OldestOpp.Stanza__c = mostRecentOpp.Stanza__c;
        OldestOpp.Stato_amministrazione__c = mostRecentOpp.Stato_amministrazione__c;
        OldestOpp.Stato_modulistica__c = mostRecentOpp.Stato_modulistica__c;
        OldestOpp.Stato_referti__c = mostRecentOpp.Stato_referti__c;
        OldestOpp.Status_analisi__c = mostRecentOpp.Status_analisi__c;
        OldestOpp.Telefono_reperibile__c = mostRecentOpp.Telefono_reperibile__c;
        OldestOpp.Tipo_di_spedizione__c = mostRecentOpp.Tipo_di_spedizione__c;
        OldestOpp.Tipo_parto__c = mostRecentOpp.Tipo_parto__c;
        OldestOpp.Via_fatturazione__c = mostRecentOpp.Via_fatturazione__c;
                
        // L'owner desiderato è sempre quello dell'app più datata
        //OldestOpp.Owner = mostRecentOpp.Owner;
        
        // Non è necessario rinominare l'opportunity
        //OldestOpp.Name = mostRecentOpp.Name;
                
        // Politiche di scelta fra valori dell'opp vecchia e nuova
        Set<String> OrigineSet = new Set<String>();
        OrigineSet.add('Programma amico');
        OrigineSet.add('Specialista');
        OrigineSet.add('Corso preparto');
        OrigineSet.add('KAM');
        OrigineSet.add('Pieghevole');
        if (!OrigineSet.contains(mostRecentOpp.Origine__c)) {
            OldestOpp.Origine__c = mostRecentOpp.Origine__c;
            OldestOpp.Agente__c = mostRecentOpp.Agente__c;
        } else {
            // Se i valori non sono nel set indicato precedentemente i valori non vengono modificati
        }

        update OldestOpp;
        delete mostRecentOpp;
        
        PageReference pageRef = new PageReference('/'+OldestOpp.Id);

//        PageReference pageRef = new PageReference('/'+opp1Id);
        return pageRef;
     }
}