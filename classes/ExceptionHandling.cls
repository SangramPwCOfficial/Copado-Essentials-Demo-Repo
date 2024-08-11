public with sharing class ExceptionHandling {
    public static void myMethods(Integer i) {

        /************************** EXCEPTION HANDLING **************************/

        // An exception denotes an error or event that disrupts the normal flow of code execution.

        // Exception disrupts the normal flow of the application hence to keep the application we use exeception handling.

        // Exception handling is the process of responding to exceptions that appear in the code during it's runtime
        // so that normal flow of the application can be maintained.

        // Program Flow -->      Exception  --> X ---> Output
        //               |                         |
        //               --> Exception Handling ---

        /*************** IMPORTANT POINTS ***************/

        // What exactly happens when an Exception occurs ?

        /*
        *
        *   -> When an exception occurs, code execution halts.
        *   -> Any DML operations that were processed before the exception are rolled back and aren't committed to the database.
        *   -> Exceptions get logged in debug logs.
        *   -> For unhandled exceptions, that is, exceptions that the code doesn't catch, Salesforce sends an email that includes the
        *      the exception information.
        *   -> The end user sees an error message in the Salesforce user interface.
        *
        */

        /*************** TYPES OF EXCEPTIONS ***************/

        /*
        *
        *   System Defined Exceptions
        *       --> DML Exception
        *       --> List Exception
        *       --> NullPointer Exception
        *       --> Query Exception
        *
        *   Custom or User-Defined Exceptions
        *       --> Generic Exception
        *
        */

        /*************** EXCEPTION STATEMENTS ***************/

        // There are different types of exception statements in apex:

        /*
        *   1. Throw Statements:
        *       A throw statement is used to generate an exception or to signal that an exception has occured.
        *
        *       throw exceptionObject;
        *
        *   2. Try-catch-finally Statements:
        *       Try, catch, and finally are the Exception statements that can be used together to capture an exception
        *       and handle it gracefully.
        *
        *       Try: A try block encloses the code where exception can occur.
        *       
        *       Catch: Catch block is optional and comes immediately after try block and can handle a particular type of exception.
        *              A single try statement can have zero to more associated catch statements where each catch statement must have
        *              a unique exception type.
        *
        *       Note:- Once a particular exception type is caught in one catch block, the remaining catch blocks(if any) are not
        *              executed.
        *
        *       Finally: Finally block is mandatorily executed at the end whether the exception occured in the try block or not.
        *                It's not compulsory for try block to have finally associated with it and also there can be at max only 1
        *                finally block that can be associated to 1 try block. Finally block is generally used to cleanup code or for
        *                freeing up resources.
        *
        *       Note:- With every try block there should be at least 1 catch or finally block associated.      
        *
        */

        /*************** EXCEPTION HANDLING SYNTAX ***************/

        /*
        *
        *       try {
        *
        *           // try block
        *           
        *       } catch (exceptionType variableName) {
        *
        *           // Initial catch Block
        *           // At least 1 catch block or finally block must be present.
        *           
        *       } catch (Exception e) {
        *
        *           // Optional additional catch statements for other exception types.
        *
        *           // Note:- The general exception type, 'Exception' must be the last catch block when it is used.
        *           
        *       } finally {
        *
        *           // finally block
        *           // this code block is always executed
        *           
        *       }
        *       
        */

        try {
            
            Integer a;
            Integer b = a*10;                       // Throws Exception because a's value is not defined.

            // Lines written after the exception point will not get executed.

            String s = 'The value is ';
            System.debug(s + i);

        } catch (Exception e) {
            
            System.debug('I catch the Exception');

        } finally {
            
            System.debug('No matter whether an exception in the try block occured or not I will always executed :)');

        }

    }

    public static void myMethods2(){

        /********************** SYSTEM DEFINED EXCEPTIONS **********************/
    
        /*************** DML EXCEPTIONS ***************/
    
        // These exceptions are thrown when we are trying to do some database operations and those get failed.
    
        try {
    
            Account a = new Account();
            INSERT a;
            
        } catch (DmlException dme) {
    
            System.debug('Record can\'t be inserted: ' + dme.getMessage());
            
        }

        /*************** LIST EXCEPTIONS ***************/

        try {
            
            List<String> str = new List<String>{'Sangram', 'Rakesh', 'Shammi', 'Rohit'};

            System.debug(str[0]);               // Sangram
            System.debug(str.get(1));           // Rakesh
            System.debug(str.get(2));           // Shammi
            System.debug(str[3]);               // Rohit

            // Will throw a ListException as there is no element at this index.
            // Or the index 3 does not exist in the List.
            System.debug(str.get(4));

        } catch (ListException le) {
            
            System.debug('There is no value on this index: '+'\n'+ le.getMessage());

        }

        /*************** NULLPOINTER EXCEPTIONS ***************/

        
    }

}