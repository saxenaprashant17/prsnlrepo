@isTest (SeeAllData = true)
public class TestNewLead {
    static testMethod void leadCreator() {
        Lead LLL = new Lead();
        LLL.LastName    = 'TESTLEAD2';
        LLL.Company    = 'TESTLEADCORP2';
        insert LLL;
    }
}