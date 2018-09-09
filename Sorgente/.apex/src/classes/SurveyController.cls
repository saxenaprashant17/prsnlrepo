public class SurveyController {

	@AuraEnabled
	public static void saveSurveyDate(Survey__c surveyInfo){
		system.debug('save survey data-->');
		system.debug('save before Insert surveyInfo-->'+surveyInfo);
		insert surveyInfo;
		system.debug('save after InsertsurveyInfo intllj-->'+surveyInfo);

	}

}