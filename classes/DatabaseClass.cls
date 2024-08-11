public with sharing class DatabaseClass {
    public static void myMethods() {

        /************************** Database Class / Methods **************************/

        // With the help of Database class / methods we can insert all the valid records into the database excluding the invalid records
        // by using ALL or NONE property which is not possible with standalone DML Statements

        /************* Database Class Methods *************/

        /*

            1) Database.insert(List_or_Set, allOrNone) 
            2) Database.update(List_or_Set, allOrNone) 
            3) Database.upsert(List_or_Set, allOrNone) 
            4) Database.delete(List_or_Set, allOrNone) 
            5) Database.undelete(List_or_Set, allOrNone) 
            6) Database.merge(List_or_Set, allOrNone)
            7) Database.emptyRecyclebin(List_or_Set)
        
        */

        /********* Database.insert(List_or_Set, allOrNone)  *********/

        // The insert is a static method of database class

        List<Account> accList = new List<Account>();

        for (Integer i = 1; i <= 20; i++) {
            Account a = new Account(Name = 'Database Account '+ i);
            accList.add(a);
        }

        accList.add(new Account());

        // Insert accList;
        
        // No Record will get inserted because of the error in one and will throw a DMLException
        // System.DmlException: Insert failed. First exception on row 20; first error: REQUIRED_FIELD_MISSING, Required fields are missing: [Name]: [Name]

        // Database.insert(accList);

        // No Record will get inserted because of the error in one and will throw a DMLException
        // System.DmlException: Insert failed. First exception on row 20; first error: REQUIRED_FIELD_MISSING, Required fields are missing: [Name]: [Name]

        // Database.insert(accList, false);

        // Records except the ones which have errors gets inserted and it doesn't thrown a DMLException


        /********* Database.update(List_or_Set, allOrNone)  *********/

        // The update is a static method of database class

        for(Account a : accList){
            a.Name = 'Update - ' + a.Name;
        }

        // Database.update(accList, false);

        /********* Database.upsert(List_or_Set, allOrNone)  *********/

        // The upsert is a static method of database class

        for (Account a : accList) {
            a.Name = 'Upsert - ' + a.Name;
        }

        Integer i = 0;

        while(i <= 10){
            Account a = new Account(Name = 'Upsert - Update - Database Account '+ i);
            accList.add(a);
            i++;
        }

        // System.debug(accList);

        // Database.upsert(accList, false);

        /********* Database.delete(List_or_Set, allOrNone)  *********/

        // The delete is a static method of database class

        // System.debug(accList[0].Id + ' ' + accList[0].Name);
        // System.debug(accList[1].Id + ' ' + accList[1].Name);
        // System.debug(accList[2].Id + ' ' + accList[2].Name);

        // Database.delete(accList, false);

        /********* Database.undelete(List_or_Set, allOrNone)  *********/

        // The undelete is a static method of database class

        // Database.undelete(accList, false);

        /********* Database.merge(List_or_Set, allOrNone)  *********/

        // The merge is a static method of database class. It's added recently.

        Account acc1 = accList[0];
        Account acc2 = accList[1];

        // Database.merge(acc1, acc2, false);

        /********* Database.emptyRecyclebin(List_or_Set)  *********/

        // The emptyRecyclebin is a static method of database class. It clears the recycle bin.

        List<Contact> conList = [SELECT Id FROM Contact WHERE isDeleted = TRUE ALL ROWS];

        // Database.emptyRecycleBin(conList);



        /************* COUNT QUERY *************/

        // The below Dynamic SOQL query will not work

        // Integer i1 = Database.query('SELECT COUNT() FROM ACCOUNT');

        Integer i1 = Database.countQuery('SELECT COUNT() FROM Account');
        System.debug(i1);

        // ### Error ###

        // Integer i2 = Database.countQuery('SELECT COUNT_DISTINCT(NumberOfEmployees) FROM Account');
        // System.debug(i2);

        /************* LEAD CONVERT *************/

        // Database.LeadConvert is a sub-class in Database class, which is purely created to convert the lead records.

        // Step 1: Get the Lead record.

        Lead l = [SELECT Name FROM Lead WHERE Name LIKE 'Sa%' LIMIT 1];

        // Step 2: Create the object of the LeadConvert class with a reference variable.

        Database.LeadConvert lc = new Database.LeadConvert();

        // Step 3: Now the object must be linked to the lead record which we want to convert.
        //         For this we will call the setLeadId() method on the leadConvert object and pass the lead record's ID in the parameters

        lc.setLeadId(l.Id);

        // Step 4: Then we need to set the converted status for the lead the record.
        //         For this we will set the convertedstatus property on the leadConvert object and pass the value

        lc.convertedstatus = 'Closed - Converted';

        // Step 5: Now need to set the owners of the records which will get created as a result of this process.
        //         The owner of the Account, Contact and Opportunity record.
        //         For this we will set the ownerId property on the leadConvert object and pass the Id of any user.

        lc.ownerid = '0055h000009RcEkAAK';

        // Step 6: Now we need to create a reference variable of class LeadConvertResult
        //         and pass the leadConvert object into Database.convertLead();

        Database.LeadConvertResult lcr = Database.convertLead(lc);

        System.debug(lcr);

    }
}