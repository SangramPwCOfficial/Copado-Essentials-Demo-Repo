/************************** APEX TRIGGERS **************************/

// An apex trigger is a piece of code that gets executed whenever some changes occur to the salesforce records.
// Triggers are nothing without Database operations

// In After Trigger, we can also make changes to other records, of different objects or of the same object,
// but can't many any change to the same record which initiated the trigger execution. Because this record is
// readonly in after trigger.

//

/************* APEX TRIGGERS SYNTAX *************/

/*
*
*       trigger TriggerName on sObject(trigger_event){
*   
*           // Code-block
*   
*       }
*
*/

// NOTE:- trigger_events will be included with comma(',') separation

/************* TRIGGERS EVENTS *************/

/*
*
*   1. BEFORE INSERT
*   2. BEFORE UPDATE
*   3. BEFORE DELETE
*   4. AFTER INSERT
*   5. AFTER UPDATE
*   6. AFTER DELETE
*   7. AFTER UNDELETE
*
*/

trigger Basics on Account(before update) {

    Account a = Trigger.new[0];

    if(!(a.Name.startsWith('Triggered')))
        a.Name = 'Triggered ' + a.Name;

}