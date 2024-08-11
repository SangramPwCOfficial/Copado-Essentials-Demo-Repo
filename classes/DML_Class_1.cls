/**
 * @description       : 
 * @author            : Sangram Keshari Upadhyaya
 * @group             : 
 * @last modified on  : 05-02-2024
 * @last modified by  : Sangram Keshari Upadhyaya 
 * Modifications Log
 * Ver   Date         Author                      Modification
 * 1.0   05-02-2024   Sangram Keshari Upadhyaya   Initial Version
**/
public with sharing class DML_Class_1 {
    public static void myMethods() {
        /************************** DML Statements **************************/

        /*

            1) INSERT
            2) UPDATE
            3) UPSERT
            4) DELETE
            5) UNDELETE
            6) MERGE 
        
        */

        // *** SYNTAX
        //
        // DMLSTATEMENT sObject / List of sObject
        //
        
        /********* INSERT *********/

        List<Account> accList = new List<Account>();

        for (integer i = 1; i <= 20; i++) {
            Account a = new Account(Name = 'Test Account --> '+i);
            accList.add(a);
        }

        // System.debug(accList);

        // Insert accList;

        /********* UPDATE *********/

        List<Account> accList1 = [SELECT Id, Name, NumberOfEmployees FROM Account WHERE Name LIKE 'Updated%'];
        // for (Account acc : accList1) {
        //     acc.Name = 'Updated ' + acc.Name;
        // }

        Integer employees = 50;

        for (Account acc : accList1) {
            acc.NumberOfEmployees = employees;
            employees += 200;
        }

        // System.debug(accList1);

        // Update accList1;

        /********* UPSERT *********/
    
        List<Account> accList2 = [SELECT Id, Name, Type, NumberOfEmployees  FROM Account WHERE Name LIKE 'Updated%'];

        for (Account acc : accList2) {
            acc.Type = 'Prospect';
        }

        for (integer i = 1; i <= 10; i++) {
            Account a = new Account(Name = 'Upsert Account ' + i, Type = 'Other');
            accList2.add(a);
        }

        // System.debug(accList2);

        // Upsert accList2;

        /********* DELETE *********/

        List<Account> accListDelete = [SELECT Id, Name FROM Account WHERE Name LIKE 'Updated Test Account --> 1%' ORDER BY Name DESC LIMIT 10];
        
        System.debug(accListDelete);

        // Delete accListDelete;

        /********* UNDELETE *********/

        // ALL ROWS must be used

        List<Account> accListUndelete = [SELECT Id, Name FROM Account WHERE Name LIKE 'Updated Test Account --> 1%' ORDER BY Name DESC LIMIT 10 ALL ROWS];

        // Undelete accListUndelete;

        /********* MERGE *********/

        // Merge is used to merge some records into a single record

        // Before Merge Operation
        // ACC1 --> C1, C2, C3
        // ACC2 --> C4, C5

        // Merge ACC1 ACC2

        // After Merge Operation
        // ACC1 --> C1, C2, C3, C4, C5
        
        // ACC2 contacts are reparented to ACC1 and ACC2 record is deleted

        // Merge operation reparents the child records

        Account a1 = accList2[0];
        Account a2 = accList2[1];

        // System.debug(a1);
        // System.debug(a2);

        Merge a1 a2;

    }
}