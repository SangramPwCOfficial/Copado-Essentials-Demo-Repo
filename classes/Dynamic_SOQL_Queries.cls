public with sharing class Dynamic_SOQL_Queries {
    public static void myMethod() {
        /************************** Dynamic SOQL Queries **************************/

        String s = 'SELECT Name, NumberOfEmployees FROM Account';
        List<sObject> acList = Database.query(s);

        System.debug(acList);

        // Creating a query string dynamically

        String qr = 'SELECT Id, Name';
        String objName = 'Account';

        String[] qrList = new List<String>();
        qrList.add('NumberOfEmployees');
        qrList.add('Rating');
        qrList.add('Phone');

        String qc = '';

        for(String parameter: qrList){
            qc = qr + ', '+ parameter + ' FROM ' + objName;

            System.debug(qc);

            List<sObject> acList1 = Database.query(qc);
            System.debug(acList1);
        }
    }
}