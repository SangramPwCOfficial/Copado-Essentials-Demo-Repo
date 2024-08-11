/************* CONTEXT VARIABLES *************/

/*
*
*   Context variables allows us to access the runtime context of any trigger, i.e.,
*   In any trigger, if we want to access the records that initiated the execution of the triggers
*
*   Types of Context Variables:
*   
*   --> Trigger.new
*       This returns the list of records because of which the execution of the trigger / the database operation got initiated.
*       This returns the newer version of the sObject records because of which the execution of the trigger got initiated.
*       
*       It is available in :
*       INSERT TRIGGER
*       UPDATE TRIGGER
*       UNDELETE TRIGGER
*
*/

trigger Basics_Trigger_3 on Account (before insert) {

    // Non-Bulkified
    
    // Account a = Trigger.new[0];
    // a.Name = 'Context variable' + a.Name;

    // Bulkified

    for (Account a : Trigger.new) {
        a.Name = 'Context variable' + a.Name;
        a.NumberOfEmployees = 10000;
    }

}