/**
 * Auto Generated and Deployed by the Declarative Lookup Rollup Summaries Tool package (dlrs)
 **/
@IsTest
private class dlrs_DAILY_TXTest
{
    @IsTest
    private static void testTrigger()
    {
        // Force the dlrs_DAILY_TXTrigger to be invoked, fails the test if org config or other Apex code prevents this.
        dlrs.RollupService.testHandler(new DAILY_TX__c());
    }
}