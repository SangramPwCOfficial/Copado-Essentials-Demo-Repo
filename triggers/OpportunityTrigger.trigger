/**
 * @description       : 
 * @author            : Sangram Keshari Upadhyaya
 * @group             : 
 * @last modified on  : 05-11-2024
 * @last modified by  : Sangram Keshari Upadhyaya
 * Modifications Log
 * Ver   Date         Author                      Modification
 * 1.0   05-08-2024   Sangram Keshari Upadhyaya   Initial Version
**/
trigger OpportunityTrigger on Opportunity (after insert, after update, after delete, after undelete) {

    // Whenever we will be updating the Amount field on opportunity record this trigger will be fired after updation & we here used Trigger.newMap
    // to get the associated account Id to update the mapOpp field on Account
    if(Trigger.isAfter && Trigger.isUpdate){
        OpportunityTriggerHandler.getMaxOpportunity(Trigger.old, Trigger.newMap);
    }

    else if(Trigger.isAfter && Trigger.isDelete){
        OpportunityTriggerHandler.getMaxOpportunity(Trigger.old, null);
    }

    else {
        OpportunityTriggerHandler.getMaxOpportunity(Trigger.new, null);
    }

}