/**
 * @description       : 
 * @author            : Sangram Keshari Upadhyaya
 * @group             : 
 * @last modified on  : 04-01-2024
 * @last modified by  : Sangram Keshari Upadhyaya
**/
public with sharing class ApexConstructors {
    
    /*********************** APEX CONSTRUCTORS **********************/
    /*
    *   A constructor is a special method that is used to initialize objects.
    *   It is a special method because:
    *       - It must be declared using the class name as its signature.
    *       - It get's called when an object of a class is created.
    *       - It doesn't return any value.
    *       - It must be placed in a class outside of any method.
    *   A Constructor can be used to perform any task that we want to perform at the same time we create an object of the class.
    *   Constructor of a class is called with help of the new keyword.
    *   A Constructor can be parameterized or non-parameterized.
    *   Each calss has a non-parameterized constructor by default.
    *   Once you create a parameterized constructor for a class, it losses the default(non-parameterized) constructor.
    */

    // Class with Non-Parameterized Constructor
    class Class1 {
        Integer a;
        Integer b;
        String c;

        public void accept(Integer x, Integer y, String z){

            a = x; // Integer
            b = y; // Integer
            c = z; // String

        }

        public void show(){
            System.debug('The vaues are: '+a+' '+b+' '+c);
        }

    }

    // CClass with Parameterized Constructor
    class Class2 {
        Integer m;
        Integer n;
        String o;

        public Class2(Integer p, Integer q, String r){
            m = p;
            n = q;
            o = r;
        }

        // * Accept method is not needed as the parameterized constructor is accepting the values during object creation & assigning it back to the data members.
        // * So no need to define a separate method for accepting the values.
        // public static void accept(Integer p, Integer q, String r){
        //     m = p;
        //     n = q;
        //     o = r;
        // }

        public void show(){
            System.debug('The vaues are: '+m+' '+n+' '+o);
        }

    }

    public static void run(){

        // Created Object of Class 1
        Class1 obj1Class1 = new Class1();
        obj1Class1.accept(10, 20, 'XYZ');
        obj1Class1.show(); // The values will be 10,20,'XYZ'

        // Created Object of Class 1
        Class1 obj2Class1 = new Class1();
        obj2Class1.show(); // This will print NULL values for a,b,c as the non-parameterized contructor didn't initailized the valuesf for it's data members.

        // Created Object of Class 2
        Class2 obj1Class2 = new Class2(56, 96, 'Salesforce');
        obj1Class2.show(); // The values will be 56,96,'Salesforce'

        // Created Object of Class 2 with no parameters
        // * It will throw compile time error as once a constructor is created as parameterized,it losses the default(non-parameterized) constructor.
        // * Class2 obj2Class2 = new Class2();
        // * obj2Class2.show();
    }
}