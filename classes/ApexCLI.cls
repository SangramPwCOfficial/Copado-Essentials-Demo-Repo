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
public with sharing class ApexCLI {
    public static void soqlQueryMethod() {
        
        // Relational Query --> Parent to Child
        List<Account> accList = [SELECT Name, (SELECT Name FROM Contacts) FROM Account WITH USER_MODE];
        System.debug(accList);

        // Get a All the Accounts with related contacts without Parent-child relationship query
        // This is not a best practice as it will hit the governor limits very easilly

        // for (Account acc : [SELECT Id FROM Account WITH USER_MODE]) {
        //     for(Contact con : [SELECT Id FROM Contact WHERE AccountId = :acc.Id]){
        //         System.debug(con+'--'+acc.Id);
        //     }
        // }

        // Parent to Child Relationship Query For Custom Object
        List<Branch__c> branchList = [SELECT Id, (SELECT Id, Name FROM Bank_Accounts__r) FROM Branch__c WITH USER_MODE];
        System.debug(branchList);

        

    }
}