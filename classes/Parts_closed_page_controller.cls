global  class Parts_closed_page_controller {
  
    webservice static string  call_method(ID strRecId,String strRecName){
        try{
                System.debug('cureent acccount id-->'+strRecId); 
                System.debug('javascript_call_class called'); 
                //lead a=[select id from Lead where ID=:strRecId];
                //
                //RecordType rt = [SELECT Id,Name FROM RecordType WHERE SobjectType='Opportunity' and name=:'PARTS1' and isActive=true limit 1];
				//system.debug('rt---->'+rt);	
                Pricebook2  pb=[select id from Pricebook2  where isStandard=true limit 1];
				System.debug('Pricebook2-->'+pb);
                Opportunity opp=new Opportunity();
                opp.name=strRecName+'-PARTS'+'test';
                opp.Type='Parts';
                opp.Amount=0.01;
                opp.StageName='Closed Won';
                opp.CloseDate=date.today();
                opp.AccountId=strRecId;
               // opp.Probability=100;
               // opp.RecordtypeID=rt.id;
                opp.Pricebook2Id=pb.id;
                insert opp;
                System.debug('inserted Opportunity id->'+opp);
                
                Quote q=new Quote();
                q.name=strRecName+'-PARTS -QU1';
                q.OpportunityId=opp.id;
                q.Status='Draft';
                q.ExpirationDate=date.today();
                q.Pricebook2Id=pb.id;
                insert q;
                System.debug('inserted Quote id->'+q);
                
                // sync Opportunity with Quote
                Opportunity oppUpdate=new Opportunity();
                oppUpdate=[select id,SyncedQuoteId,StageName from Opportunity where id=:opp.id];
                oppUpdate.SyncedQuoteId=q.id;
                oppUpdate.StageName='Closed Won';
                update oppUpdate;
                System.debug('updated Opportunity->'+oppUpdate);
                return String.valueOf(q.Id);  
        }catch(Exception e){
            	system.debug('get exception on line number->'+e.getLineNumber()+'	because->'+e.getMessage());
            	return null;
        }  
                
      
	}

}