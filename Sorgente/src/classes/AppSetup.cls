public class AppSetup {
	public static String recordTypeSS = '0124E0000004PjxQAE';
	public static String recordTypeSG = '0124E0000004PjwQAE';
    public static String recordTypeProfessional = '0124E0000004PjqQAE';
    public static String recordTypeSpecialista = '0124E0000004PjtQAE';
    public static String recordTypePersonAccount = '0124E0000004PjyQAE';
    public static String recordTypeServizi = '0124E0000004Pk0QAE';
    public static String recordTypeProdotto = '0124E0000004PjzQAE';

    // public static String SSPricebookId = '01s4E0000000iRKQAY';
    public static String SSPricebookId = '01s58000003vsH2AAI';
    
    public static Set<String> KitCodes = new Set<String>{'6307', '6308'};
    public static Set<String> KitAnalisi = new Set<String>{'6329'};
    public static Set<String> kitConservazione = new Set<String>{ '6330' /*, '6337', '6338', '6339', '6340', '6341'*/}; // solo crioconservazione e restituzione
        
    static {
        recordTypeSS = [SELECT Id FROM RecordType where Name = 'SS'].get(0).Id;
        recordTypeSG = [SELECT Id FROM RecordType where Name = 'SG'].get(0).Id;
        recordTypeProfessional = [SELECT Id FROM RecordType where Name = 'Professional'].get(0).Id;
        recordTypeSpecialista = [SELECT Id FROM RecordType where Name = 'Specialista'].get(0).Id;
        recordTypePersonAccount = [SELECT Id FROM RecordType where Name = 'Contatto' or Name = 'Prospect/Cliente'].get(0).Id;
        recordTypeServizi = [SELECT Id FROM RecordType where Name = 'Servizi'].get(0).Id;
        recordTypeProdotto = [SELECT Id FROM RecordType where Name = 'Prodotto'].get(0).Id;
    }
}