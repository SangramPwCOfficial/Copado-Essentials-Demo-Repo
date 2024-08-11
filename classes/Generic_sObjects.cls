public with sharing class Generic_sObjects {
    public static void Generic_sObjects() {
        sObject s1 = new Contact(FirstName='testing');
        s1 = new Account(Name='sObject');

        s1.put('NumberOfEmployees', 200);

        Object objValue = s1.get('NumberOfEmployees');
    }
}