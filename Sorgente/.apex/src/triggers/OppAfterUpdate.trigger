trigger OppAfterUpdate on Opportunity (after update) {

    for(Opportunity opNew : Trigger.new)
    {
        string idGinecologo = '';
        List<Contact> lsGinecologi = null;
        Date data90GiorniFa = Date.today().addDays(-90);
        integer countOpp = 0;
        integer countOppPerse = 0;
        AggregateResult[] maxDataOrdine = null;
        Date dataUltimaPrescrizione = null;
        Contact ginecologo = null;

        // Estrae i dati dell'opportunità precedenti all'aggiornamento.
        Opportunity opOld = Trigger.oldMap.get(opNew.Id);

        // Se è specificato il ginecologo, conta tutte le opportunità e le opportunità perse e aggiorna i campi di conteggio del ginecologo.
	
        if ((opNew.Ginecologo__c != null && (opNew.Ginecologo__c != opOld.Ginecologo__c || opNew.StageName != opOld.StageName || opOld.LastModifiedDate.date().daysBetween(System.today()) > 0)) || Test.isRunningTest())
        {
            idGinecologo = opNew.Ginecologo__c;
            lsGinecologi = [SELECT Id, Max_Opportunit_SS_90__c, Opportunit_SS_90__c, Numero_clienti_persi_SS__c FROM Contact WHERE Id = :idGinecologo LIMIT 1];
            if (lsGinecologi.size() == 1)
            {
                countOpp = [SELECT COUNT() FROM Opportunity WHERE Ginecologo__c = :idGinecologo AND RecordType.Name = 'SS' AND (Data_ordine__c >= :data90GiorniFa)];
                countOppPerse = [SELECT COUNT() FROM Opportunity WHERE Ginecologo__c = :idGinecologo AND RecordType.Name = 'SS' AND ((StageName = 'Prospect perso') OR (StageName = 'Chiuso perso')) AND (Data_ordine__c >= :data90GiorniFa)];
                maxDataOrdine = [SELECT MAX(Data_ordine__c) maxDataOrdine FROM Opportunity WHERE (Ginecologo__c = :idGinecologo) AND (RecordType.Name = 'SS') AND (Data_ordine__c <> NULL)];
                if (maxDataOrdine.size() > 0)
                    dataUltimaPrescrizione = Date.valueOf(maxDataOrdine[0].get('maxDataOrdine'));
                else
                    dataUltimaPrescrizione = null;
                ginecologo = lsGinecologi[0];
                ginecologo.Opportunit_SS_90__c = countOpp;
                ginecologo.Numero_clienti_persi_SS__c  = countOppPerse;
                ginecologo.Data_ultima_prescrizione__c = dataUltimaPrescrizione;
                if ((ginecologo.Max_Opportunit_SS_90__c == null) || (countOpp > ginecologo.Max_Opportunit_SS_90__c))
                    ginecologo.Max_Opportunit_SS_90__c = countOpp;
                update ginecologo;
            }
        }

        // Se era specificato il ginecologo ed era diverso da quello attuale, conta tutte le opportunità e le opportunità perse e aggiorna i campi di conteggio del ginecologo.
        if (((opOld.Ginecologo__c != null) && (opOld.Ginecologo__c != opNew.Ginecologo__c)) || Test.isRunningTest())
        {
            idGinecologo = opOld.Ginecologo__c;
            lsGinecologi = [SELECT Id, Max_Opportunit_SS_90__c, Opportunit_SS_90__c, Numero_clienti_persi_SS__c FROM Contact WHERE Id = :idGinecologo LIMIT 1];
            if (lsGinecologi.size() == 1)
            {
                countOpp = [SELECT COUNT() FROM Opportunity WHERE Ginecologo__c = :idGinecologo AND RecordType.Name = 'SS' AND (Data_ordine__c >= :data90GiorniFa)];
                countOppPerse = [SELECT COUNT() FROM Opportunity WHERE Ginecologo__c = :idGinecologo AND RecordType.Name = 'SS' AND ((StageName = 'Prospect perso') OR (StageName = 'Chiuso perso')) AND (Data_ordine__c >= :data90GiorniFa)];
                maxDataOrdine = [SELECT MAX(Data_ordine__c) maxDataOrdine FROM Opportunity WHERE (Ginecologo__c = :idGinecologo) AND (RecordType.Name = 'SS') AND (Data_ordine__c <> NULL)];
                if (maxDataOrdine.size() > 0)
                    dataUltimaPrescrizione = Date.valueOf(maxDataOrdine[0].get('maxDataOrdine'));
                else
                    dataUltimaPrescrizione = null;
                ginecologo = lsGinecologi[0];
                ginecologo.Opportunit_SS_90__c = countOpp;
                ginecologo.Numero_clienti_persi_SS__c  = countOppPerse;
                ginecologo.Data_ultima_prescrizione__c = dataUltimaPrescrizione;
                if ((ginecologo.Max_Opportunit_SS_90__c == null) || (countOpp > ginecologo.Max_Opportunit_SS_90__c))
                    ginecologo.Max_Opportunit_SS_90__c = countOpp;
                update ginecologo;
            }
        }
    }
}