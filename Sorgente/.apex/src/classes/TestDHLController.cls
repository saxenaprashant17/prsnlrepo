@isTest
public class TestDHLController {
	private static testMethod void testDHL(){
        // Test.setMock(WebServiceMock.class, new TestDHCallout());
        String resp = DHLController.getDeliveryDate(DateTime.now().addDays(5), '10121', 'Torino', 'IT', false);
        resp = DHLController.getShippingDate(DateTime.now().addDays(3), '10121', 'Torino', 'IT', true);
        DHLController.getTracking('');
    }
    private static testMethod void testTwilioController(){
        TwilioClientController cc = new TwilioClientController();
        cc.uname = 'uname';
        try{
            cc.getToken(); 
        } catch (Exception ex){}
        cc.getDial();
    }
}