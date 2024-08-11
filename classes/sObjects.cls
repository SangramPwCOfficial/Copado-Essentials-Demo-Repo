public with sharing class sObjects {
    public static void sObjects() {

        //Standard Objects

        Account a1 = new Account();
        Contact c1 = new Contact();

        Account a2 = new Account(Name='Account SObject');
        Contact c2 = new Contact(FirstName='Suresh', LastName='Kumar');

        a1.Name = 'Sangu';
        a2.NumberOfEmployees = 22;

        //Custom Objects

        Score__c sc1 = new Score__c();
        sc1.Employee_Score__c = 34;

        
    }
}