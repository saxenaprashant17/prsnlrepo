@isTest
public class TestRighePazientiGinecologo
{ 
    public static testmethod void test()
    {
      Account acc = new Account();
      acc.LastName = 'Test Paziente';
      acc.Business_Unit__c = 'Telefono';
      acc.Type = 'GS';
      acc.Ginecologo__c = 'Ginecologo';
      acc.Origine__c = 'Collaboratore';
      acc.Costo_servizio_scelto__c = 1.896;
      acc.Data_ordine__c = date.parse('09/05/2018');
      acc.Status_Prospect_cliente01__c = 'Chiuso perso';
      acc.BillingCountry = 'Italia';
      acc.ShippingCountry = 'Italia';
      acc.PersonMailingCountry = 'Italia';
      acc.PersonOtherCountry = 'Italia';
      acc.Data_Creazione_Anagrafica__c = Date.parse('02/05/2018');
      acc.RecordTypeId= Schema.SObjectType.Account.getRecordTypeInfosByName().get('Prospect/cliente').getRecordTypeId();
         
      insert acc;
      
      Contact con = new Contact();
      con.PC_SS__c = 10;
      con.LastName = 'Ginecologo';
      con.RecordTypeId = Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Specialista').getRecordTypeId();
         
      insert con;
             
      Opportunity opp = new Opportunity();
      opp.Name = 'Opp test';
      opp.StageName = 'In firma';
      opp.Data_ordine__c = date.parse('09/05/2018');
      opp.CloseDate = date.parse('10/05/2018');
      opp.AccountId = acc.Id;
      opp.Ginecologo__c = con.Id;
      opp.Origine__c = 'Collaboratore';
      opp.Agente_titolare_ginecologo__c = Userinfo.getUserId();
      opp.Responsabile_prevendita__c = 'CIAO';
      opp.Stato_fatturazione__c = 'Italia';
      opp.Stato_spedizione__c = 'Italia';
      opp.Notifica_ordine_kit_ctr_agente__c = true;
      opp.RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('SS').getRecordTypeId();
         
      insert opp;
        
      Opportunity opp1 = new Opportunity();
      opp1.Name = 'Opp1 test';
      opp1.StageName = 'In attesa parto';
      opp1.Data_ordine__c = date.parse('09/05/2018');
      opp1.CloseDate = date.parse('10/05/2018');
      opp1.AccountId = acc.Id;
      opp1.Ginecologo__c = con.Id;
      opp1.Origine__c = 'Collaboratore';
      opp1.Agente_titolare_ginecologo__c = Userinfo.getUserId();
      opp1.Responsabile_prevendita__c = 'CIAO';
      opp1.Stato_fatturazione__c = 'Italia';
      opp1.Stato_spedizione__c = 'Italia';
      opp1.Notifica_ordine_kit_ctr_agente__c = true;
      opp1.RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('SS').getRecordTypeId();
         
      insert opp1;
      
      Opportunity opp2 = new Opportunity();
      opp2.Name = 'Opp test';
      opp2.StageName = 'Chiuso perso';
      opp2.Data_ordine__c = date.parse('09/05/2018');
      opp2.CloseDate = date.parse('10/05/2018');
      opp2.AccountId = acc.Id;
      opp2.Ginecologo__c = con.Id;
      opp2.Origine__c = 'Collaboratore';
      opp2.Agente_titolare_ginecologo__c = Userinfo.getUserId();
      opp2.Responsabile_prevendita__c = 'CIAO';
      opp2.Stato_fatturazione__c = 'Italia';
      opp2.Stato_spedizione__c = 'Italia';
      opp2.Notifica_ordine_kit_ctr_agente__c = true;
      opp2.RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('SS').getRecordTypeId();
         
      insert opp2;
      opp.StageName = 'Preparto';
      update opp;
      Elenco_Pazienti__c e = [SELECT id, Opportunita__c, Ginecologo__c, Stato_Paziente__c, Punti_Consiglio__c
                              FROM Elenco_Pazienti__c
                              WHERE Opportunita__c =: opp.Id];
      e.Stato_Paziente__c = 'Gestito';
      update e;
     
      //Questa è per crearla negativa
      opp.StageName = 'Chiuso perso';
      update opp;
 
      //Questa è per cancellare opp1     
      opp1.StageName = 'Chiuso perso';
      update opp1;
     
      
 
}
}