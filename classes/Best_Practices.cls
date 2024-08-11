/**
 * @description       : 
 * @author            : Sangram Keshari Upadhyaya
 * @group             : 
 * @last modified on  : 03-12-2024
 * @last modified by  : Sangram Keshari Upadhyaya 
 * Modifications Log
 * Ver   Date         Author                      Modification
 * 1.0   03-12-2024   Sangram Keshari Upadhyaya   Initial Version
**/
public with sharing class Best_Practices {
    public static void myMethods() {
 
        /************************** BEST PRACTICES **************************/

        // 1. Exceeding the total number of allowed SOQL Queries
        
        // Not Appropiate
        // Each iteration of the outer loop results in another SOQL query for Contacts, which can quickly consume the governor limit on the number of SOQL queries if there are many Accounts being processed.

        List<Account> accList1 = [SELECT Name FROM Account WHERE CreatedDate = LAST_WEEK];

        for (Account a : accList1) {
            
            List<Opportunity> oppList1 = [SELECT Name, Amount FROM Opportunity WHERE AccountId =:a.Id];
            
            for (Opportunity opp : oppList1) {
                System.debug('Name: '+opp.Name+' Amount: '+opp.Amount);
            }

        }

        // Best Practice

        List<Account> accList2 = [SELECT Name FROM Account WHERE CreatedDate = LAST_WEEK];
        List<Opportunity> oppList2 = [SELECT Name, Amount FROM Opportunity WHERE AccountId IN :accList1];

        for (Opportunity opp : oppList2) {
            System.debug('Name: '+opp.Name+' Amount: '+opp.Amount);
        }

        // 2. Exceeding the total number of allowed DML Statements

        // Not Appropiate

        for (integer i = 0; i < 100; i++) {
            Account a = new Account(Name= 'Test Acc '+i);
            INSERT a;
        }

        // Best Practice

        List<Account> accList3 = new List<Account>();

        for (integer i = 0; i < 100; i++) {
            Account a = new Account(Name= 'Test Acc '+i);
            accList3.add(a);
        }

        INSERT accList3;

        // To Delete the newly created accounts

        List<Account> delAccList = [SELECT Name FROM Account WHERE CreatedDate = TODAY];
        DELETE delAccList;
    }
}