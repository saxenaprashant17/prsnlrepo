trigger CheckCF on Account (before insert, before update) {
    for(Account ap : Trigger.new){
        boolean checkCF = false;
        if(ap.Codice_fiscale__c != '' && ap.Codice_fiscale__c != null && !ap.Forza_Codice_Fiscale__c){
            if(Trigger.IsInsert || ap.Codice_fiscale__c != trigger.oldMap.get(ap.Id).get('Codice_fiscale__c')){
                checkCF = true;
            }
        }
    
        if(checkCF){
            Utilities.CheckResult res = Utilities.checkCodiceFiscale(ap.Codice_fiscale__c);
            if(res.ErrorNumber!=0){
                ap.addError('Codice Fiscale formalmente non corretto: ' + res.ErrorMessage);
            }
        }
    }
}