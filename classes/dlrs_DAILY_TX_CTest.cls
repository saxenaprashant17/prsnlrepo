/**
 * Auto Generated and Deployed by the Declarative Lookup Rollup Summaries Tool package (dlrs)
 **/
@IsTest
private class dlrs_DAILY_TX_CTest
{
    @IsTest
    private static void testTrigger()
    {
        // Force the dlrs_DAILY_TX_CTrigger to be invoked, fails the test if org config or other Apex code prevents this.
        dlrs.RollupService.testHandler(new DAILY_TX__C());
    }
}