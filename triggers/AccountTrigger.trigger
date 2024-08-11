/**
 * @description       : 
 * @author            : Sangram Keshari Upadhyaya
 * @group             : 
 * @last modified on  : 05-04-2024
 * @last modified by  : Sangram Keshari Upadhyaya
**/
trigger AccountTrigger on Account (after insert, before insert, after update) {

    if (Trigger.isInsert && Trigger.isBefore) {
        for(Account a : Trigger.new){
            a.BillingCity = 'Testing';
        }
    }
    
    //* Write a trigger on Account, when an account is inserted, automatically account billing address should populate into the account shipping address.

    if (Trigger.isBefore) {
        if (Trigger.isInsert || Trigger.isUpdate) {
            AccountTriggerHelper.populateBillingAddress(Trigger.new);
        }
    }
    
    //* Write a trigger on the Account when the Account is updated check all opportunities related to the account. Update all Opportunities Stage to close
    //* lost if an opportunity created date is greater than 30 days from today and stage not equal to close won.

    if(Trigger.isUpdate && Trigger.isAfter){
        // The Trigger.new is read-only as it is after update operation
        AccountTriggerHelper.checkRelatedOpportunities(Trigger.new);
    }

    //* Write a trigger, when a new Account is created then create a contact related to that account.

    if(Trigger.isInsert){
        // Since Contact would be created after Account is inserted, so here we would use “After Insert”
        if(Trigger.isAfter){
            AccountTriggerHelper.createRelatedContact(Trigger.new);
        }
    }
}