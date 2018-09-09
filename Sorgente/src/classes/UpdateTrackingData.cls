public class UpdateTrackingData {
    public void execute(){
        List<Opportunity> opps = [SELECT Id, AWB_verso_lab__c, 	Data_invio_a_lab__c, Data_effettiva_ricezione_kit__c  from Opportunity where AWB_verso_lab__c!=null and Data_effettiva_ricezione_kit__c=null ];
        for(Opportunity op : opps){
            DHLController.TrackingResult res = DHLController.getTracking(op.AWB_verso_lab__c);
            if(res.StatusCode == 0){
                op.Data_effettiva_ricezione_kit__c = date.newinstance(res.DeliveryDate.year(), res.DeliveryDate.month(), res.DeliveryDate.day());
                if(op.Data_invio_a_lab__c == null){
                	op.Data_invio_a_lab__c = date.newinstance(res.ShipmentDate.year(), res.ShipmentDate.month(), res.ShipmentDate.day());
                }
                update op;
            } else if (res.StatusCode == 1){
                if(op.Data_invio_a_lab__c == null){
                    op.Data_invio_a_lab__c = date.newinstance(res.ShipmentDate.year(), res.ShipmentDate.month(), res.ShipmentDate.day());
                    update op;
                }
            }
        }
    }
}