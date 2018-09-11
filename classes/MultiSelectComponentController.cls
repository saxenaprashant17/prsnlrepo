public with sharing class MultiSelectComponentController {
  
  public list<String> InitialRightList {get;set;}
  public list<String> CurrentRightList {get;set;}
  public String SearchText {get;set;}
  public list<String> LeftSelectedList {get;set;}
  public list<String> RightSelectedList {get;set;}
  map<String, String> LeftOptionMap = new map<String, String>();
  map<String, String> RightOptionMap = new map<String, String>(); 
  

  public MultiSelectComponentController() {
    LeftSelectedList = new list<String>();
    RightSelectedList = new list<String>();
    
    
    LeftOptionMap.put('X','X');
    LeftOptionMap.put('z','z');
    LeftOptionMap.put('y','y');
    LeftOptionMap.put('v','v');
    LeftOptionMap.put('q','q');
    LeftOptionMap.put('i','i');
    LeftOptionMap.put('l','l');
    
  } 
  
  /****
  * ClickRight - Right pointing arrow was clicked. Move selected options to the right box.
  ****/ 
  public PageReference ClickRight(){
    RightSelectedList.clear();
    for(String s : LeftSelectedList){
      if (LeftOptionMap.containsKey(s)) {
        RightOptionMap.put(s, LeftOptionMap.get(s));        
      }
      LeftOptionMap.remove(s);
    }
    return null;
  }

  /****
  * ClickLeft - Left pointing arrow was clicked. Move selected options to the left box.
  ****/     
  public PageReference ClickLeft(){
    LeftSelectedList.clear();
    for(String s : RightSelectedList){
      if (RightOptionMap.containsKey(s)) {
        LeftOptionMap.put(s, RightOptionMap.get(s));        
      }
      RightOptionMap.remove(s);
    }
    return null;
  }

  /****
  * getLeftOptionList - return SelectOptions for the left/unselected box
  ****/      
  public list<SelectOption> getLeftOptionList(){
    list<SelectOption> TempOptionList = new list<SelectOption>();
    list<String> TempValueList; 
  
    TempValueList = LeftOptionMap.values();
    TempValueList.sort();  // sort by name
    for (String u : TempValueList) { 
      TempOptionList.add(new SelectOption(u, u));
    }
    return TempOptionList;
  }

  /****
  * getRightOptionList - return SelectOptions for the right/selected box
  ****/ 
  public list<SelectOption> getRightOptionList(){
    list<SelectOption> TempOptionList = new list<SelectOption>();
    list<String> TempValueList;
  
    CurrentRightList.clear();  
    
    
    if (InitialRightList != null && InitialRightList.size() > 0) {
    	
     
      for (String u : InitialRightList) {
        RightOptionMap.put(u, u);
      }
      InitialRightList.clear();
    }
    
    TempValueList = RightOptionMap.values();
    TempValueList.sort();  // sort by name
    for (String u : TempValueList) { 
      TempOptionList.add(new SelectOption(u, U));
      CurrentRightList.add(u);
    }   System.debug('CurrentRightList->'+CurrentRightList);
    return TempOptionList;
  }
  
 


}