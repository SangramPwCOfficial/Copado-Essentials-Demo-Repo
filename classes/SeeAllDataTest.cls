/**
 * @description       : 
 * @author            : Sangram Keshari Upadhyaya
 * @group             : 
 * @last modified on  : 03-17-2024
 * @last modified by  : Sangram Keshari Upadhyaya
 * Modifications Log
 * Ver   Date         Author                      Modification
 * 1.0   03-17-2024   Sangram Keshari Upadhyaya   Initial Version
**/

@isTest(SeeAllData = TRUE)
private class SeeAllDataTest {

    @isTest
    static void myTestMethod1() {
        // TO DO: implement unit test

        List<Contact> conList = new List<Contact>();

        for(Integer i = 1; i < 100; i++){
            Contact con = new Contact(FirstName='Test Contact', LastName= ' '+i);
            conList.add(con);
        }

        Test.startTest();

        INSERT conList;

        Test.stopTest();

        List<Contact> conListFinal = new List<Contact>();
        conListFinal = [SELECT Id FROM Contact];

        System.debug('When see all data is set to TRUE ' + conListFinal.size());
        Boolean checkIfNull = conListFinal.size() != 0 ? TRUE : FALSE;

        System.assert(checkIfNull, 'Tested the size');

    }

    @isTest
    static void myTestMethod2(){
        // Accessing Contact from Database
        Contact obj = [SELECT Id, Name FROM Contact WHERE Name = 'Test' LIMIT 1];
        Boolean checkIfNull = obj == NULL ? FALSE : TRUE;
        System.assert(checkIfNull, 'Tested the Contact');
    }

    @isTest(SeeAllData = FALSE)
    static void myTestMethod3(){
        // Accessing Contact from Database although @isTest(SeeAllData = FALSE) is applied for the method but it will get ignored as test class is having @isTest(SeeAllData = TRUE)
        Contact obj = [SELECT Id, Name FROM Contact WHERE Name = 'Test' LIMIT 1];
        Boolean checkIfNull = obj == NULL ? FALSE : TRUE;
        System.assert(checkIfNull, 'Test the Contact');
    }
}