public with sharing class TypeConversion {
    public static void TypeConversion() {

        //***************************** Rules Of conversion *******************

        // Apex requires explicit conversion from one datatype to another
        // However some datatype can be implicitly converted like variables of lower numeric type to higher types
        // Hierarchy of numbers: INTEGERS < LONG < DOUBLE < DECIMAL

        // *************************** RULE 1 *****************************

        // IDs can always be assigned to Strings

        ID i1 = '0015h00001UexuPAAR';
        String s1 = i1;
        System.debug(s1);

        // *************************** RULE 2 *****************************

        // Strings can be assigned to IDs.

        ID i2 = s1; // At runtime it will be verified that if s1 is a valid ID or not
                    // If not then a runtime error will be thrown

        // *************************** RULE 3 *****************************

        // If the numeric value of the right hand side exceeds the maximum value of an integer we will get a compilation error.

        // long l1 = 2147483649;

        Long l1 = 2147483649L; // This is allowed.

        // *************************** RULE 4 *****************************

        // Arithmetic computation that produce values larger than the max values of the current type are set to overflow

        integer i = 2147483647 + 1; //overflow

        /*
        * Note:
        * 
        * Once a value has been passed from a number of lower type to a number of higher type,
        * the value is converted to the higher type of number.
        *
        *
        */
    }
}