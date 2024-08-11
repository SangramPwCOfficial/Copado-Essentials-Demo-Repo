/**
 * @description       : 
 * @author            : Sangram Keshari Upadhyaya
 * @group             : 
 * @last modified on  : 02-26-2024
 * @last modified by  : Sangram Keshari Upadhyaya
 * Modifications Log
 * Ver   Date         Author                      Modification
 * 1.0   02-25-2024   Sangram Keshari Upadhyaya   Initial Version
**/
@isTest
public with sharing class ProductTriggerHandlerTest {
    
    @isTest static void updateProductDescriptionTest(){

        Product2 prd = new Product2();
        prd.Name = 'Test Product 1';
        
        INSERT prd;

        String descText = 'This is a new product launched in 2024!';

        Product2 prdList = [SELECT Name,Description, CreatedDate FROM Product2 ORDER BY CreatedDate ASC LIMIT 1];
        System.assertEquals(descText, prdList.Description, 'Tested');
        
    }

     /************************** UNDERSTANDING TESTING IN APEX **************************/

    /*
    
    To use
    
    --> Test.startTest()
    --> Test.stopTest()
    --> Test.isRunningTest()
    
    */

    // Preparing the Test Data

    @isTest static void updateProductDescriptionTest2(){
        
        List<Product2> prdList = new List<Product2>();
    
        for(Integer i = 1; i <= 200 ; i++) {
            
            Product2 prd = new Product2(Name='New Product '+i);
            prdList.add(prd);

        }

        // Now we will insert data which will fire the product trigger.

        Test.startTest();

        INSERT prdList;

        Test.stopTest();
        

        String descText = 'This is a new product launched in 2024!';

        List<Product2> pList = [SELECT Id, Name, Description, CreatedDate FROM Product2 ORDER BY CreatedDate ASC LIMIT 200];

        for (Product2 testPrd : pList) {
            System.assertEquals(descText, testPrd.Description, 'Bulk Testing Done');
        }

    }

}