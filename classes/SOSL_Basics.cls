public with sharing class SOSL_Basics {
    public static void myMethod() {
        /************************** BASICS **************************/

        // The major difference between SOQL and SOSL is that, when we are sure on which object we need to query
        // we can use SOQL, but when are not sure on which object we need to query then we use SOSL.

        // SOSL is text based searching
        
        /************************** SYNTAX **************************/

        // In Apex
        //        --> FIND 'what' [What type] RETURNING [Where]
        
        // In Query Editor
        //        --> FIND {what} [What type] RETURNING [Where]

        // Example

        // WHERE ?

        // FIND {John} RETURNING Account, Contact

        // WHAT TYPE ? (OPTIONAL)

        /*  

            FIND {John} in Name Fields
            FIND {John} in Email Fields
            FIND {John} in Phone Fields
        
        */

        // RETURN WHICH FIELDS ?

        // FIND {John} RETURNING Account(Name,Phone), Contact(Lastname), Student__c(Name)
    }
}