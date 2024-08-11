/************* CONTEXT VARIABLES *************/

/*
*
*   Context variables allows us to access the runtime context of any trigger, i.e.,
*   In any trigger, if we want to access the records that initiated the execution of the triggers
*
*   Types of Context Variables:
*   
*   --> Trigger.old
*       This returns the list of records because of which the execution of the trigger got initiated.
*       This returns the previous version of the sObject records because of which the execution of the trigger got initiated
*       
*       It is only available in :
*       UPDATE TRIGGER
*       DELETE TRIGGER
*
*       // .addError('Error Message') throws errors on UI with the help of Code
*
*/

trigger Basics_Trigger_4 on Opportunity (before update) {

    // Bulkified

    for (Opportunity oppnOld : Trigger.old) {
        
        for (Opportunity oppnNew : Trigger.new) {

            if(oppnOld.Id == oppnNew.Id && oppnOld.Amount != oppnNew.Amount){

                // Trigger Exception
                oppnNew.addError('Are you serious! Amount can\'t be changed');

            }
            
        }
    }

}