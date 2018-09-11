public with sharing class QuoteController {

public Quote q {get;set;}
public string returnurl{ get; set;}


public QuoteController(ApexPages.StandardController sc) {
    q = new Quote();
    q = (Quote)sc.getRecord();
    q.Name = ApexPages.currentPage().getParameters().get('Name');
   q.OpportunityId = ApexPages.currentPage().getParameters().get('oppid');
   q.Type__c = ApexPages.currentPage().getParameters().get('00N0W000009UZi3');
   string dt = ApexPages.currentPage().getParameters().get('ExpirationDate');
   string[] d;
   date d1;
   if(dt!=null && dt!='')
       d = dt.split('/');
   if(d!=null)
       d1 = date.newinstance(integer.valueof(d[2]),integer.valueof(d[0]),integer.valueof(d[1]));
   q.ExpirationDate = d1;
   q.Status = ApexPages.currentPage().getParameters().get('Status');
   returnurl = ApexPages.currentPage().getParameters().get('retURL'); 
   } 
public Pagereference saveQuote() {
    Pricebook2 pb2 = [select Id, Name, IsActive from PriceBook2 where IsStandard=True LIMIT 1];
     // q.name = qName;
    //  q.opportunityid = '0069000000OaWIM'; 
    q.Pricebook2Id = pb2.id;    
    insert q;
    list<QuoteLineItem> qli = new list<QuoteLineItem>();
    for(OpportunityLineItem oli:[select TotalPrice,Subtotal,ListPrice,SortOrder,ServiceDate,Description,Discount,UnitPrice,OpportunityId,PricebookEntryId,Quantity from OpportunityLineItem where OpportunityId =:q.opportunityid])
    {
    QuoteLineItem ql = new QuoteLineItem();
     ql.QuoteId = q.id;
     ql.PricebookEntryId = oli.PricebookEntryId;
     ql.Quantity=oli.Quantity;
     ql.UnitPrice=oli.UnitPrice;
     ql.Discount=oli.Discount;
     ql.Description=oli.Description;
     ql.ServiceDate=oli.ServiceDate;
    // ql.SortOrder=oli.SortOrder;
    // ql.ListPrice=oli.ListPrice;
    // ql.Subtotal =oli.Subtotal;
    // ql.TotalPrice =oli.TotalPrice;
    //ql.pricebookID =oli.pricebookID;
    ql.OpportunityLineItemId = oli.id;
    

     qli.add(ql);
    }
  if(qli.size()>0)
  insert qli;  
    Opportunity opp = [select id,SyncedQuoteId from Opportunity where id=:q.opportunityid];
    opp.SyncedQuoteId  = q.id;
    update opp;
    pagereference pageref = new pagereference('/'+q.id);
    pageref.setredirect(true);
    return pageref;
}    
}