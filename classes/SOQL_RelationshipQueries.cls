public with sharing class SOQL_RelationshipQueries {
    public static void myMethod() {
        /*  SOQL RELATIONSHIP QUERIES
        *
        *   --> Child to Parent Relationship Queries
        *   --> Parent to Child Relationship Queries
        *
        */

        /************************** Child to Parent Relationship Queries **************************/
        // Standard Object

        // Many --> One
        // Contact --> Account

        List<Contact> c1 = [SELECT firstname, lastname, AccountId, Account.Name, Account.NumberOfEmployees FROM Contact];
        System.debug(c1);

        // Here Account is the parent object's reference which is relationship field's name on child object.

        // Custom Object

        // Many --> One
        // Rating --> Student
        // __r

        List<Rating__c> r1 = [SELECT Name, Rating_Out_of_5__c, Subject__c, Student__r.Name FROM Rating__c];
        System.debug(r1);

        // Here Student__r is the parent object's reference which is relationship field's name on child object + __r.

        /************************** Parent to Child Relationship Queries **************************/
        // Standard Object

        // One --> Many
        // Account --> Contact
        // ()
        // ObjectAPIName+s

        List<Account> a1 = [SELECT Id,Name, (SELECT Id,Name FROM Contacts) FROM Account];
        System.debug(a1);

        // Here Conatcts is the Child Relationship Name
        // &
        // (SELECT Id,Name FROM Contacts) is a subquery

        // Custom Object

        // One --> Many
        // Student --> Rating
        // (ObjectAPIName+s__r)

        List<Student__c> s1 = [SELECT Id,Name,(SELECT Id, Name, Rating_Out_of_5__c FROM Ratings__r) FROM Student__c];
        System.debug(s1);

        // Here Ratings is the Child Relationship Name which needs to be appended with __r
        // &
        // (SELECT Id, Name FROM Ratings__r) is the subquery

        /************************** Multi-Level Relationship Queries **************************/
        
        // Child to Parent

        // Account --> Opportunity --> Opportunity Line Item
        // One --> Many --> Many
        // Z --> Y1, Y2
        // Y1 --> X1, X2
        // Y2 --> X3, X4

        // Z = ACoount
        // Y = Opportunity
        // X = Opportunity Line Item

        List<OpportunityLineItem> opl = [SELECT Id, Name, Opportunity.Name, Opportunity.Amount, Opportunity.Account.Name FROM OpportunityLineItem];
        System.debug(opl);

        // In SOQL, we can traverse up to a maximum of five levels, when querying data from child object to parent object

        // Parent to Child

        // Opportunity Line Item --> Opportunity --> AccounT
        // Many --> Many --> One
        // Z --> Y1, Y2
        // Y1 --> X1, X2
        // Y2 --> X3, X4

        // NOTE: A subquery can't have a subquery inside it.
        // [SELECT Name, (SELECT Name, Amount, (SELECT Name FROM OpportunityLineItems) FROM Opportunities) FROM Account]
        // This is only possible to one level down not more than that.
        // So Multi-Level Relationship Queries for Parent to Child are not possible.
    }
}