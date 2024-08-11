public with sharing class DML_MERGE {
    public static void myMethods() {

        // Merge operation doesn't merge field values just that records get reparaented.
        // Merge only works with Account, Contact and Lead
        
        /* 
            Different Merging Combinations:
              --> sObject with sObject
              --> sObject with List<sObject>
              --> sObject with ID
              --> sObject with List<ID>
        */

        List<Account> accList = [SELECT Name FROM Account ORDER BY CreatedDate DESC LIMIT 3];
        Account acc1 = accList[0];
        Account acc2 = accList[1];
        Account acc3 = accList[2];

        // System.debug(accList);

        List<Account> mergeList = new List<Account>();
        mergeList.add(acc3);
        mergeList.add(acc2);

        // System.debug(mergeList);

        // sObject with sObject

        // Merge acc1 acc2;
    
        // sObject with List<sObject>

        Merge acc1 mergeList;

    }
}