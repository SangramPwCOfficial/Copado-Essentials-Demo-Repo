public with sharing class LoopingStatements {
    public static void apexLoopingStatements() {

        /************************** FOR EACH LOOP **************************/

        /*
        *
        *       for(variable : List or Set){
        *           
        *           Write the code in this block which you want to execute for all the elements in the list or set
        *
        *       }
        *       
        */

        List<integer> l1 = new List<Integer>{1,2,3,4,5};
        
        Double[] l2 = new Double[4];
        for(Integer i = 0; i < l2.size(); i++){
            l2[i] = (i*2) + 1;
        }
        System.debug(l2);

        Double[] l3 = new List<Double>{1.0,3.0,4.0,5.0};
        Integer m = 0;
        while (m < l3.size()) {
            l3[m] = (m*2) - 1;
            m++;
        }
        System.debug(l3);

        Integer a = 20;
        for (integer x : l1) {
            System.debug(a*x);
        }

        for (double y : l2) {
            System.debug(y+1.1);
        }

        for (double z : l3) {
            System.debug(z-1);
        }
    }
}