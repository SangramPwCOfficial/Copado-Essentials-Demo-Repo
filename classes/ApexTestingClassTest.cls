/**
 * @description       : 
 * @author            : Sangram Keshari Upadhyaya
 * @group             : 
 * @last modified on  : 02-25-2024
 * @last modified by  : Sangram Keshari Upadhyaya
 * Modifications Log
 * Ver   Date         Author                      Modification
 * 1.0   02-20-2024   Sangram Keshari Upadhyaya   Initial Version
**/

@isTest
public with sharing class ApexTestingClassTest {

        /************************** TEST CLASS SYNTAX **************************/

        // Test classes are annotated with @isTest

        // Earlier we were able to create test methods inside the actual class, but now we can only create test methods inside test classes

        // All the test methods should be static

        /************************** TEST METHODS SYNTAX **************************/

        /* @isTest static void testName(){
            
                [Code Block]

           }

           or

           static testMethod void testName(){

                [Code Block]

           }
         
         */
    
    /**
    * @description : This is the test method to test the substraction of 2 numbers
    * @author Sangram Keshari Upadhyaya | 02-25-2024 
    **/

    // @isTest
    @isTest static void testSubstract(){

          ApexTestingClass apx = new ApexTestingClass(4512, 3265);
          apx.subtract();

          Integer r = apx.getResult();

          // In System class there is a method called assertEquals, which checks whether the expected result is equal to the actual result.
          // If Expected == Actual, the test is Success or else it fails.
          System.assertEquals(1247, r);
    }

    /**
    * @description : This is the test method to test the addition of 2 numbers
    * @author Sangram Keshari Upadhyaya | 02-25-2024 
    **/
    @isTest static void testAddition(){
          ApexTestingClass apx = new ApexTestingClass(1234, 4569);
          apx.add();

          Integer r = apx.getResult();
          System.assertEquals(5803, r);
    }

    /**
    * @description : This is the test method to test the multiplication of 2 numbers
    * @author Sangram Keshari Upadhyaya | 02-25-2024 
    **/

    // testMethod
    static testMethod void testMultiply(){
          ApexTestingClass apx = new ApexTestingClass(123, 010);
          apx.multiply();

          Integer r = apx.getResult();
          System.assertEquals(1230, r);
    }

    /**
    * @description : This is the test method to test the division of 2 numbers & second number should not be 0
    * @author Sangram Keshari Upadhyaya | 02-25-2024 
    **/
    static testMethod void testDivide(){
          ApexTestingClass apx1 = new ApexTestingClass(48, 4);
          ApexTestingClass apx2 = new ApexTestingClass(0, 48);
          ApexTestingClass apx3 = new ApexTestingClass(48, 0);

          apx1.divide();
          Integer r1 = apx1.getResult();
          System.assertEquals(12, r1);

          apx2.divide();
          Integer r2 = apx2.getResult();
          System.assertEquals(0, r2);

          apx3.divide();
          Integer r3 = apx3.getResult();
          System.assertEquals(0, r3);

    }

    @isTest static void testUser(){

          // This query checks the user and the profile of the user should be System Admin
          User u1 = [SELECT Name, ProfileId FROM User WHERE Id = '0055h000009RcEkAAK' AND ProfileId = '00e5h0000053m1QAAQ' LIMIT 1];

          System.runAs(u1){
               ApexTestingClass apx = new ApexTestingClass(12, 32);

               apx.add();
               Integer add = apx.getResult();
               System.assertEquals(44, add);

               apx.subtract();
               Integer sub = apx.getResult();
               System.assertEquals(-20, sub);

               apx.multiply();
               Integer mul = apx.getResult();
               System.assertEquals(384, mul);

               apx.divide();
               Integer div = apx.getResult();
               System.assertEquals(0, div);
          }
    }

    /************************** STEPS TO RUN TEST CLASS **************************/

    /*

     1. Go to Developer Console
     2. Click on Test from top bar
     3. Go to New Run
     4. Select all the Test classes you want to execute
     5. Now select all the methods that you want to execute
     6. Click on Run

    */
}