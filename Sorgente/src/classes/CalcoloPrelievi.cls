public class CalcoloPrelievi {
    public void execute(){
        // Recuperare per il mese precedente, per ogni operatore prelievo, 
        // il numero di prelievi (opportunità) e rimborsi oltre i 50km (Addizionale_trasferta_Op_Pre__c)
        // Numero_prelievi_ultimo_mese__c, 	Addizionali_mese_precedente__c
        
        List<AggregateResult> op = [Select Operatore_prelievo__c from Opportunity where Data_ora_prelievo_effettiva__c = LAST_MONTH GROUP BY Operatore_prelievo__c];
            /*[Select Referente__c from Ruolo_degli_Specialisti_Collaboratori__c 
                                                          where Ruolo__c = 'Operatore prelievo'
                                                          and Opportunita__r.Data_ora_prelievo_effettiva__c = LAST_MONTH
                                                          GROUP BY Referente__c];*/
        for (AggregateResult ar : op){
            String refId = (String)ar.get('Operatore_prelievo__c'); //  'Referente__c'          
            List<AggregateResult> pr = [Select count(Id) Num, SUM(Addizionale_trasferta_Op_Pre__c) TotAdd 
                                        from Opportunity 
                                        where Data_ora_prelievo_effettiva__c = LAST_MONTH 
                                        and Operatore_prelievo__c =:refId];
                /*[Select count(Id) Num, SUM(Opportunita__r.Addizionale_trasferta_Op_Pre__c) TotAdd
                                        from Ruolo_degli_Specialisti_Collaboratori__c
                                        where Ruolo__c = 'Operatore prelievo'
                                        and Opportunita__r.Data_ora_prelievo_effettiva__c = LAST_MONTH
                                        and Referente__c =:refId
                                       ];*/
            AggregateResult agg = pr.get(0);
            // System.debug(agg.get('Num') + ' ' + agg.get('TotAdd'));
            Contact r = [SELECT Id, Numero_prelievi_ultimo_mese__c, Addizionali_mese_precedente__c FROM Contact where Id=:refId];
            r.Numero_prelievi_ultimo_mese__c = (agg.get('Num') == null) ? 0 :(Decimal)agg.get('Num');
            r.Addizionali_mese_precedente__c = (agg.get('TotAdd') == null) ? 0 :(Decimal)agg.get('TotAdd');
            Update(r);
        }

    }
}