/**
 * @description       : 
 * @author            : Sangram Keshari Upadhyaya
 * @group             : 
 * @last modified on  : 05-29-2024
 * @last modified by  : Sangram Keshari Upadhyaya
 * Modifications Log
 * Ver   Date         Author                      Modification
 * 1.0   03-10-2024   Sangram Keshari Upadhyaya   Initial Version
**/

// It is used to import any of the ES module into our Lightning Web component(here we are importing lwc module)
// This is a mandatory step here as we are not going to use the HTML Element here instead we will be using lightningElement which is a wrapper of the normal HTML element
// We can import multiple ES module by using multiple import statements
// We can import other properties from the module we can use ',' to separate the properties in the same import statement
import { LightningElement, api, track, wire } from 'lwc';


// The export statement here will export the current file as a ES module so that other files can import it or use it as a ES module
// The class name is same as the bundle name only that it is written in Pascal Case here
// It extends a lightningElement, which means that it can use all the properties of the lightnigtningElement while we construct our custom component
export default class Basic extends LightningElement {

    // All our client-side logic needs to go inside these parenthesis that means inside the constructor of our class
    // This is a mandatory step here

    dynamicDataBinding = 10+2;

    // When a property is trackable it creates one data binding in backend from JS file to HTML file
    // The template file(HTML File) will auto render the changes in the property decorated with @track
    @track dynamicDataBindingFromInput;
    @track divVisibility = false;
    @track showButton = true;
    @track hideButton = false;
    @track cityNames = ['Bhubaneswar', 'Cuttuck', 'Bhadrak', 'Balasore'];
    @track cityWithFamousPlace = [
         {
            Id: '123',
            Name: 'Bhubaneswar',
            Place: 'Sangam',
            Role: 'CEO',
            Favorite: 'TRUE',
         },

         {
             Id: '234',
             Name: 'Cuttuck',
             Place: 'Rutu',
             Role: 'CTO',
             Favorite: 'FALSE',
         },

         {
             Id: '345',
             Name: 'Bhadrak',
             Place: 'Suman',
             Role: 'MD',
             Favorite: 'TRUE',
         },
        ]

    onClick(evt){

        // The property belongs to the class therefore we used this. to the property name
        this.dynamicDataBindingFromInput = evt.target.value;
    }

    handleClick(evt){
        console.log(evt.target.value);
    }

    handleClickForVisibility(){
        this.divVisibility = !this.divVisibility;
        this.showButton = !this.showButton;
        this.hideButton = !this.hideButton;
    }


}