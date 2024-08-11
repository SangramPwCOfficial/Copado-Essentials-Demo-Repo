/**
 * @description       : 
 * @author            : Sangram Keshari Upadhyaya
 * @group             : 
 * @last modified on  : 05-11-2024
 * @last modified by  : Sangram Keshari Upadhyaya
 * Modifications Log
 * Ver   Date         Author                      Modification
 * 1.0   05-08-2024   Sangram Keshari Upadhyaya   Initial Version
**/
public with sharing class OpportunityTriggerHandler {

    public static void getMaxOpportunity(List<Opportunity> oldOppnList, Map<Id, Opportunity> newOppnMap){
        System.debug('List -->' + oldOppnList);
        System.debug('Map -->' + newOppnMap);
    }
    
}