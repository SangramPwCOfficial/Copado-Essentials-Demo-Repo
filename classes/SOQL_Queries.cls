public with sharing class SOQL_Queries {
    public static void myMethod() {

        /*  Basic Syntax of SOQL
        *
        *   SELECT {Field List} FROM {Object API Name}
        *
        */

        /*  Querying Records from Standard Objects
        *
        *   SELECT Name FROM Account
        *
        */

        /*  Querying Records from Custom Objects
        *
        *   SELECT Name FROM Student__c
        *   SELECT Name, NumberOfEmployees, Active__c FROM Account
        *
        */

        /************************** WHERE CLAUSE **************************/

        /*
        *
        *   SELECT Name FROM Account WHERE NumberOfEmployees > 50
        *
        *   OR
        *
        *   SELECT Name, NumberOfEmployees FROM Account WHERE Type = 'Prospect' OR Rating = 'Hot'
        *
        *   OR
        *
        *   SELECT Name, NumberOfEmployees FROM Account WHERE Type = 'Prospect' AND Rating = 'Hot'
        *
        */

        List<Account> l1 = new List<Account>();
        l1 = [SELECT Name, NumberOfEmployees FROM Account WHERE NumberOfEmployees > 500];

        for(integer i = 0; i < l1.size(); i++){
            System.debug('Number Of Employees: '+l1[i].NumberOfEmployees);
        }

        for (Account a : l1) {
            System.debug('Name: '+a.Name);
        }

        List<Contact> c1 = [SELECT Name FROM Contact LIMIT 5];

        for(Contact c : c1){
            System.debug('Contact Name: '+c.Name);
        }

        for(integer x = c1.size() - 1; x >= 0; x--){
            System.debug('Name: '+c1[x].Name);
        }
    }

    public static void soqlVariableBinding(String s){

        /************************** VARIABLE BINDING **************************/

        // Static
        List<Contact> staticConList = [SELECT firstname, lastname, email FROM Contact WHERE FirstName='John'];
        System.debug(staticConList);

        // Dynamic
        Contact[] dynamicConList = [SELECT firstname, lastname, email FROM Contact WHERE Firstname = :s];
        System.debug(dynamicConList);
    }
}