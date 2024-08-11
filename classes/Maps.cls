public with sharing class Maps {
    public static void Maps() {
        // Key Value Pairs
        Map<Integer, String> m1 = new Map<Integer, String>();

        m1.put(11, 'Sangram');
        m1.put(12, 'Rajesh');
        m1.put(13, 'Suresh');

        System.debug(m1);

        m1.put(11, 'Situ');

        System.debug(m1);

        Map<Integer,String> m2 = new Map<Integer,String>{1=>'qwq', 2=>'qaq'};
        System.debug(m2);

        // Methods

        // Keys are returned in Sets
        // Values are returned in Lists

        m2.putAll(m1);
        System.debug(m2);

        String s = m2.get(1);
        System.debug(s);
        System.debug(m2.get(11));

        List<String> values = new List<String>();
        values = m2.values();
        System.debug(values);

        Set<Integer> keys = new Set<Integer>();
        keys = m2.keySet();
        System.debug(keys);

        Map<Integer,String> m3 = new Map<Integer,String>();
        m3 = m2.clone();
        System.debug(m3);

        System.debug(m3.containsKey(11));
        System.debug(m3.containsKey(44));

        System.debug(m3.isEmpty());
        System.debug(m3.size());
        System.debug(m3.remove(2));
        System.debug(m3);
        
        m3.clear();
        System.debug(m3);

    }
}