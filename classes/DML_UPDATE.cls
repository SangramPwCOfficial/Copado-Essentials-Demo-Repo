public with sharing class DML_UPDATE {
    public static void myMethods() {

        // Get all of the Opportunities that got created in last 90 days and update the closed date of those
        // to the date 3 months later from today

        List<Opportunity> opnList = [SELECT Id, Name, Amount, CloseDate, CreatedDate FROM Opportunity WHERE CreatedDate = LAST_90_DAYS];
        // System.debug(opnList);

        Date d1 = Date.today() + 90;

        for (Opportunity opn : opnList) {
            opn.CloseDate = d1;
        }

        Update opnList;

    }
}