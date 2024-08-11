public with sharing class Basic {
    //New
    public static void basicDatatypes() {
        String s = 'Sangram';
        Long l1 = 555555555555555555l;
        Integer i = 34;
        Double d = 56.98;
        Decimal dc = 67.98;
        Boolean b1 = true;
        Boolean b2 = false;
        Boolean b3 = 5 > 7;

        //No Char in Apex

        System.debug(s+' '+i+' '+l1+' '+d+' '+dc+' '+b1+' '+b2+' '+b3);

        Date d1 = Date.today();
        Date d2 = Date.newInstance(2008, 12, 8);
        System.debug(d1);

        Time t1 = Time.newInstance(15, 33, 23, 43);
        System.debug(t1);

        Datetime dt1 = Datetime.newInstance(2018, 2, 17, 09, 20, 45);
        Datetime dt2 = Datetime.now();
        System.debug(dt1+' '+dt2);

        ID i2 = '0016F00002SgrbH';

        String s1 = 'dtxfd5665d655d5dd5s5d5de56xsdddjdtydudt5d667d66dcy';
        Blob b = Blob.valueOf(s1);
        System.debug(b);
        String s2 = b.toString();
        System.debug(s2);

    }
}