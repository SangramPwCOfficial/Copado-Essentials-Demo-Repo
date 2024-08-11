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

public with sharing class CustomLabelsInApex {
    static String customLabelString = System.Label.Sandbox_URL;

    public CustomLabelsInApex() {
        // Using the custom label in the constructor
        System.debug('Custom Label: ' + customLabelString);
    }

    public String getCustomLabelString() {
        return customLabelString;
    }
}