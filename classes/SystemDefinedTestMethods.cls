/**
 * @description       : 
 * @author            : Sangram Keshari Upadhyaya
 * @group             : 
 * @last modified on  : 03-17-2024
 * @last modified by  : Sangram Keshari Upadhyaya
 * Modifications Log
 * Ver   Date         Author                      Modification
 * 1.0   03-12-2024   Sangram Keshari Upadhyaya   Initial Version
**/
public with sharing class SystemDefinedTestMethods {
    
    public Integer myMethod() {
        
        Account acc = new Account();
        acc.Name = 'System Defined Methods';
        acc.AccountNumber = '34323344';
        acc.AnnualRevenue = 202020;

        Database.insert(acc, AccessLevel.USER_MODE);

        return 200;

    }
}