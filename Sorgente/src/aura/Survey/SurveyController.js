({
    doInit : function(c,e,h){
        //alert('value if ->'+c.get('v.surveyData.Instruction_understand__c'));
    },
    
    radioFun:function(c,e,h){
        alert(c.get('v.surveyData.Instruction_understand__c'));
        var radVales = e.getSource().get("v.name").split('->');
        alert(radVales);
        var fieldValue=radVales[0];
        var fieldName=radVales[1];
        alert('value-->'+fieldValue);
        alert('name-->'+fieldName);
        console.log('console obj entetr data');
        c.set("v.surveyData."+fieldName,fieldValue);
        console.log('console obj data');
        alert(c.get("v.surveyData."+fieldName));
        
    },
    
    onSubmit:function(c,e,h){
        if(c.get('v.surveyData.Instruction_understand__c') != undefined &&
           c.get('v.surveyData.performance_kits__c') != undefined){
            alert('all values are entered correctly.');
            h.saveSurveyData(c,e,h);
        }
        
        else{
            var sub=c.find('submit');
            $A.util.addClass(sub, 'slds-show');
            $A.util.removeClass(sub, 'slds-hide');
            if(c.get('v.surveyData.Instruction_understand__c') == undefined){
                var cmpTarget=c.find('Instruction_understand__c');
                $A.util.addClass(cmpTarget, 'slds-show');
                $A.util.removeClass(cmpTarget, 'slds-hide');

            }
            if(c.get('v.surveyData.performance_kits__c') == undefined){
                

            }
            alert('all values are entered not correctly.');
        }
	}
 
 })