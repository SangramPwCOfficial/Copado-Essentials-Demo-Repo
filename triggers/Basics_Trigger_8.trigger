/************* BULKIFIED TRIGGERS *************/

/*
*
*   Bulkifying a trigger basically means that the trigger is capabable of executing trigger logic on to multiple records
*
*/

trigger Basics_Trigger_8 on Lead (before insert) {

    // Non Bulkified

    Lead l = Trigger.new[0]; // First record because of the trigger got initiated
    l.Rating = 'Warm';

    Integer x = Trigger.new.size();
    System.debug('Size---->' + x);

    // Bulkified

    for (Lead l : Trigger.new) {
        l.Rating = 'Warm';
    }

    // Triggers should always be bulkified

}