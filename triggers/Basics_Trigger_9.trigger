/************* TRIGGER HELPER CLASS DESIGN PATTERN *************/

/*
*
*   This is a pattern in which we should design our trigger code to work effiently and
*   eliminate the chances of getting bugs.
*   
*   When multiple triggers are added on to the same object with same trigger event(s) there is an uncertainty of
*   order of execution of triggers, therefore salesforce recommends to create a helper class.
*
*   The helper class should contain all of the logic inside a helper class and we should only create a
*   single trigger on to a particular object.
*
*   Just add methods in the helper class and call it rom the trigger
*
*/

trigger Basics_Trigger_9 on Account (before insert, after insert, before update, after update) {

    if(Trigger.isBefore){

        if(Trigger.isInsert){

            // This will execute first
            AccountTriggerHelper.firstMethod(Trigger.new);

            // This will execute second
            AccountTriggerHelper.secondMethod(Trigger.new);

        }

        if (Trigger.isUpdate) {


            
        }

    }

}