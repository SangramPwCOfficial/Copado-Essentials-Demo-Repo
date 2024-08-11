/**
 * @description       : 
 * @author            : Sangram Keshari Upadhyaya
 * @group             : 
 * @last modified on  : 05-11-2024
 * @last modified by  : Sangram Keshari Upadhyaya
 * Modifications Log
 * Ver   Date         Author                      Modification
 * 1.0   01-21-2024   Sangram Keshari Upadhyaya   Initial Version
**/
public with sharing class AccountTriggerHelper {
    public static void firstMethod(List<Account> accList) {

        for (Account acc : accList) {
            acc.Description = 'Created by Trigger Helper Class';
            acc.Rating = '5';

            if (acc.AccountNumber == null) {
                acc.AccountNumber.addError('Please enter Account Number');
            }

            System.debug(accList[0]);
        }

    }

    public static void secondMethod(List<Account> accList) {
        

        // for (Account acc : accList) {
            
        //     if (acc.AccountNumber == null) {
                
        //         acc.AccountNumber.addError('Amount field can\'t be empty');

        //     }

        // }

    }

    //* Trigger Helper method for the trigger on Account, when an account is inserted, automatically account billing address will populate into the account shipping address.

    public static void populateBillingAddress(List<Account> accList){
        for(Account acc : accList){

            if (acc.ShippingCity != null) {
                acc.ShippingCity = acc.BillingCity;
            }

            if(acc.ShippingCountry != null) {
                acc.ShippingCountry = acc.BillingCountry;
            }

            if(acc.ShippingPostalCode != null) {
                acc.ShippingPostalCode = acc.BillingPostalCode;
            }

            if (acc.ShippingState != null) {
                acc.ShippingState = acc.BillingState;
            }

            if(acc.ShippingStreet != null) {
                acc.ShippingStreet = acc.BillingStreet;
            }
            
        }
    }

    //* Trigger helper method for a trigger on the Account when the Account is updated check all opportunities related to the account. Update all Opportunities Stage to close
    //* lost if an opportunity created date is greater than 30 days from today and stage not equal to close won.

    public static void checkRelatedOpportunities(List<Account> accList){

        // Getting the list of all the Ids of the Accounts that have been updated
        Set<Id> accIds = new Set<Id>();

        for(Account acc : accList){
            accIds.add(acc.Id);
        }

        // day30 is the date which is 30 days less than today
        DateTime day30 = System.now() - 30;

        // Getting the list of all the opportunities related to the accounts that have been updated
        List<Opportunity> oppnList = [SELECT Id, StageName, CreatedDate FROM Opportunity WHERE AccountId IN :accIds WITH SYSTEM_MODE];

        // This will store the list of Opportunities that will get updated
        List<Opportunity> oppnToUpdate = new List<Opportunity>();

        // Check if the condition is statisfied
        if(!oppnList.isEmpty()){
            for(Opportunity oppn : oppnList){
                if(oppn.CreatedDate < day30 && oppn.StageName != 'Closed Won'){
                    oppn.StageName = 'Closed Lost';
                    oppn.CloseDate = System.today();
                    oppnToUpdate.add(oppn);
                }
            }
        }

        if(!oppnToUpdate.isEmpty()){
            Database.update(oppnToUpdate, FALSE, AccessLevel.SYSTEM_MODE);
        }
    }

    //* When a new Account is created then create a contact related to that account.

    public static void createRelatedContact(List<Account> accList) {
        List<Contact> conList = new List<Contact>();
        for(Account acc : accList){
            Contact con = new Contact(LastName='Contact for '+acc.Name, AccountId=acc.Id);
            conList.add(con);
        }
        Database.insert(conList, false, AccessLevel.USER_MODE);
    }
}