public class Utilities {
    static string oddN='0123456789';
    static string oddL='ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    static string eveN='10___2_3_4___5_6_7_8_9';
    static string eveL='BAKPLCQDREVOSFTGUHMINJWZYX';
    
    public class CheckResult {
        public Integer ErrorNumber;
        public string ErrorMessage;
    }
    
    public static CheckResult checkCodiceFiscale(string codice){
        CheckResult ret = new CheckResult();
        ret.ErrorNumber = 0; ret.ErrorMessage='';
        if(codice.length()!=16){
            ret.ErrorNumber = 1;
            ret.ErrorMessage = 'La lunghezza deve essere di 16 caratteri';
            return ret;
        }
        codice = codice.toUpperCase();
        integer sum = 0;
        for(integer i = 0; i<15; i++){
            Integer ch = codice.charAt(i);
            integer pos = -1;
            if( Math.mod(i,2)==0){
                pos = eveN.indexOfChar(ch);
                if(pos==-1){
                    pos = eveL.indexOfChar(ch);
                }
            } else {
                pos = oddN.indexOfChar(ch);
                if(pos==-1){
                    pos = oddL.indexOfChar(ch);
                }                
            }
            if(pos==-1){
                ret.ErrorNumber = 2;
                ret.ErrorMessage = 'Carattere non valido in posizione ' + i;
                return ret;                
            }
            sum+=pos;
        }
        Integer rem = Math.mod(sum,26);
        Integer digit = oddL.charAt(rem);
        if(digit != codice.charAt(15)){
            ret.ErrorNumber = 3;
            ret.ErrorMessage = 'Check digit non corrisponde';
            return ret;             
        }        
        return ret;
    }
    
    public static void ensureProduct(Id opportunityId, Map<String, OpportunityLineItem> lines, Map<String, PriceBookEntry> prodotti, String productCode, Double quantity){    
        if(!lines.containsKey(productCode)) {
            if (quantity > 0) {
                PriceBookEntry pbe = prodotti.get(productCode);
                if(pbe!=null){
                    OpportunityLineItem noli = new OpportunityLineItem(OpportunityId=opportunityId, Quantity=quantity, PriceBookEntryId=pbe.Id, UnitPrice=pbe.UnitPrice, ServiceDate=System.today()); 
                    insert noli; 
                }
            }
        } else {
            OpportunityLineItem eoli = lines.get(productCode);
            if(quantity == 0){
                delete eoli;
            } else if(eoli.Quantity != quantity){
                PriceBookEntry pbe = prodotti.get(productCode);
                if(pbe!=null){
                    eoli.Quantity = quantity;
                    eoli.UnitPrice = pbe.UnitPrice;
                    update eoli;
                }
            }
        }
    }
    
    public static void syncTrigger(Id ObjectId, String ObjectType, String Operation){
        if([SELECT Id from Synchronizer__c where ObjectId__c=:ObjectId and Operation__c =:Operation and MigrationDate__c = null].size()<=0){
            Synchronizer__c s = new Synchronizer__c(ObjectId__c = ObjectId, ObjectType__c=ObjectType, Operation__c=Operation);
            insert(s);
        }
    }
}