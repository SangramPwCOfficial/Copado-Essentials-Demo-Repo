/**
 * @description       : 
 * @author            : Sangram Keshari Upadhyaya
 * @group             : 
 * @last modified on  : 02-25-2024
 * @last modified by  : Sangram Keshari Upadhyaya
 * Modifications Log
 * Ver   Date         Author                      Modification
 * 1.0   02-25-2024   Sangram Keshari Upadhyaya   Initial Version
**/
public with sharing class ProductTriggerHandler {

    public static void updateProductDescription(List<Product2> prdList){
        for (Product2 prd : prdList) {
            prd.Description = 'This is a new product launched in 2024!';
        }
    }

}