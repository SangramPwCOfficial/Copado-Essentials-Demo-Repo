/**
 * @description       : 
 * @author            : Sangram Keshari Upadhyaya
 * @group             : 
 * @last modified on  : 04-04-2024
 * @last modified by  : Sangram Keshari Upadhyaya
 * Modifications Log
 * Ver   Date         Author                      Modification
 * 1.0   04-02-2024   Sangram Keshari Upadhyaya   Initial Version
**/
import { LightningElement,track } from 'lwc';

export default class SimpleCalculator extends LightningElement {
    @track currentResult;
    @track showHistory = false;
    @track historyList = [];

    firstNumber = 0;
    secondNumber = 0;

    numberChangeHandler(event){
        if(event.target.name === 'firstNumber') {
            this.firstNumber = event.target.value;
            if(this.firstNumber === NaN) {
                this.firstNumber = 0;
            }
            else {
                this.firstNumber = parseFloat(this.firstNumber);
            }

            //* HTML textbox always returns a string value, so it's recommended to use parseInt()/parseFloat() method to convert it into Integer/Float values.
            // console.log(typeof this.firstNumber);
        }
        else {
            if(this.secondNumber === NaN) {
                this.secondNumber = 0;
            }
            else {
                this.secondNumber = parseFloat(event.target.value);
            }

            //* HTML textbox always returns a string value, so it's recommended to use parseInt()/parseFloat() method to convert it into Integer/Float values.
            // console.log(typeof this.secondNumber);
        }
    }

    handleAdd(){
        if(this.firstNumber == 0 || this.secondNumber == 0) {
            this.currentResult = this.firstNumber == 0? `Result of ${this.firstNumber} + ${this.secondNumber} is: ${this.secondNumber}` : `Result of ${this.firstNumber} + ${this.secondNumber} is: ${this.firstNumber}`;
        }

        else {
            this.currentResult = `Result of ${this.firstNumber} + ${this.secondNumber} is: ${this.firstNumber + this.secondNumber}`;
            this.historyList.push(this.currentResult);
        }
    }

    handleSubtract(){
        if(this.firstNumber == 0 || this.secondNumber == 0) {
            this.currentResult = this.firstNumber == 0? `Result of ${this.firstNumber} - ${this.secondNumber} is: -${this.secondNumber}` : `Result of ${this.firstNumber} - ${this.secondNumber} is: ${this.firstNumber}`;
        }

        else {
            this.currentResult = `Result of ${this.firstNumber} - ${this.secondNumber} is: ${this.firstNumber - this.secondNumber}`;
            this.historyList.push(this.currentResult);
        }
    }

    handleMultiply(){
        if(this.firstNumber == 0 || this.secondNumber == 0) {
            this.currentResult = this.firstNumber == 0? `Result of ${this.firstNumber} x ${this.secondNumber} is: ${this.firstNumber}` : `Result of ${this.firstNumber} x ${this.secondNumber} is: ${this.secondNumber}`;
        }

        else {
            this.currentResult = `Result of ${this.firstNumber} x ${this.secondNumber} is: ${this.firstNumber * this.secondNumber}`;
            this.historyList.push(this.currentResult);
        }
    }

    handleDivision() {
        if(this.firstNumber == 0 || this.secondNumber == 0) {
            this.currentResult = this.firstNumber == 0? `Result of ${this.firstNumber} / ${this.secondNumber} is: 0` : `Result of ${this.firstNumber} x ${this.secondNumber} is: Undefined`;
        }

        else {
            this.currentResult = `Result of ${this.firstNumber} / ${this.secondNumber} is: ${this.firstNumber / this.secondNumber}`;
            this.historyList.push(this.currentResult);
        }
    }

    handleReset() {
        this.currentResult = '';
        this.firstNumber = 0;
        this.secondNumber = 0;
    }

    handleHistoryCmp() {
        this.showHistory = !this.showHistory;
    }
}