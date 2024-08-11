/**
 * @description       : 
 * @author            : Sangram Keshari Upadhyaya
 * @group             : 
 * @last modified on  : 03-05-2024
 * @last modified by  : Sangram Keshari Upadhyaya
 * Modifications Log
 * Ver   Date         Author                      Modification
 * 1.0   03-05-2024   Sangram Keshari Upadhyaya   Initial Version
**/

@isTest
private class CustomLabelsInApexTest{

	@isTest static void testMethod1() {
		// code_block
		String sandboxURL = 'https://pwc-3f-dev-ed.develop.lightning.force.com/lightning';

		CustomLabelsInApex cstApx = new CustomLabelsInApex();
		String chkSandboxURL = cstApx.getCustomLabelString();

		System.assertEquals(sandboxURL, chkSandboxURL, 'Tested');
	}

}