public with sharing class DML_UNDELETE {
    public static void myMethods() {

        // Deleted some of the lead records few days back, need to retrieve it from database now

        List<Lead> leadList = [SELECT Name FROM Lead WHERE IsDeleted = TRUE AND LastModifiedDate = TODAY ALL ROWS];
        // System.debug(leadList);

        Undelete leadList;

    }
}