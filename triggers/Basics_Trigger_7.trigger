/************* CONTEXT VARIABLES *************/

/*
*
*   Context variables allows us to access the runtime context of any trigger, i.e.,
*   In any trigger, if we want to access the records that initiated the execution of the triggers
*
*   Types of Context Variables:
*   
*   --> isInsert == TRUE / FALSE
*   --> isUpdate == TRUE / FALSE
*   --> isDelete == TRUE / FALSE
*   --> isUnDelete == TRUE / FALSE
*   --> isBefore == TRUE / FALSE
*   --> isAfter == TRUE / FALSE
*   --> Size
*
*   This helps to get the idea about the order of execution of the trigger or basically which trigger is executing currently.
*
*/

trigger Basics_Trigger_7 on Contact (before insert, after insert, before update, after update, before delete, after delete, after undelete) {

    if (Trigger.isBefore) {

        Integer i = 0;
        
        if (Trigger.isInsert) {
        
            System.debug('Before Insert happened at ' + i);
            i++;

        }

        if (Trigger.isUpdate) {
        
            System.debug('Before Update happened at ' + i);
            i++;

        }

        if (Trigger.isDelete) {
        
            System.debug('Before Delete happened at ' + i);
            i++;

        }

    }

    if (Trigger.isAfter) {

        Integer i = 0;
        
        if (Trigger.isInsert) {
        
            System.debug('After Insert happened at ' + i);
            i++;

        }

        if (Trigger.isUpdate) {
        
            System.debug('After Update happened at ' + i);
            i++;

        }

        if (Trigger.isDelete) {
        
            System.debug('After Delete happened at ' + i);
            i++;

        }

        if (Trigger.isUndelete) {
        
            System.debug('After Undelete happened at ' + i);
            i++;

        }

    }
    
}