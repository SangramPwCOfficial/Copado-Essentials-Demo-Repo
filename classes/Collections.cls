public with sharing class Collections {
    public static void Collections() {

        //Lists

        List<Integer> l1 = new List<Integer>();
        l1.add(45);
        l1.add(55);
        l1.add(6);
        l1.add(45);

        List<String> l2 = new List<String>();
        l2.add('S');
        l2.add('a');

        System.debug(l1+' '+l2);

        List<Integer> l3 = new List<Integer>{2,5,8,7,3,2};
        System.debug(l3);

        List<Account> l4 = new List<Account>();
        System.debug(l4);

        //Methods

        Integer listSize1 = l1.size();
        System.debug(listSize1);
        System.debug(l1.get(2));
        l1.set(0, 40);
        System.debug(l1);
        
        l1.remove(3);
        System.debug(l1[2]);
        System.debug(l1);
        System.debug(l1.size());

        List<Integer> l5 = l1.clone();
        System.debug(l5);

        l5.sort();
        System.debug(l5);

        System.debug(l5.isEmpty());

        l5.clear();

        System.debug(l5.isEmpty());


        // Array Notation

        Integer[] an1 = new Integer[4];
        Integer[] an2 = new List<Integer>();
        List<Integer> an3 = new Integer[4];

        an1[0] = 1;
        an1[2] = 2;

        System.debug(an1);
        System.debug(an3);

    }
}