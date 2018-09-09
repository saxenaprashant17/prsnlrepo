public class ResetFlagInvioGuida {
    public void execute(){
        Set<Id> accSet = new Set<Id>();
        for(Task t: [select Id, AccountId from Task where Subject like '%guida cartacea%' and Account.Richiesta_guida__c = true and Account.Richiesta_spedita__pc = false]){
            accSet.add(t.AccountId);
        }
        List<Account> accs = new List<Account>();
        for(Id acc: accSet){
        	Account a = new Account(Id=acc, Richiesta_spedita__pc=true);
            accs.add(a);
        }
        update accs;
    }
}