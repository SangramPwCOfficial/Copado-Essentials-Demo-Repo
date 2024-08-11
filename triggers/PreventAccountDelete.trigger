/**
 * @description       : 
 * @author            : Sangram Keshari Upadhyaya
 * @group             : 
 * @last modified on  : 04-10-2024
 * @last modified by  : Sangram Keshari Upadhyaya
 * Modifications Log
 * Ver   Date         Author                      Modification
 * 1.0   04-10-2024   Sangram Keshari Upadhyaya   Initial Version
**/
trigger PreventAccountDelete on Account (before delete) {

    Map<Id, Account> accMap = Trigger.oldMap;
    List<Opportunity> oppnList = [SELECT Id FROM Opportunity WHERE AccountId IN :accMap.keySet()];
    
    if(!oppnList.isEmpty()){
        System.debug('Trigger.oldMap: '+Trigger.oldMap);
        System.debug('Trigger.oldMap.values() : '+Trigger.oldMap.values());
        System.debug('Trigger.oldMap.values().get(0) : '+Trigger.oldMap.values().get(0));
        Trigger.oldMap.values().get(0).addError('Account cannot be deleted with Opportunities');
    }

}