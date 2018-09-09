({
	saveSurveyData : function(c,e,h) {
		alert('soon data will be save');
        
         try{
       		var action=c.get("c.saveSurveyDate");
             action.setParams({
                 "surveyInfo":c.get('v.surveyData'),
                 
             });
              action.setCallback(this,function(response){
                     var state = response.getState();
                  alert('stated->'+state);
                     if(state=='SUCCESS'){
                       //alert(response.getReturnValue());
                         if(response.getReturnValue()!=null){
                           
                         }

                         }
                        else {
                           // alert('else');
                         }
                          });
                       $A.enqueueAction(action);
                       }
                       catch(err){
                            console.log('erorr->'+err.message);
                       }
	}
})