public class ScheduledWorkflowMonthly implements Schedulable {
	public void execute(SchedulableContext ctx) {
        new CalcoloPrelievi().execute();
    }       
}