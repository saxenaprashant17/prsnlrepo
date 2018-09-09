trigger SyncOppTriggerProdotti on OpportunityLineItem (after insert, after update, after delete) {

    Set<Id> toNotify = new Set<Id>();
    if(Trigger.isInsert || Trigger.isUpdate){
        for(OpportunityLineItem oli : Trigger.new){
            toNotify.add(oli.OpportunityId);
        }
    }
    
    if(Trigger.isDelete){
        for(OpportunityLineItem oli : Trigger.old){
            if(!toNotify.contains(oli.OpportunityId))
                toNotify.add(oli.OpportunityId);
        }        
    }
    
    List<Opportunity> opps = [SELECT Id, stageName, Numero_pratica__c from Opportunity where Id in :toNotify];
    
    for(Opportunity op : opps){
        if(op.Numero_pratica__c == null) continue;
        Utilities.syncTrigger(op.Id, 'Opportunity', 'Aggiornamento prodotti');
    }
}