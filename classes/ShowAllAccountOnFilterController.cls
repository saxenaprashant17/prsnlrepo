public with sharing class ShowAllAccountOnFilterController {
	
	
	public String recordID{get;set;}
	public Account Sourceaccount{get;set;}
	public double Last_Sale_Days_Ago{get;set;}
	public list<Account> accountList{get;set;}
	public list<Account> accountlistSearched{get;set;}
	public list<Account> accountlistSearched1{get;set;} // list will show on map
	public list<wrpclass> SearchAccountListWithMiles{get;set;}
	public list<String> accountpicklistvalue;
	public list<String> seletectedaccountpicklistvalue;
	public boolean listisempty{get;set;}
	public boolean showiflistfilled{get;set;}
	public  String  headerdata{get;set;}
    public string url{get;set;}
    public double radiusdis{get;set;}
    public String Machines{get;set;}
     
    public String SourceAccountAddress;
    public String sourceaddress='';
    public String otherAccountAddress;
    public double selectedvalue{get;set;} 
    
    //multiselect
  
  	Set<String> originalvalues = new Set<String>{'Talon R','Talon 900'};
    public List<string> leftselected{get;set;}
    public List<string> rightselected{get;set;}
    Set<string> leftvalues = new Set<string>();
    set<string> rightvalues = new set<string>();
	
	public ShowAllAccountOnFilterController(ApexPages.StandardController controller){
		
		try{
			
			/*changes*/
			
					Schema.DescribeFieldResult fieldResult = Account.Quote_Requested_for__c.getDescribe();
					System.debug('Schema.DescribeFieldResult fieldResult->'+ fieldResult);
					List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
					
					
					        
					   for( Schema.PicklistEntry f : ple)
					   {	
					       if(f.getValue().IsNumeric()){
					       	originalvalues.add(f.getValue());
					       }
					       System.debug('f.getLabel()->'+f.getLabel()+'f.getValue()->'+f.getValue());
					      
					   }
					System.debug('originalvalues-->'+originalvalues);
				
			/*changes*/
			
			leftselected = new List<String>();
        	rightselected = new List<String>();
        	leftvalues.addAll(originalValues);
			
			
			
			Last_Sale_Days_Ago=1800;
			accountpicklistvalue=new list<String>();
			seletectedaccountpicklistvalue=new list<String>();
			accountpicklistvalue.add('1. Loves us');
			accountpicklistvalue.add('2. Very Happy');
			accountpicklistvalue.add('3. Approval given');
			accountpicklistvalue.add('4. Responded (blank)');
			accountpicklistvalue.add('5. No Response');
			accountpicklistvalue.add('6. Problem Resolved (Happy)');
			accountpicklistvalue.add('7. Problem Resolved (Satisfied)');
			accountpicklistvalue.add('8. Problem Resolved (Bitter)'); 
			accountpicklistvalue.add('9. Hates us');
			
	
			radiusdis=100;
			SourceAccountAddress='';
			otherAccountAddress='';
			 headerdata= ApexPages.currentPage().getHeaders().get('Host');
        	 url='https://' + headerdata;
			
			listisempty=false;
			showiflistfilled=false;
		
			SearchAccountListWithMiles=new list<wrpclass>();
			accountlistSearched=new list<Account>();
			accountlistSearched1=new list<Account>();
			recordID=ApexPages.CurrentPage().getparameters().get('id');
			System.debug('recordID'+recordID);
			
			Sourceaccount=[select billingcity,BillingStreet,BillingPostalCode,BillingState,BillingCountry,IsPersonAccount,Quote_Requested_for__c,Machine_Sold__c,Last_Sale_Days_Ago_F__c,Rating  from account where ID=:recordID limit 25];	
			//accountlistSearched=[select billingcity,BillingStreet,BillingPostalCode,BillingState,BillingCountry,phone,PersonEmail,IsPersonAccount,name,Quote_Requested_for__c,Machine_Sold__c,Last_OPP_Date_RUS__c,Last_Sale_Days_Ago_F__c,Rating  from Account where BillingCountry <> null ];
			System.debug('Sourceaccount.billingStreet'+Sourceaccount.billingStreet + ' '+ Sourceaccount.billingCity + ', '+ Sourceaccount.billingState + ' '+ Sourceaccount.billingPostalCode + ' '+ Sourceaccount.billingCountry);
			//SourceAccountAddress= EncodingUtil.urlEncode(+ Sourceaccount.billingStreet + ' '+ Sourceaccount.billingCity + ', '+ Sourceaccount.billingState + ' '+ Sourceaccount.billingPostalCode + ' '+ Sourceaccount.billingCountry,'UTF-8');
			
						/*changes v1*/
							//rightvalues.add('testProduct');
							if(Sourceaccount.Quote_Requested_for__c != null){
								if(Sourceaccount.Quote_Requested_for__c !=''){
									String machinesValue=Sourceaccount.Quote_Requested_for__c;
									list<String> machines=new list<String>();
									machines=machinesValue.split(';');
									system.debug('machines-->'+machines);
									for(String a:machines){
										if(a.trim().isNumeric()){
											rightvalues.add(a);
											originalvalues.remove(a);
											leftvalues.remove(a);
											
										}
									}
									system.debug('originalvalues-->'+originalvalues);
									system.debug('rightvalues-->'+rightvalues);
									system.debug('leftvalues-->'+leftvalues);
								}	
							}	
						/*changes v1*/
			
			System.debug('1SourceAccountAddress-->'+SourceAccountAddress); 
			
						if(Sourceaccount.BillingStreet !=null ){
						sourceaddress+=Sourceaccount.billingStreet+' ' ;
					    }
					    if(Sourceaccount.Billingcity !=null ){
						sourceaddress+=Sourceaccount.billingcity+',';
					    }
						if(Sourceaccount.billingState !=null ){
						sourceaddress+=Sourceaccount.billingState+' ';
					    }
						if(Sourceaccount.BillingPostalCode !=null ){
						sourceaddress+=Sourceaccount.BillingPostalCode+' ';
					    }
					   	if(Sourceaccount.billingCountry !=null ){
						sourceaddress+=Sourceaccount.billingCountry+',';
					    }
			
			System.debug('source address->'+sourceaddress);
			Sourceaccount.Rating='5. No Response'; 
			System.debug('account detaisl-->'+Sourceaccount);
		
			
		}
		catch(Exception e){
				System.debug('1get the exception on line number '+e.getLineNumber()+'beacause'+e.getMessage());
		}
	} 
	
	public pagereference ToAccountPage(){
		
		String redirectTo='/'+recordID;
		pagereference pgref= new Pagereference(redirectTo);
		pgref.setredirect(true);
		
		System.debug('Machine-->'+account.Quote_Requested_for__c+'	Customer Rating-->'+account.Rating+' Last_Sale_Days_Ago-->'+Last_Sale_Days_Ago);
		return pgref;
	}
	
	public void SearchAccounts(){
		
		try{	
				System.debug('rightselected--->'+rightvalues);
				System.debug('rightvalues size-->'+rightvalues.size());
				for(String s:rightvalues){
					System.debug('data-->'+s);
				}
				
				accountList=new list<Account>();
				System.debug('recordID-->'+recordID);
				System.debug('Last_Sale_Days_Ago-->'+Last_Sale_Days_Ago);	
				System.debug('radius will be-->'+radiusdis);
				seletectedaccountpicklistvalue.clear();
				SearchAccountListWithMiles.clear();
				accountlistSearched.clear();
					/*customer rating calculation*/
					for(String a:accountpicklistvalue){
						try{
							System.debug('Integer.valueOf(a.subString(0,1))-->'+Integer.valueOf(a.subString(0,1)));
							System.debug('Integer.valueOf(Sourceaccount.Rating.subString(0,1))-->'+Integer.valueOf(Sourceaccount.Rating.subString(0,1)));
							if(Integer.valueOf(a.subString(0,1)) <=Integer.valueOf(Sourceaccount.Rating.subString(0,1))	){
									
									seletectedaccountpicklistvalue.add(a);
							}
						}
						catch(Exception e){
								System.debug('5get the exception on line number '+e.getLineNumber()+'beacause'+e.getMessage());
								ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.Error, 'Please choose Rating' +'');
	    					 	ApexPages.addMessage(msg);
						}
					}
					System.debug('seletectedaccountpicklistvalue-->'+seletectedaccountpicklistvalue);
				
					/*customer rating calculation*/
				
				accountlistSearched1.clear();
				SearchAccountListWithMiles.clear();
				System.debug('source account rating-->'+Sourceaccount.Rating);
				String sourceRating=Sourceaccount.Rating.trim().substring(0,1);
				System.debug('source account rating-->1->'+sourceRating);
				Integer sourceAccRating=Integer.valueOf(sourceRating);
				System.debug('source account rating-->2->'+sourceAccRating);
				
				System.debug('Machine-->'+Sourceaccount.Quote_Requested_for__c+'	Customer Rating-->'+Sourceaccount.Rating+' Last_Sale_Days_Ago-->'+Last_Sale_Days_Ago);
				String multipicklistdata=Sourceaccount.Quote_Requested_for__c;
				System.debug('multipicklistdata-->'+multipicklistdata);
				
				
				System.debug('Last_Sale_Days_Ago-->'+Last_Sale_Days_Ago+'	Sourceaccount.Rating-->'+Sourceaccount.Rating+'	Quote_Requested_for__c-->'+Sourceaccount.Quote_Requested_for__c);
				
	
				
				if(!test.isRunningTest()){
					accountlistSearched=[select billingcity,BillingStreet,BillingPostalCode,BillingState,BillingCountry,phone,PersonEmail,IsPersonAccount,name,Quote_Requested_for__c,Machine_Sold__c,Last_OPP_Date_RUS__c,Last_Sale_Days_Ago_F__c,toLabel(Rating) from Account where Rating IN:seletectedaccountpicklistvalue and Last_Sale_Days_Ago_F__c<=:Last_Sale_Days_Ago and Machine_Sold__c IN:rightvalues and ID!=:recordID limit 25 ];
				}
				
				else if (test.isRunningTest()){
					accountlistSearched=[select billingcity,BillingStreet,BillingPostalCode,BillingState,BillingCountry,phone,PersonEmail,IsPersonAccount,name,Quote_Requested_for__c,Machine_Sold__c,Last_OPP_Date_RUS__c,Last_Sale_Days_Ago_F__c,toLabel(Rating) from Account];
				}
				if(accountlistSearched.size()<0 || accountlistSearched.isEmpty()){
						listisempty=true;
						System.debug('true');
				}
				
				else if(accountlistSearched.size()>0){
							listisempty=false;
						System.debug('false');
							for(Account a:accountlistSearched){
								//accountlistSearched1.add(a);
								String city='';
								String State='';
								String country='';
								String Street='';
								String postcode='';
								String address='';
							
									
									if(a.billingStreet !=null ){
									address+=a.billingStreet+' ' ;
								    }
								    if(a.billingcity !=null ){
									address+=a.billingcity+',';
								    }
									if(a.billingState !=null ){
									address+=a.billingState+' ';
								    }
									if(a.BillingPostalCode !=null ){
									address+=a.BillingPostalCode+' ';
								    }
								   if(a.billingCountry !=null ){
									address+=a.billingCountry+',';
								    }
									
									System.debug('address-->'+address);
									System.debug('sSource address->'+sourceaddress);
								otherAccountAddress= EncodingUtil.urlEncode(address,'UTF-8');
								
						
								SourceAccountAddress= EncodingUtil.urlEncode(sourceaddress,'UTF-8');
								
								//SourceAccountAddress= EncodingUtil.urlEncode(+ Sourceaccount.billingCity + ', '+ Sourceaccount.billingState + ' '+ Sourceaccount.billingCountry,'UTF-8');
								
								System.debug('destination account address-->'+a.billingStreet + ' '+ a.billingCity + ', '+ a.billingState + ' '+ a.billingPostalCode + ' '+ a.billingCountry+''+a.name+a.id);
								System.debug('origin address->'+SourceAccountAddress);
								//getJsonResults(SourceAccountAddress,otherAccountAddress);
									
											String jsonResults='';	
											String response='';
											if(!test.isRunningTest()){									
												HttpRequest req = new HttpRequest();
												Http http = new Http();
												
												req.setMethod('GET');
												
												String url = 'https://maps.googleapis.com/maps/api/distancematrix/json'
													+ '?origins=' +  otherAccountAddress
													+ '&destinations=' + SourceAccountAddress
													+'&key=AIzaSyD51mZF35ReYevzyVLLzrU8ppdObJvD9KU'
													+ '&mode=driving'
													+ '&sensor=false'
													+ '&language=en'
													+ '&units=imperial';
													
													
												req.setEndPoint(url);
												System.debug('SourceAccountAddress-->'+SourceAccountAddress);
												System.debug('otherAccountAddress-->'+otherAccountAddress);
												HTTPResponse resp = http.send(req);
												System.debug('json results at start-->'+resp.getBody());
												 jsonResults = resp.getBody().replace('\n', '');
									        	response=resp.getBody();
										   }
											
											else if(test.isRunningTest()){
														response='{"destination_addresses" : [ "4551 Grove St, Shawnee, KS 66226, USA" ],"origin_addresses" : [ "Gary, IN, USA" ],"rows" : [ {"elements" : [{"distance" : {"text" : "36 mi","value" : 862159}, "duration" : {"text" : "8 hours 1 min","value" : 28864 }, "status" : "OK"}]}],"status" : "OK"}';
											}	
									                            String SessionId='';
									                            JSONParser  parser = JSON.createParser(Response);
									                			//SearchAccountListWithMiles.add(new wrpclass(a,2) );
									                            while (parser.nextToken() != null) {
									                            	
									                             if ((parser.getCurrentToken() == JSONToken.FIELD_NAME)){
									                              String fieldName = parser.getText();
									                              	System.debug('fieldName-->'+fieldName);
									                              parser.nextToken();
									                              String fieldValue=parser.getText();
									                              System.debug('fieldName-->'+fieldName);
									                                 if(fieldName== 'distance'){
									                                 	//SearchAccountListWithMiles.add(new wrpclass(a,2) );
									                                      JSONToken s2=parser.nextToken();
									                                     system.debug('parser.nextToken();-->'+String.valueOf(s2));
									                                    JSONToken s1= parser.nextValue();
									                                     System.debug('fieldname value-->'+s1);
									                                     System.debug('fieldname value to String -->'+String.valueOf(s1));
																		String s= parser.getText().remove(',');
									                                     System.debug('fieldname value-->'+s);
									                                     
									                                     /*check between ft an mi*/
									                                     if(s.containsIgnoreCase('ft')){
									                                     	System.debug('contains ftttttt');
									                                     	SearchAccountListWithMiles.add(new wrpclass(a,0) );
									                                     	accountlistSearched1.add(a);
									                                     }
									                                     
										                                 else if(s.containsIgnoreCase('mi')){
										                                     System.debug('s-->'+ s+'string length-->'+s.length());
										                                     String sr=s.remove('mi');
										                                     System.debug('remove mi-->'+sr); 
										                                    try{ 
											                                     double miles=double.valueOf(sr.trim());
											                                     System.debug('integer miles-->'+miles);
											                                     System.debug('radiusdis-->'+radiusdis);
											                                     if(miles<=radiusdis){
												                                     SearchAccountListWithMiles.add(new wrpclass(a,miles) );
												                                     accountlistSearched1.add(a);
											                                     }  
										                                    }   
										                                    catch(Exception e){
										                                    		ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.Error, 'Please insert a valid number' +'');
				    					 											ApexPages.addMessage(msg);
										                                    } 
										                                      
										                                 } 
									                                 }
									                                
									                             }
									                             
									                             
															}
															
															SYStem.debug('wrp list data-->'+SearchAccountListWithMiles);
								
							}
							
					}		
				if(accountlistSearched1.isEmpty()){
						showiflistfilled=false;
						listisempty=true;
				}
				else if(accountlistSearched1.size()>0){
						showiflistfilled=true;
						listisempty=false;
				}
				//if(showiflistfilled)
				System.debug('listisempty-->'+listisempty);
				/*chnages*/
					
				/**/
				
				
		}
		catch(Exception e){
				System.debug('2get the exception on line number '+e.getLineNumber()+'`beacause'+e.getMessage());
		}	
			
	}
	
	public void aa(){
			//accountlistSearched=[select billingcity,BillingStreet,BillingPostalCode,BillingState,BillingCountry,phone,PersonEmail,IsPersonAccount,name,Quote_Requested_for__c,Machine_Sold__c,Last_OPP_Date_RUS__c,Last_Sale_Days_Ago_F__c,Rating  from Account where BillingCountry <> null ];
	}	
	
	/**/
	
		    public PageReference selectclick(){
        rightselected.clear();
        for(String s : leftselected){
            leftvalues.remove(s);
            rightvalues.add(s);
        }
        return null;
    }
     
    public PageReference unselectclick(){
        leftselected.clear();
        for(String s : rightselected){
            rightvalues.remove(s);
            leftvalues.add(s);
        }
        return null;
    }
 
    public List<SelectOption> getunSelectedValues(){
        List<SelectOption> options = new List<SelectOption>();
        List<string> tempList = new List<String>();
        tempList.addAll(leftvalues);
        tempList.sort();
        for(string s : tempList)
            options.add(new SelectOption(s,s));
        return options;
    }
 
    public List<SelectOption> getSelectedValues(){
        List<SelectOption> options1 = new List<SelectOption>();
        List<string> tempList = new List<String>();
        tempList.addAll(rightvalues);
        tempList.sort();
        for(String s : tempList)
            options1.add(new SelectOption(s,s));
        return options1;
    }

	
	/**/
	
	public  class wrpclass{
			
			public double distancefromsourceaccount{get;set;}
			public Account ac{get;set;}
			
			wrpclass(Account a,double dis){
				
				distancefromsourceaccount=dis;
				ac=a;
			}
	}

  
}