/**
 * @description       : 
 * @author            : Sangram Keshari Upadhyaya
 * @group             : 
 * @last modified on  : 02-20-2024
 * @last modified by  : Sangram Keshari Upadhyaya
 * Modifications Log
 * Ver   Date         Author                      Modification
 * 1.0   02-18-2024   Sangram Keshari Upadhyaya   Initial Version
**/
public with sharing class ApexTestingClass {

     /************************** APEX TESTING **************************/
     
        // Apex Testing is the process that helps you to create relevant test data in the Test Classes and run them in Salesforce.
        // As a part of Apex Testing, you need to test for:
     
        // 1. Positive Behaviour: Test Apex code to verify that it works as per specification when Appropriate input is provided to the code.
     
        // 2. Negative Behaviour: Test the limitations of the system if a negative value, unexpected value, or input is provided to the Apex Code.

        // 3. Restricted User: Check that a user whose access to certain objects or records is restricted, is barred from accessing them.


     /************************** UNDERSTANDING TESTING IN APEX **************************/

     /* 
     
     1. Apex provides a testing framework that allows you to write UNIT Tests, run your tests, check test results, and have code coverage results.

     2. Testing is the key to successful long term development and is a critical component of the development process, that is, test development which occurs at the same time as code development.

     3. Testing is the key to the success of your Application, particularly if your application is to be deployed to customers. If you validate that your application works as expected, that there are no
        unexpected behaviours, your customers are going to trust you more.

     4. There are two ways of testing an application:
          --> One is through the Salesforce user interface, important, but merely testing through the UI will not catch all the Use Cases for your application. [MANUAL]
          --> The other way is to test for bulk functionality through your Code, if it's invoked using SOAP API or by Visualforce standard set controller. [AUTOMATED]

     5. Before you can deploy your code or package it for the FORCE.COM AppExchange, the following must be true:
          --> At least 75% of your Apex code must be covered by UNIT TESTS, and all of these tests must complete successfully.
          --> Every Trigger must have some test coverage.
          --> All Classes and Triggers must compile successfully.

     6. Salesforce runs all tests in all organizations that have Apex Code to verify that no behaviour has been altered as a result of any service upgrade.

     7. Note the following:
          --> When deploying Apex to a production organization, each Unit in your organization's namespace is executed by default.
          --> Calls to System.debug are not counted as a part of code coverage.
          --> Test Methods and test classes are not counted as a part of Apex Code Coverage.
     
     */

     private integer a, b, result;

     public ApexTestingClass(Integer a, Integer b){
          
          this.a = a;
          this.b = b;

     }

     public void add(){

          result = a + b;

     }

     public void subtract(){

          result = a - b;

     }

     public void multiply(){

          result = a * b;

     }

     public void divide(){
          
          if(b != 0){

               result = a / b;

          }

          else {

               result = 0;

          }

     }

     public Integer getResult(){

          return result;

     }

}