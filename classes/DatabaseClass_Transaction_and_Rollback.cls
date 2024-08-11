public with sharing class DatabaseClass_Transaction_and_Rollback {
    public static void myMethods() {

        /************************** Database Class / Methods **************************/

        /************* TRANSACTION CONTROL & ROLLBACK *************/

        /************* Use Case *************/

        // Need to get the opportunity records' Amount and add the percentage commission to that amount and update the final amount
        // for that opportunity. And then create a record of the custom object Commission which stores the information of the commission
        // that needs to provided to the sales executive working on to the particular opportunity.

        // Then update the percentage of commission that has been given to that particular agent on that particular Account.

        // Ex: 
        //      if,
        //          Amount = x;
        //          Commission = 20% of x
        //          Final Amount = x + 20% of x

        // With this method of database we can store the state of the database base any given point of time.
        Savepoint sp1 = Database.setSavepoint();
        
        try {

            Opportunity oppn = [SELECT Id, Name, Amount, Account.Id, OwnerId FROM Opportunity WHERE Name LIKE 'Genepoint%' LIMIT 1];

            Decimal com = (oppn.Amount * 0.20); 

            oppn.Amount = com + oppn.Amount;

            UPDATE oppn;

            System.debug(oppn.Name);
            System.debug(oppn.Amount);
            
            Commission__c commission = new Commission__c();

            commission.Commission_Amount__c = com;

            commission.Agent__c = oppn.OwnerId;

            INSERT commission;

            System.debug(commission);

            Account acc2 = [SELECT Name, Discount_Percentage__c FROM Account WHERE Id =: oppn.AccountId];

            acc2.Discount_Percentage__c = 20;

            UPDATE acc2;
            
        } catch (Exception e) {
            
            // Database.rollback() can be used only if the savepoint created.
            Database.rollback(sp1);

        }

    }
}