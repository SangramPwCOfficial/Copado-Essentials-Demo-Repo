/**
 * @description       : 
 * @author            : Sangram Keshari Upadhyaya => Jhutha Makkaar
 * @group             : 
 * @last modified on  : 02-04-2024
 * @last modified by  : Sangram Keshari Upadhyaya
 * Modifications Log
 * Ver   Date         Author                      Modification
 * 1.0   01-31-2024   Sangram Keshari Upadhyaya   Initial Version
**/
public class updateTransDetOnAccTriggerClass {
    
    // //The map is declared as a global variable
    // public static Map<String,String> recordTypeIdWithNameMap = new Map<String,String>{'0125h000000mhKWAAY' => 'Deposit',
    //         '0125h000000mhKRAAY' => 'Withdraw'};
    
                
    // /*I did not create roll up summary fields for counting because roll up summary fields are updated in the last,
    // 	after trigger execution is also done. Also, roll Up summary fields do not allow avg calculation. */      
    // /*****************************************************************************************************
    //  	Method used to -
    // 	1. Count the number of deposit or withdrawal transactions on the Account
    // 	2. Calculate the avg transaction amount for deposit and withdrawal trasanctions
	// 	3. Update the balance on Account, when deposit or withdrawal transactions are executed
	// *******************************************************************************************************/     
    // public static void countAvgTransacAndBalUpdMethod(List<Transaction__c> oldRecordsList, List<Transaction__c> newRecordsList){
    	
    //     //Map of Account Id with the number of transactions (in this list of old/new records) on the account
    //     //index 0 stores the number of deposit transactions, index 1 stores the number of withdrawal transactions
    //     Map<Id,List<Integer>> accIdWithCountMap = new Map<Id,List<Integer>>();
        
    //     //Map of Account Id with the transaction amounts (in this list of old/new records) on the account
    //     //index 0 stores the deposited amount and index 1 stores the withdrawn amount
    //     Map<Id,List<Decimal>> accIdWithTransacAmtMap = new Map<Id,List<Decimal>>();
        
    //     //if old records list is not null, means it is update or delete operation
    //     if(oldRecordsList!=null){
    //         for(Transaction__c trans : oldRecordsList){
                
    //             //checking if this account appears 1st time (in this list of old/new records)
    //             //if true, initialize the counts with 0 -----
    //             if(!accIdWithCountMap.containsKey(trans.AccountCustom__c)){
    //                 accIdWithCountMap.put(trans.AccountCustom__c,new List<Integer>{0,0});
    //                 accIdWithTransacAmtMap.put(trans.AccountCustom__c, new List<Decimal>{0.0,0.0});
    //             }
                
    //             //If record type is Deposit
    //             if(recordTypeIdWithNameMap.get(trans.RecordTypeId) == 'Deposit'){
    //                 accIdWithCountMap.get(trans.AccountCustom__c)[0] -= 1;   
    //                 accIdWithTransacAmtMap.get(trans.AccountCustom__c)[0] -= trans.Amount__c;
    //             }
    //             //If record type is Withdraw
    //             else{
    //             	accIdWithCountMap.get(trans.AccountCustom__c)[1] -= 1;
    //                 accIdWithTransacAmtMap.get(trans.AccountCustom__c)[1] += trans.Amount__c;
    //             }
    //     	}                
    //     }
        
    //     //if new records list is not null, means it is insert or update operation
    //     if(newRecordsList!=null){
    //         for(Transaction__c trans : newRecordsList){
         
    //             //checking if this account appears 1st time (in this list of old/new records)
    //             //if true, initialize the counts with 0 -----
    //             if(!accIdWithCountMap.containsKey(trans.AccountCustom__c)){
    //                 accIdWithCountMap.put(trans.AccountCustom__c,new List<Integer>{0,0});
    //                 accIdWithTransacAmtMap.put(trans.AccountCustom__c, new List<Decimal>{0.0,0.0});
    //             }
                
    //             //If record type is Deposit
    //             if(recordTypeIdWithNameMap.get(trans.RecordTypeId) == 'Deposit'){
    //                 accIdWithCountMap.get(trans.AccountCustom__c)[0] += 1;   
    //                 accIdWithTransacAmtMap.get(trans.AccountCustom__c)[0] += trans.Amount__c;
    //             }
    //             //If record type is Withdraw
    //             else{
    //             	accIdWithCountMap.get(trans.AccountCustom__c)[1] += 1;
    //                 accIdWithTransacAmtMap.get(trans.AccountCustom__c)[1] -= trans.Amount__c;
    //             }
    //     	}
    //     }
        
    //     //List of accounts which needs to be updated 
    //     List<Account__c> updateAccountRecordsList = [SELECT Id, Number_Of_Deposit_Transactions__c, Number_Of_Withdrawal_Transactions__c,
    //                                                  Avg_Deposit_Transactions__c, Avg_Withdrawal_Transactions__c, Balance__c 
    //                                                  FROM Account__c where Id IN : accIdWithCountMap.keySet()];
        
    //     //populate the values to be updated in the account
    //     for(Account__c acc : updateAccountRecordsList){
    //         acc.Number_Of_Deposit_Transactions__c += accIdWithCountMap.get(acc.Id)[0];
    //         acc.Number_Of_Withdrawal_Transactions__c += accIdWithCountMap.get(acc.Id)[1];
            
    //         if(acc.Number_Of_Deposit_Transactions__c != 0)
    //         	acc.Avg_Deposit_Transactions__c = (accIdWithTransacAmtMap.get(acc.Id)[0])/(acc.Number_Of_Deposit_Transactions__c);
    //         else
    //             acc.Avg_Deposit_Transactions__c = 0;
            
    //         if(acc.Number_Of_Withdrawal_Transactions__c != 0)
    //         	acc.Avg_Withdrawal_Transactions__c = -(accIdWithTransacAmtMap.get(acc.Id)[1])/(acc.Number_Of_Withdrawal_Transactions__c);
    //         else
    //             acc.Avg_Withdrawal_Transactions__c = 0;
            
    //         acc.Balance__c += (accIdWithTransacAmtMap.get(acc.Id)[0] + accIdWithTransacAmtMap.get(acc.Id)[1]);
    //     }
    //     update updateAccountRecordsList;   
    // }
}