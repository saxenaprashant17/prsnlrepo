@isTest(SeeAllData=true)
private class quoteTemplateTest{
static testMethod void docTest() 
{
    //get standard pricebook
    Pricebook2  standardPb =[select id, name, isActive from Pricebook2 where IsStandard = true limit 1];

    Pricebook2 pbk1 = new Pricebook2 (Name='Test Pricebook Entry 1',Description='Test Pricebook Entry 1', isActive=true);
    insert pbk1;

    Product2 prod = new Product2(Name='test1',Family='Liner', IsActive=true);
    insert prod;

    Product2 prod1 = new Product2(Name='test1',Family='Trim', IsActive=true);
    insert prod1;

    Product2 prod2 = new Product2(Name='test2',Family='Accessories', IsActive=true);
    insert prod2;

    PricebookEntry pbe = new PricebookEntry (Product2Id=prod.id,Pricebook2ID=standardPb.id,UnitPrice=50, isActive=true);
    insert pbe;
    PricebookEntry pbe1 = new PricebookEntry (Product2Id=prod1.id,Pricebook2ID=standardPb.id,UnitPrice=50, isActive=true);
    insert pbe1;
    PricebookEntry pbe2 = new PricebookEntry (Product2Id=prod2.id,Pricebook2ID=standardPb.id,UnitPrice=50, isActive=true);
    insert pbe2;
    Id devRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Business').getRecordTypeId();
    Account acc = new Account(PersonLeadSource='Yahoo',Lastname='Account');
    insert acc;

    Contact con = new Contact(lastname='test contact',email='test@gmail.com',phone='1284290842');
    insert con;

    Opportunity opp = new Opportunity(AccountId=acc.id,Pricebook2Id = standardPb.id,Name='test Oppty',CloseDate=system.today(),StageName='Stage 3 - Estimate f/u - negotiations');
    insert opp;
    
    OpportunityLineItem oli = new OpportunityLineItem();

   // oli.TotalPrice,
    //oli.Subtotal
   // oli.ListPrice
   // oli.SortOrder
   // oli.ServiceDate
   // oli.Description
  //  oli.Discount
  //  oli.UnitPrice
    oli.OpportunityId = opp.id;
    oli.PricebookEntryId =pbe1.id;
    oli.Quantity=1;
    
    insert oli;

    Quote qt = new Quote(Name='test quote',OpportunityId=opp.id,Pricebook2Id = standardPb.id, ContactId=con.id, ExpirationDate=system.today());
    insert qt;

    QuoteLineItem qliliner = new QuoteLineItem(Product2Id=prod.id,QuoteId=qt.id,PriceBookEntryID=pbe.id,Quantity=4, UnitPrice =50);
    insert qliliner;

    QuoteLineItem qlitrim = new QuoteLineItem(Product2Id=prod1.id,QuoteId=qt.id,PriceBookEntryID=pbe1.id,Quantity=4, UnitPrice =50);
    insert qlitrim;

    QuoteLineItem qliacc = new QuoteLineItem(Product2Id=prod2.id,QuoteId=qt.id,PriceBookEntryID=pbe2.id,Quantity=4, UnitPrice =50);
    insert qliacc;
    
    Test.setCurrentPageReference(new PageReference('Page.newQuote'));
    ApexPages.currentPage().getParameters().put('Name',opp.Name);
    ApexPages.currentPage().getParameters().put('oppid',opp.id);
    ApexPages.currentPage().getParameters().put('ExpirationDate','11/3/2017');

    Quote qt1 = new Quote(Name='test quote',OpportunityId=opp.id,Pricebook2Id = standardPb.id, ContactId=con.id, ExpirationDate=system.today());

    ApexPages.StandardController stdLead = new ApexPages.StandardController(qt1);
    QuoteController qc= new QuoteController(stdLead);
    qc.saveQuote();
    
    
    
    
}

}