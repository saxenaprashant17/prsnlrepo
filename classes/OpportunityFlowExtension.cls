public class OpportunityFlowExtension
{
    public Opportunity opp;
    public OpportunityFlowExtension(ApexPages.StandardController stdController)
    {
        this.opp= (Opportunity)stdController.getRecord();
        oppid =this.opp.id; 
    }
   
   public Flow.Interview.Opportunity_to_Order flDemo { get; set; }
   public String oppid{get; set;}

 /*  public String getOutput() {
      if (flDemo== null) return null;
      return (String)(flDemo.getVariableValue('OpptyID'));
   }
*/
   public void start() {
      Map<String, Object> myMap = new Map<String, Object>();
      myMap.put('OpptyID', oppid);
      flDemo = new Flow.Interview.Opportunity_to_Order(myMap);
      flDemo.start();
   }

   public PageReference getFinishPage(){
       start();
       opp = [select id, Order_L__r.id from Opportunity where id=:this.opp.id];
       PageReference p = new PageReference('/' + opp.id);

       if(opp.Order_L__r.id!=null)
       p = new PageReference('/' + opp.Order_L__r.id);
       
       p.setRedirect(true);
       return p;
    }
}