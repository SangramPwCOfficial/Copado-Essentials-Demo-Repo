/**
 * @description       : 
 * @author            : Sangram Keshari Upadhyaya
 * @group             : 
 * @last modified on  : 04-30-2024
 * @last modified by  : Sangram Keshari Upadhyaya
**/
public with sharing class BasicClassDemo {
    Integer i;
    String names;
    
    public BasicClassDemo(Integer count, String namz) {
        i = count;
        names = namz;
    }
    
    public Integer printNameAndNumber() {
        System.debug('Number: ' + i);
        System.debug('Name: ' + names);
        return 0;
    }
}