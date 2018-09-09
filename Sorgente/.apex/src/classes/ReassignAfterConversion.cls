global class ReassignAfterConversion {
    @future
    public static void processRecords(List<ID> recordIds){
        List<Account> accs = new List<Account>();
        List<Opportunity> opps = new List<Opportunity>();
        List<Lead> leads = [Select Id, OwnerId, ConvertedAccountId, ConvertedOpportunityId, IsConverted FROM Lead where id in :recordids];
        for(Lead l:leads){
            //System.debug('LeadOwnerId:' + l.OwnerId);
            //System.debug('LeadAccountId:' + l.ConvertedAccountId);
            if(!l.IsConverted) continue;
            if(l.ConvertedAccountId != null){
            	Account ac = new Account(Id = l.ConvertedAccountId, OwnerId = l.OwnerId);
            	accs.add(ac);
            }
            if(l.ConvertedOpportunityId != null){
                Opportunity op = new Opportunity(Id = l.ConvertedOpportunityId, OwnerId = l.OwnerId);
                opps.add(op);
            }
        }
        update accs; update opps;        
    }
}