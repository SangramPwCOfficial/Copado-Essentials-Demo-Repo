/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 10-19-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class Operators {
    public static void apexOperators() {
        /************************** ADD & SUBTRACT OPERATORS **************************/

        /************************** Rule 1 **************************/

        // If X & Y are integers or doubles then adds or subtracts the value of Y from X and
        // if X or Y is double then the result is double 

        integer x = 24;
        integer y = 23;

        System.debug(x + y); // The result is integer
        System.debug(x - y); // The result is integer

        integer x1 = 24;
        double y1 = 23;

        System.debug(x1 + y1); // The result is double
        System.debug(x1 - y1); // The result is double

        /************************** Rule 2 **************************/

        // if X is date and Y is an integer then it returns a new date that is
        // incremented or decremented by the specified number of days

        date d1 = Date.newInstance(2000,10,20);

        System.debug(d1 + 5); // 2000/10/25
        System.debug(d1 - 5); // 2000/10/15

        /************************** Rule 3 **************************/

        // If X is a Datetime and Y is an integer or double then it returns a new datetime which is
        // incremented or decremented by specified number of days with a fractional portion corresponding
        // to a portion of the day

        Datetime d2 = Datetime.newInstance(2000, 10, 10, 10, 00, 00);
        double dd = 5.2;
        System.debug(d2 + dd); 

        /************************** Rule 4 **************************/

        // '+' if X is a string and Y is a string or any other type of non-null argument
        // then it concatenates Y to the end of X

        String s1 = 'hello';
        String s2 = 'World';
        integer x2 = 3;
        double x3 = 3.5;

        System.debug(s1 + s2);
        System.debug(s1 + x2);
        System.debug(s2 + x3);

        /************************** SHORTHAND OPERATORS **************************/
        
        /**
        *
        *   +=, -=, /=, *=, !=, &=
        *
        *   X += Y, this is equivalent to, X = X + Y
        *   X -= Y, this is equivalent to, X = X - Y
        *   X /= Y, this is equivalent to, X = X / Y
        *   X *= Y, this is equivalent to, X = X * Y
        *   X |= Y, this is equivalent to, X = X | Y
        *   X &= Y, this is equivalent to, X = X & Y
        *
        *
        **/

        Integer m = 14;
        Integer n = 12;
        
        // Shorthand ADD (+=)
        m += n;
        System.debug(m);
        System.debug(n);

        // Shorthand SUBSTRACT (-=)
        m -= n;
        System.debug(m);
        System.debug(n);

        // Shorthand DIVIDE (/=)
        m /= n;
        System.debug(m);
        System.debug(n);

        // Shorthand MULTIPLY (*=)
        m *= n;
        System.debug(m);
        System.debug(n);

        Boolean o = true;
        Boolean p = false;
        Boolean q = false;
        Boolean r = false;

        // Shorthand OR (|=)
        o |= p;
        r |= o;
        p |= q;

        System.debug(o);
        System.debug(r);
        System.debug(p);

        // Shorthand AND (&=)
        o &= p;
        r &= o;
        p &= q;

        System.debug(o);
        System.debug(r);
        System.debug(p);

        /************************** EQUALITY (==) OPERATOR **************************/

        /************************** Rule 1 **************************/

        // String comparision using equality operator is CASE INSENSITIVE

        String ss1 = 'abc';
        String ss2 = 'ABC';

        System.debug(ss1 == ss2); //true

        /************************** Rule 2 **************************/

        // ID comparision using equality operator is CASE SENSITIVE

        ID id1 = '0015h00001UexuPAAR';
        ID id2 = '0015h00001UexuPaaR';

        System.debug(d1 == d2); //false

        /************************** Rule 3 **************************/

        // Arrays(==) performs a deep check of all the values before returning the result.

        List<integer> l1 = new Integer[]{1,2,3,4,5};
        List<Integer> l2 = new Integer[5];
        List<Integer> l3 = new Integer[5];

        for (Integer i = 0; i < 5; i++) {
            l3[i] = i + 1;
        }

        System.debug(l1);
        System.debug(l2);
        System.debug(l3);
        System.debug(l3 == l1);
        System.debug(l3 == l2);

        // This rule is applied for collections and built-in apex objects.

        /************************** Rule 4 **************************/

        /* User-defined objects are the objects of the classes that were created by us. */

        // User-defined object types are compared by reference which means that the 2 objects are equal if
        // they reference the same location in the memory.

        MyClass my1 = new MyClass();
        MyClass my2 = new MyClass();
        MyClass my3 = my1;

        System.debug(my1 == my2);
        System.debug(my1 == my3);

        // We can override this default comparison behaviour
        // by overriding equals() & hashcode() methods

        /************************** Exact Equality Operator **************************/

        // Always compares the location

        System.debug(my1 === my3); //true
        System.debug(my1 === my2); //false
        System.debug(l3 === l1); //false
        System.debug(l3 == l1); //true

        /************************** Exact Inequality Operator **************************/

        System.debug(my1 !== my3); //false
        System.debug(my1 !== my2); //true

        /************************** Relational Operators **************************/

        /*
        *
        *   >, <
        *   >=, <=
        *
        */

        /************************** Rule 1 **************************/

        // If X or Y equals null and are integers, doubles, dates or datetimes than it will return false.

        Integer a1;
        Integer b1 = 8;

        System.debug(a1 > b1); //false
        System.debug(a1 < b1); //false

        /************************** Rule 2 **************************/

        // A non-null string or id value is always greater than a null value.

        String c1 = 'okay';
        String c2;

        System.debug(c1 > c2); //true
        System.debug(c1 < c2); //false

        /************************** Rule 3 **************************/

        // If X & Y are ids then, they must reference the same object otherwise a runtime error occurs.

        ID ddd1 = '0015h00001UexuPAAR';
        Id ddd2 = '0015h00001UexuRAAR';
        Id ddd3 = '0015h00001UexuRAAR';

        System.debug(ddd1 >= ddd2); //false
        System.debug(ddd2 >= ddd3); //true

        ID ddd4 = '0035h00001FLq0gAAD';

        // System.debug(ddd1 >= ddd4); Runtime-error as the ids does belong to the same object

        /************************** Rule 4 **************************/

        // If X or Y is an id other value is a string then the string is validated and treated as an ID

        ID ddd5 = '0035h00001FLq0nAAD';
        String sss1 = 'This is it';

        // System.debug(ddd5 >= sss1); Runtime-error because string is treated as ID

        /************************** Rule 5 **************************/

        // X and Y cannot be boolean

        Boolean bool1 = true;
        Boolean bool2 = false;

        // System.debug(bool1 >= bool2);
        // System.debug(bool1 <= bool2);

        // Compile time error because boolean is not allowed

        System.debug(bool1 == bool2);

    }
}