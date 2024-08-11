/**
 * @description       : 
 * @author            : Sangram Keshari Upadhyaya
 * @group             : 
 * @last modified on  : 03-17-2024
 * @last modified by  : Sangram Keshari Upadhyaya 
 * Modifications Log
 * Ver   Date         Author                      Modification
 * 1.0   03-17-2024   Sangram Keshari Upadhyaya   Initial Version
**/
@isTest
private class TestDML_Class_1{

	@testSetup static void setup(){

		Account accountObj = new Account (
			Type ='Prospect', 
			NumberOfEmployees = 12,
			Name = 'test value'
		);
		insert accountObj;
	}

	@isTest static void testMethod1() {
		// code_block	
	}

	@isTest static void testMethod2() {
		// code_block	
	}
}