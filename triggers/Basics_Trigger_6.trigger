/************* CONTEXT VARIABLES *************/

/*
*
*   Context variables allows us to access the runtime context of any trigger, i.e.,
*   In any trigger, if we want to access the records that initiated the execution of the triggers
*
*   Types of Context Variables:
*   
*   --> Trigger.oldMap
*       This returns a map which includes Ids and the sObject records because of which the execution of the trigger got initiated.
*       It returns the older version of the map.
*       
*       It is only available in :
*       UPDATE TRIGGER
*       DELETE TRIGGER
*
*/

trigger Basics_Trigger_6 on Opportunity (before update) {

    // Map<Id, Opportunity> nMap = Trigger.newMap;
    Map<Id, Opportunity> oMap = Trigger.oldMap;

    // List<Opportunity> opnList = [SELECT Id, Amount FROM Opportunity WHERE Id IN :oMap.keySet()];

    // for (Opportunity oppnOld : opnList) {
        
    //     Opportunity oppnNew = nMap.get(oppnOld.Id);

    //     if (oppnNew.Amount != oppnOld.Amount && oppnOld.Amount != null) {
    //         oppnNew.addError('Are you serious! Amount can\'t be changed ------------');
    //     }

    // }

    for (Opportunity newOppn : Trigger.new) {
        
        Opportunity oldOppn = oMap.get(newOppn.Id);

        if (newOppn.Amount != oldOppn.Amount && oldOppn.Amount != null) {
            
            // Trigger exception on the field
            newOppn.Amount.addError('Are you serious! Amount can\'t be changed :(');

        }

    }

}