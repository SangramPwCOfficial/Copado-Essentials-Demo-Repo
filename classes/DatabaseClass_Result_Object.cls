public with sharing class DatabaseClass_Result_Object {
    public static void myMethods() {

        /************************** Database Class / Methods **************************/

        /************* RESULT OBJECT *************/

        // When we want to know how many records got inserted and how many records didn't got inserted, in this scenario result object is
        // used.

        // There are different result classes present in Database class.

        /************* DATABASE CLASS METHOD RESULT OBJECT *************/

        /*
        
        *   INSERT, UPDATE  - Save Result Class
        *   UPSERT          - Upsert Result Class
        *   MERGE           - Merge Result Class
        *   DELETE          - Delete Result Class
        *   UNDELETE        - Undelete Result Class
        *   CONVERTLEAD     - Lead Convert Result Class
        *   EMPTYRECYCLEBIN - Empty Recycle Bin Result Class

        */

        List<Account> accList = new List<Account>();

        for (Integer i = 1; i <= 5; i++){
            accList.add(new Account(Name='My Result Account '+ i, NumberOfEmployees = (i*100)));
        }

        accList.add(new Account());
        accList.add(new Account(NumberOfEmployees = 404));

        // For each record in the saveList it has it's individual saveResult class
        // saveList is a list of saveResult class for that Database.insert() operation
        
        Database.SaveResult[] saveList = Database.insert(accList, false);

        for (Database.SaveResult sL : saveList) {
            
            if (sL.isSuccess()) {
                System.debug('The inserted IDs are: '+ sL.getId());
            }

            else {
                System.debug('I was unsuccessful \''+ sL.getId() + '\' because of the following: ');

                // List of errors while inserting the record
                for (Database.Error err : sL.getErrors()) {
                    
                    // Each error record has 3 parts:
                    //     -- Status code     : getStatusCode()
                    //     -- Error Message   : getMessage()
                    //     -- Fields Affected : getFields()

                    System.debug(err.getStatusCode()+' - '+err.getMessage());
                    System.debug('The fields which are affected: '+ err.getFields());
                }
            }

        }

    }
}