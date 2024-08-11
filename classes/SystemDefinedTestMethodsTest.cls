/**
 * @description       : 
 * @author            : Sangram Keshari Upadhyaya
 * @group             : 
 * @last modified on  : 03-17-2024
 * @last modified by  : Sangram Keshari Upadhyaya
 * Modifications Log
 * Ver   Date         Author                      Modification
 * 1.0   03-12-2024   Sangram Keshari Upadhyaya   Initial Version
**/

@isTest
private class SystemDefinedTestMethodsTest {

    /************************** SYSTEM-DEFINED METHODS USED IN TEST CLASSES **************************/

    // The common system-defined test methods are:
    // --startTest     : startTest method marks the point in our test code when the test actually begins
    // --stopTest      : stopTest method comes after the startTest method & marks the point in our test code when the test actually ends
    // --isRunningTest : isRunningTest method checks if the testing code is currently being executed or not. It returns Boolean value, TRUE or FALSE

    /***** PURPOSE *****/
    // Any code that executes after the startTest() and before the stopTest() is assigned a new set of governor limits
    // Any code that executes after the call to the stopTest() is assigned the original governor limits that were in effect before startTest() was called

    /***** SYNTAX *****/
    /* 
    
    * Test.startTest();
    * Test.stopTest();
    * Test.isRunningTest();
    
    */

    @isTest
    static void myUnitTest() {
        // TO DO: implement unit test

        SystemDefinedTestMethods stym = new SystemDefinedTestMethods();
        Integer resultSize = stym.myMethod();

        List<Account> accList = new List<Account>();
        for (Integer i = 0; i < 200; i++) {
            Account acc = new Account(Name = 'TestAcc-' + i, AccountNumber = '456526' + i);
            accList.add(acc);
        }

        Test.startTest();
        Database.SaveResult[] results = Database.insert(accList, AccessLevel.USER_MODE);
        Test.stopTest();

        System.assertEquals(resultSize, results.size(), 'Size of Account Records');
        System.assert(Test.isRunningTest(), 'Executing Test Code');

    }
}