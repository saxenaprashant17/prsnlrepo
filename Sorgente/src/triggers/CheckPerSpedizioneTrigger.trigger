trigger CheckPerSpedizioneTrigger on Opportunity (before insert, before update) {
    for(Opportunity opp : Trigger.new){
        // solo SS in stato Aperto o prima
        if(opp.RecordTypeId == AppSetup.recordTypeSS && (opp.StageName==null || opp.StageName=='Aperto')){
            string status = VerificaOrdine.getWarningMessage(opp);
            if(status=='Ok'){
                opp.StageName='In firma';
            }
        }
    }
}