/**
 * @description       : 
 * @author            : Sangram Keshari Upadhyaya
 * @group             : 
 * @last modified on  : 04-01-2024
 * @last modified by  : Sangram Keshari Upadhyaya
 * Modifications Log
 * Ver   Date         Author                      Modification
 * 1.0   04-01-2024   Sangram Keshari Upadhyaya   Initial Version
**/
public with sharing class IteratorInApex implements Iterable<Account> {

    public Iterator<Account> iterator() {

        List<Account> accList = [SELECT Id, Name FROM Account WITH USER_MODE];
        return accList.iterator();

    }

    // public Iterator<String> iteratorString(){

    //     return new List<String>{'Str 1', 'Str 2'}.iterator();

    // }

    public static void myMethod(){
    
        for (Account acc : new IteratorInApex()) {
            System.debug('Test --> '+acc.Name+' '+acc.Id);
        }

        // for(String str : new IteratorInApex()){
        //     System.debug('Test String --> '+str);
        // }

    }
    
}