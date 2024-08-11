/**
 * @description       : 
 * @author            : Sangram Keshari Upadhyaya
 * @group             : 
 * @last modified on  : 05-04-2024
 * @last modified by  : Sangram Keshari Upadhyaya
 * Modifications Log
 * Ver   Date         Author                      Modification
 * 1.0   05-04-2024   Sangram Keshari Upadhyaya   Initial Version
**/
@isTest
private class AccountTriggerHelperTest {
    testMethod static void firstMethod(){

    }

    @isTest
    static void createRelatedContactTest(){
        Account testAccount = new Account(Name='Test Account 1', AccountNumber='000', Type='Prospect');

        Test.startTest();
        Database.insert(testAccount, TRUE, AccessLevel.USER_MODE);
        Test.stopTest();

        List<Account> accList = [SELECT Id, Name FROM Account LIMIT 1];
        List<Contact> conList = [SELECT Id, Account.Name FROM Contact];

        System.assertEquals(1, conList.size(), 'Only 1 Conatct should be Present');
        System.assertEquals(testAccount.Name, conList[0].Account.Name, 'Account Names Does not Match');

    }

}