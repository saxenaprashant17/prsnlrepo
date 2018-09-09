trigger MailMerge on Task (after insert) {

List<Id> contactIds = new List<Id>();
List<Id> accountIds = new List<Id>();

for(Task c : Trigger.new){
System.debug('Task Deatil ' + c);
System.debug('Task Subject ' + c.subject);
if(c.subject.contains('Modello stampa busta guida cartacea')|| c.subject.contains('merge')||  c.subject.contains('Merge'))
{
contactIds.add(c.whoId);
accountIds.add(c.AccountId);
System.debug(c.whoid);
System.debug(c.AccountId);
}
}

List<Contact>  selectCon = [select id, Richiesta_spedita__c  from contact where id in :contactIds];
List<Contact> lstcon=new List<Contact>();
for(Contact con:selectCon)
{
con.Richiesta_spedita__c = true;
lstcon.add(con);
}    
update lstcon;

List<Account>  selectAcc = [select id, Richiesta_spedita__pc from Account where id in :accountIds];
List<Account> lstacc=new List<Account>();
for(Account acc:selectAcc)
{
acc.Richiesta_spedita__pc = true;
lstacc.add(acc);
} 
 
update lstacc; 
}