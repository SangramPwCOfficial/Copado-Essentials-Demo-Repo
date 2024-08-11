/**
 * @description       : 
 * @author            : Sangram Keshari Upadhyaya
 * @group             : 
 * @last modified on  : 02-11-2024
 * @last modified by  : Sangram Keshari Upadhyaya
 * Modifications Log
 * Ver   Date         Author                      Modification
 * 1.0   02-09-2024   Sangram Keshari Upadhyaya   Initial Version
**/

/************************** Batch Apex **************************/

// To overcome the problem of hitting the governor limits whenever we are trying to use DML Statements over a large number of datasets, salesforce has given the concept of Batch Classes.
// We can execute our operations on many number of records (> 1000s).
// With Batch apex we divide the 1000s of records into managable smaller chunks which we call it as Batches.
// Every Batch Apex class implements the Database.Batchable interface
// the Database.BatchableContext gets passed into all of the three methods of Batch class to keep the context of the batch class similar.

global with sharing class BatchApex implements Database.Batchable<sObject>, Schedulable {
    
    // It gets executed only a single time
    // it has a return type "Database.BatchableContext"
    Datetime startTime = Datetime.now();
    global Database.QueryLocator start(Database.BatchableContext bc){

        return Database.getQueryLocator([SELECT AnnualRevenue FROM Lead]);

    }

    // It gets executed as many time as there are batches
    // it has a return type "void" as it don't return anything
    // it accepts 2 parameters:
    //      --> Database.BatchableContext var
    //      --> List<Lead> lList
    global void execute(Database.BatchableContext bc, List<Lead> lList){
        for(Lead l : lList){

            if(l.AnnualRevenue == null){
                l.AnnualRevenue = 1000000000;
            }

        }

        UPDATE lList;
        
    }

    // It gets executed only a single time
    // it has a return type "void" as it don't return anything
    global void finish(Database.BatchableContext bc){

        Datetime endTime = Datetime.now();
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] mailAddress = new String[]{'situn.201@gmail.com', 'sangram.k.upadhyaya@pwc.com'};

        mail.setToAddresses(mailAddress);
        mail.setSubject('CONGRATULATIONS !!! Batch is executed Successfully');
        mail.setPlainTextBody('Hey, the Batch job that you started got executed successfully, please check the results. It took '+(endTime.getTime()-startTime.getTime())+' minutes to execute the apex code.');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});

    }

    /* To execute a Batch Apex,
    
       BatchApex ba = new BatchApex();
       Database.executeBatch(ba);

    */
    
    // We can schedule a batch class by implementing Schedulable Interface
    global void execute(System.SchedulableContext sh){

        BatchApex ba = new BatchApex();
        Database.executeBatch(ba);

    }

}