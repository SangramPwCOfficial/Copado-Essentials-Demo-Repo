/************* CONTEXT VARIABLES *************/

/*
*
*   Context variables allows us to access the runtime context of any trigger, i.e.,
*   In any trigger, if we want to access the records that initiated the execution of the triggers
*
*   Types of Context Variables:
*   
*   --> Trigger.newMap
*       This returns a map which includes Ids and the sObject records because of which the execution of the trigger got initiated.
*       It returns the newer version of the map.
*       
*       It is only available in :
*       BEFORE UPDATE TRIGGER
*       AFTER UPDATE TRIGGER
*       AFTER INSERT TRIGGER
*       AFTER UNDELETE TRIGGER
*
*/

trigger Basics_Trigger_5 on Account (before update) {

    Map<Id, Account> nmap = new Map<Id, Account>();
    // Map containing Ids of the Account records and the record details that initiated the trigger
    nmap = Trigger.newMap;

    // Contacts of the Account that initiated the trigger
    List<Contact> conList = [SELECT LastName, AccountId, MailingCity FROM Contact WHERE AccountId IN :nmap.keySet()];

    for(Contact con : conList){

        Account a = nmap.get(con.AccountId);
        con.MailingCity = a.BillingCity;

    }

    UPDATE conList;

}