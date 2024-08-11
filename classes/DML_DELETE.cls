public with sharing class DML_DELETE {
    public static void myMethodS() {

        List<Contact> dupConList = new List<Contact>();

        Contact c1 = new Contact(FirstName = 'Duplicate', LastName = 'Contact');
        Contact c2 = new Contact(FirstName = 'Duplicate', LastName = 'Contact');
        Contact c3 = new Contact(FirstName = 'Duplicate', LastName = 'Contact');
        Contact c4 = new Contact(FirstName = 'Duplicate', LastName = 'Contact');
        Contact c5 = new Contact(FirstName = 'Duplicate', LastName = 'Contact');

        dupConList.add(c1);
        dupConList.add(c2);
        dupConList.add(c3);
        dupConList.add(c4);
        dupConList.add(c5);

        // Insert dupConList;
        
        // Duplicate contacts in the database, need to remove it

        // --> Get the total list of contacts in the DB
        // --> Create a map with:
        //                      key   --> Contact Name
        //                      value --> Contact Id
        //     Unique Contacts are now present in the map
        // --> Create 2 lists:
        //                   -> To store unique Contacts
        //                   -> To store Duplicate Contacts
        // --> Create 2 sets:
        //                  -> To store keys of the map
        //                  -> To store Ids of the contacts from the map
        // --> Reiterate the original list having all the contact records and check the the id's of the records if present in second set
        // --> If YES
        //            Add to unique list of contacts
        // --> If NO
        //            Add to duplicate list of contacts
        // --> Delete Duplicate List

        // Algorithm

        /*
            list = [
                    dup, xyz
                    dup, abc
                    mup, mno
                    mup, pqr
                    ]

            map = [dup --> xyz]
                  [mup --> mno]
                
            set s1 = [dup, mup]

            set s2 = [xyz, mno]

            check = list Id in s2
                                --> yes
                                        uniqList --> Add
            
                                --> no
                                        delList --> Add
            delete delList
        
        */

        List<Contact> conList = [SELECT Id, FirstName, LastName FROM Contact];
        // System.debug(conList);

        Map<String, Id> nmap = new Map<String, Id>();

        for (Contact con : conList) {
            nmap.put(con.FirstName+' '+con.LastName, con.Id);
        }

        // System.debug(nmap);

        List<Contact> conUnique = new List<Contact>();
        List<Contact> conDel = new List<Contact>();

        // It has the Names which are the keys of the map
        Set<String> s1 = nmap.keySet();
        // System.debug('Names: '+s1);

        //It will have the ID of the names in s1
        Set<Id> uniqSet = new Set<Id>();

        for (String s : s1) {
            uniqSet.add(nmap.get(s));
        }

        // System.debug('IDs: '+uniqSet);

        for (Contact con : conList) {
            if (uniqSet.contains(con.Id)) {
                conUnique.add(con);
            }
            else {
                conDel.add(con);
            }
        }

        // System.debug(conDel);

        Delete conDel;
    }
}