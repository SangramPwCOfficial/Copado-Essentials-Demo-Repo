public with sharing class Assignment_One {
    public static void openQuestionOne() {

    //     In the following list<list<String>>
    //     Remove the duplicate values using best practice. Resulted string should be in sorted form.
    // 
    //     For ex:
    //     Input:
    //     list<list<’a;b;a;v;c’,’x;x;y;c;q’>,list<’m;b;h;j;m’,’u;k;j;u’>>
    //      
    //     Output:
    //     list<list<’a;b;c;v’,’c;q;x;y’>,list<’b;h;j;m’,’j;k;u’>>

        list<list<string>> rec = new list<list<string>>();
        list<string> str1 = new list<string>();
        list<string> str2 = new list<string>();
        str1.add('x;x;y;c;q');
        str1.add('a;b;a;v;c');
        str2.add('m;b;h;j;m');
        str2.add('u;k;j;u;m');

        rec.add(str1);
        rec.add(str2);

        
    }

    public static void openQuestionTwo() {

    //     Rotate the elements in the list:
    //     a) Clockwise (towards the right) by 5
    //     b) Anti-Clockwise (towards the left) by 7
        
        List<Integer> l5 = new List<Integer>{149, 1, 3, 248, 2, 8, 70, 5};

    }

    public static void openQuestionThree() {

    //     Write a program to find common elements for all three lists.
    //     For ex : (1,4,7,8)
    //     (2,5,3,6,4,8,9)
    //     (9,5,2,7,4)
    //     Here the result is only 4.

        List<Integer> il1 = new List<Integer>{1,4,7,8};
        List<Integer> il2 = new List<Integer>{2,5,3,6,4,8,9};
        List<Integer> il3 = new List<Integer>{9,5,2,7,4};

    }

    public static void openQuestionFour() {

    //     Print all the LEADERS in the list.
    //     Sample list: <149, 1, 3, 248, 2, 8, 70, 5>
    //     
    //     An element is a leader if it is greater than all the elements to its right side.
    //     149 is not greater than 248 so it is not a leader, neither 1 nor 3 but 248 is,as it is greater than all the elements on it’s right, so is 70 & 5.

        List<Integer> l4 = new List<Integer>{149, 1, 3, 248, 2, 8, 70, 5};
        Integer[] i1 = new List<Integer>();

        for (integer i = 0 ; i < l4.size(); i++){
            if (i != l4.size() && l4[i] > l4[i+1]) {
                i1.add(i);
            }
            else if(i == l4.size()){
                i1.add(i);
            }
            else{
                continue;
            }
        }

        System.debug(i1);

    }
}