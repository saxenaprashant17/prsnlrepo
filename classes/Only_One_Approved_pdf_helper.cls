public with sharing class Only_One_Approved_pdf_helper {
	
	public static void check_Other_Record_Before_insert(list<CanaryAMS__Accord_PDF__c> pdfList){//CanaryAMS__Certificate_Holder_Connection__c
       try{	
            set<Id> HolderIds=new set<Id>();
            for(CanaryAMS__Accord_PDF__c accord:pdfList){
                HolderIds.add(accord.CanaryAMS__Certificate_Holder_Connection__c);
            }
            System.debug('HolderIds connection->'+HolderIds);
            
            list<CanaryAMS__Accord_PDF__c> Pre_Approved_pdfs=new list<CanaryAMS__Accord_PDF__c>();
            Pre_Approved_pdfs=[select Approved__c,CanaryAMS__Certificate_Holder_Connection__c from CanaryAMS__Accord_PDF__c where Approved__c=true and CanaryAMS__Certificate_Holder_Connection__c IN:HolderIds];
            system.debug('Pre_Approved_pdfs->'+Pre_Approved_pdfs);
            
            Map<Id,long> Approved_pdfs=new Map<Id,long>();
            for(CanaryAMS__Accord_PDF__c accord:Pre_Approved_pdfs){
                   if(!Approved_pdfs.containsKey(accord.CanaryAMS__Certificate_Holder_Connection__c)){
                        Approved_pdfs.put(accord.CanaryAMS__Certificate_Holder_Connection__c, 1);
                    }
                    
                    else if(Approved_pdfs.containsKey(accord.CanaryAMS__Certificate_Holder_Connection__c)){
                        long l=Approved_pdfs.get(accord.CanaryAMS__Certificate_Holder_Connection__c)+1;
                        Approved_pdfs.put(accord.CanaryAMS__Certificate_Holder_Connection__c,l);
                        
                    }
                  
            }
            System.debug('Approved_pdfs->'+Approved_pdfs);
           
           for(CanaryAMS__Accord_PDF__c accord:pdfList){
               if(accord.Approved__c==true && !Approved_pdfs.containsKey(accord.CanaryAMS__Certificate_Holder_Connection__c)){
                    Approved_pdfs.put(accord.CanaryAMS__Certificate_Holder_Connection__c, 0);
               }
           }
            
            for(CanaryAMS__Accord_PDF__c p:pdfList){
                if(Approved_pdfs.get(p.CanaryAMS__Certificate_Holder_Connection__c)>=1 && p.Approved__c==true){
                    p.addError('cannot checked more then one pdf');
                }
            }
        
	
       }catch(Exception e){
                      System.debug('get exception on line number->'+e.getLineNumber()+' error is->'+e.getMessage());

       }
   }
    
    
    public static void update_pdf(list<CanaryAMS__Accord_PDF__c> pdfList){
        try{
            System.debug('update_pdf called');
            set<Id> HolderIds=new set<Id>();
            set<Id> PdfIds=new set<Id>();
            for(CanaryAMS__Accord_PDF__c accord:pdfList){
                if(accord.Approved__c==true){
                    HolderIds.add(accord.CanaryAMS__Certificate_Holder_Connection__c);
                    PdfIds.add(accord.Id);
                }    
            }
        	System.debug('HolderIds connection->'+HolderIds);
            System.debug('PdfIds ->'+PdfIds);
            list<CanaryAMS__Accord_PDF__c> Pre_Approved_pdfs=new list<CanaryAMS__Accord_PDF__c>();
            Pre_Approved_pdfs=[select Approved__c,CanaryAMS__Certificate_Holder_Connection__c from CanaryAMS__Accord_PDF__c where ID NOT IN:PdfIds and  Approved__c=true and CanaryAMS__Certificate_Holder_Connection__c IN:HolderIds];
            system.debug('Pre_Approved_pdfs->'+Pre_Approved_pdfs);
            
            Map<Id,long> Approved_pdfs=new Map<Id,long>();
            for(CanaryAMS__Accord_PDF__c accord:Pre_Approved_pdfs){
                if(!Approved_pdfs.containsKey(accord.CanaryAMS__Certificate_Holder_Connection__c)){
                    Approved_pdfs.put(accord.CanaryAMS__Certificate_Holder_Connection__c, 1);
                }
                
                else if(Approved_pdfs.containsKey(accord.CanaryAMS__Certificate_Holder_Connection__c)){
                    long l=Approved_pdfs.get(accord.CanaryAMS__Certificate_Holder_Connection__c)+1;
                    Approved_pdfs.put(accord.CanaryAMS__Certificate_Holder_Connection__c,l);
                }
            }
            System.debug('Approved_pdfs->'+Approved_pdfs);
            
			for(CanaryAMS__Accord_PDF__c accord:pdfList){
               if(accord.Approved__c==true && !Approved_pdfs.containsKey(accord.CanaryAMS__Certificate_Holder_Connection__c)){
                    Approved_pdfs.put(accord.CanaryAMS__Certificate_Holder_Connection__c, 0);
               }
            }
            
            for(CanaryAMS__Accord_PDF__c p:pdfList){
                if(Approved_pdfs.get(p.CanaryAMS__Certificate_Holder_Connection__c)>=1 && p.Approved__c==true){
                    p.addError('cannot checlked more update then 1');
                }
            }            
        }catch(Exception e){
            System.debug('get Exception on line update number->'+e.getLineNumber()+'	error is->'+e.getMessage());
        }
    } 
}