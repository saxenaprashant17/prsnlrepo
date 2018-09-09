public class SearchdupesController {
	Public String Name = System.currentPagereference().getParameters().get('name');
	Public String FirstName = System.currentPagereference().getParameters().get('firstname');
	Public String LastName = System.currentPagereference().getParameters().get('lastname');
	Public String AccountId = System.currentPagereference().getParameters().get('Id');
    
    public string getName(){ return Name; }
    public string getFirstName(){ return FirstName; }
    public string getLastName(){ return LastName; }
    
    Public List<Account> accList;
    Public List<Contact> conList;
    
    public List<Account> getAccounts(){ return accList; }
    public List<Contact> getContacts(){ return conList; }
    
    public SearchdupesController(){
        String searchString='';
        if(FirstName == null) {
                searchString = LastName;
            } else {
                if(LastName == null){
                    searchString = FirstName;
                } else {
                    searchString = FirstName + ' ' + LastName;
                }
            }
            List<list<SObject>> res = [FIND :searchString IN NAME FIELDS RETURNING Account (Id, Name, FirstName, LastName WHERE IsPersonAccount = true and Id<>:AccountId), Contact(Id, Name, FirstName, LastName WHERE IsPersonAccount=false)/*, Lead(Id WHERE IsConverted=false)*/];
            accList = ((List<Account>)res[0]);
            conList  = ((List<Contact>)res[1]);
            /* List<Lead> leadList = ((List<Lead>)res[2]); */
        /*
            if(accList.size()!=0 || conList.size()!=0 || leadList.size()!=0){
                
                String warn = 'Nome duplicato : ' + FirstName + ' ' + LastName + '. ' 
                    + accList.size() + ' Account, '
                    + conList.size() + ' Referenti.';
                    // + leadList.size() + ' Lead.';
                //a.addError(warn);   
            }*/
    }
}