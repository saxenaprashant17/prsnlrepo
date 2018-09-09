trigger AggiornaTitolareGinecologoInAccount on Contact (before update) {

    if (Trigger.New[0].OwnerId != Trigger.old[0].OwnerId)
    {
        string ContactId = Trigger.New[0].Id;
        List<Account> ls = [SELECT Id, Titolare_ginecologo_opport_correlat__c FROM Account WHERE Id IN (SELECT AccountId FROM Opportunity WHERE Ginecologo__c = :ContactId)];
        if (ls.size() > 0)
        {
            string OwnerId = Trigger.New[0].OwnerId;
            List<User> U = [SELECT Name FROM User WHERE Id = :OwnerId];
            for (Account a : ls)
            {
                a.Titolare_ginecologo_opport_correlat__c = U[0].Name;
            }
            update ls;
        }
    }
    
}