public class ScheduledWorkflow implements Schedulable {
	public void execute(SchedulableContext ctx) {
        new UpdateStatusReferenti().execute();
        new UpdateStatusAccount().execute();
        new UpdateTrackingData().execute();
        new ResetFlagInvioGuida().execute();
    }
}