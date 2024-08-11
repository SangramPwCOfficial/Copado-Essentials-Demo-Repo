/**
 * @description       : 
 * @author            : Sangram Keshari Upadhyaya
 * @group             : 
 * @last modified on  : 04-30-2024
 * @last modified by  : Sangram Keshari Upadhyaya
 * Modifications Log
 * Ver   Date         Author                      Modification
 * 1.0   04-30-2024   Sangram Keshari Upadhyaya   Initial Version
**/
@isTest
private class BasicClassDemoTest {

@isTest
    private static void testPrintNameAndNumber() {
        BasicClassDemo demo = new BasicClassDemo(5,'Sangram');
        Integer i = demo.printNameAndNumber();
        System.assertEquals(0, i, 'Test Successful');
    }
}