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
trigger ProductTrigger on Product2 (before insert) {
    /* */

    if(Trigger.isBefore){
        if(Trigger.isInsert){
            ProductTriggerHandler.updateProductDescription(Trigger.new);
        }
    }

}