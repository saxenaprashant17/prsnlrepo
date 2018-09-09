trigger AllineaAgenteUltimaVisita on Contact (before update) {

    string ContactId = Trigger.New[0].Id;
    List<Contact> C = [SELECT (SELECT OwnerId, EndDateTime FROM ActivityHistories WHERE IsTask = FALSE ORDER BY EndDateTime DESC LIMIT 1) FROM Contact WHERE Id = :ContactId];
    // Se ha selezionato il referente e se c'è almeno un'attività di tipo "evento", recupera l'agente di quell'attività.
    if (C.size()==1)
    {
        integer AHSize = C[0].ActivityHistories.size();
        if (AHSize > 0) {
            string OwnerId = C[0].ActivityHistories[AHSize-1].OwnerId;
            Datetime endDateTime = C[0].ActivityHistories[AHSize-1].EndDateTime;
            Trigger.New[0].Agente_ultima_visita__c = OwnerId;
            List<User> U = [SELECT Name FROM User WHERE Id = :OwnerId];
            if (U.size() == 1)
            {
                Trigger.New[0].Agente_ultima_visita__c = U[0].Name;
                Trigger.New[0].Data_ultima_visita__c = endDateTime;
            }
        }
    }

}