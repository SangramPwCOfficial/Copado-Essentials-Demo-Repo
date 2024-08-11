public with sharing class SOQL_Advance {
    public static void myMethod() {

        /*  SOQL RETURN TYPES
        *
        *   --> List<sObject>
        *   --> sObject
        *   --> integer
        *   --> AggregateResult
        *
        */

        /************************** SOQL AGGREGATE FUNCTIONS **************************/

        //------- SUM ------
        AggregateResult ar1 = [SELECT SUM(Amount) FROM Opportunity];
        System.debug(ar1);
        // Will display the sum of amount in all opportunities

        //------- MAX ------
        AggregateResult ar2 = [SELECT MAX(Amount) FROM Opportunity];
        System.debug(ar2);
        // Will display the maximum amount from all opportunities

        //------- MIN ------
        Aggregateresult ar3 = [SELECT MIN(Amount) FROM Opportunity];
        System.debug(ar3);
        // Will display the minimum amount from all opportunities

        //------- COUNT ------
        Integer i1 = [SELECT COUNT() FROM Opportunity];
        System.debug(i1);
        // Will display the count of all the records in opportunities

        AggregateResult ar4 = [SELECT COUNT(Id) FROM Opportunity];
        System.debug(ar4);
        // Will display the count opportunities records where Id field is not null
        // Same as above

        AggregateResult ar5 = [SELECT COUNT(Amount) FROM Opportunity];
        System.debug(ar5);
        // Will display the count opportunities records where Amount field is not null

        //------- COUNT DISTINCT ------
        AggregateResult ar6 = [SELECT COUNT_DISTINCT(Amount) FROM Opportunity];
        System.debug(ar6);
        // Will display the count of all the records in opportunities with unique Amount value

        //------- AVERAGE ------
        AggregateResult ar7 = [SELECT AVG(Amount) FROM Opportunity];
        System.debug(ar7);
        // Will display the average amount of all the opportunities

    }
}