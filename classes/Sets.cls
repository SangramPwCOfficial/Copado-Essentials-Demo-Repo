public with sharing class Sets {
    public static void Sets() {
        // Order doesn't matter
        // Unique Values

        Set<Integer> s1 = new Set<Integer>();
        s1.add(2);
        s1.add(3);
        s1.add(2);

        System.debug(s1);
        // {2,3}

        Set<Integer> s2 = new Set<Integer>{2,4,53,4};
        System.debug(s2);

        Set<String> s3 = new Set<String>{'Sang', 'ram'};
        System.debug(s3);

        //Sobject Sets

        Set<Account> sa1 = new Set<Account>();

        Account a1 = new Account();
        a1.Name = 'Amazon';
        a1.NumberOfEmployees = 20000;

        Account a2 = new Account(Name='PwC', NumberOfEmployees=23000);

        Account a3 = new Account(Name='Aws', NumberOfEmployees=10000);
        Account a4 = new Account(Name='Amazon',NumberOfEmployees=20000);
        Account a5 = new Account();
        a5.Name = 'Amazon';

        sa1.add(a1);
        sa1.add(a2);
        sa1.add(a3);
        sa1.add(a4);
        sa1.add(a5);

        System.debug(sa1);
        System.debug(sa1.size());

        // Methods

        List<Integer> l1 = new List<Integer>(4);
        l1[0] = 4;
        l1[1] = 2;
        l1[2] = 1;
        l1[3] = 5;
        Set<Integer> sa2 = new Set<Integer>{3,4,9};

        sa2.addAll(l1);

        System.debug(sa2);

        System.debug(sa2.contains(2));
        System.debug(sa2.containsAll(l1));
        System.debug(sa2.size());

        sa2.retainAll(l1);
        System.debug(sa2);

        Set<Integer> sa3 = sa2.clone();
        System.debug(sa3);

        sa3.remove(5);
        System.debug(sa3);

        sa3.removeAll(l1);
        System.debug(sa3);

        sa3.clear();
        System.debug(sa3);

    }
}