trigger ImpostaAgenteDaAccount on Opportunity (before insert)
{
    For(Opportunity O : Trigger.New)
    {
        Account[] a = [SELECT Id, Name, Agente__c FROM Account WHERE Id = :O.AccountId LIMIT 1];
        if (a.size() > 0)
        {
            O.Agente__c = a[0].Agente__c;
        }
    }
}