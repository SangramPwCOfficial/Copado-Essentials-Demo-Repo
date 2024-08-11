/**
 * @description       : 
 * @author            : Sangram Keshari Upadhyaya
 * @group             : 
 * @last modified on  : 04-05-2024
 * @last modified by  : Sangram Keshari Upadhyaya
 * Modifications Log
 * Ver   Date         Author                      Modification
 * 1.0   04-05-2024   Sangram Keshari Upadhyaya   Initial Version
**/
import { LightningElement } from 'lwc';

export default class BmiCalculator extends LightningElement {
    
    /*
    *   Private Properties are non-reactive in nature, which means they do not create data binding and does not update template on their value change. 
    */

    //  Private & Non-Reactive Property
    //  Non reactive properties are declared without any decorator ,so even if the value of non reactive property changes component does not get re-render.
    //* However, as per Salesforce Spring ’20 Release Notes , All properties are made reactive proeprties.
    //  If property value changes, and the property is used in a template or if a getter of a property that’s used in a template, the component rerenders and displays the new value.
    cardTitle = "BMI Calculator";

    changePrivatePropertyHandler() {
        this.cardTitle = "Changes Value";
        console.log(`Check --> ${this.cardTitle}`);
    }
}