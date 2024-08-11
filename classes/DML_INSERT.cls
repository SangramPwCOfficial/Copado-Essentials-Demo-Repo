public with sharing class DML_INSERT {

    public static void myMethods() {

        // Insert an Account into the Database and also some contacts those are related to the Account
        // Create some Opportunities and relate it to the same Account

        Account acc = new Account();
        acc.Name = 'Radhe Shyam';
        acc.Type = 'Others';
        acc.NumberOfEmployees = 19837;
        acc.Industry = 'Banking';
        acc.AccountNumber = '1234567890';

        Insert acc;

        // Associated Contacts

        List<Contact> conList = new List<Contact>();

        Contact con1 = new Contact(FirstName = 'Sameer', LastName = 'Fuddi', MailingCountry = 'India', Title = 'Mr.', Fax = '23245', AccountId = acc.Id);
        Contact con2 = new Contact(FirstName = 'Burj', LastName = 'Khalifa', MailingCountry = 'Dubai', Title = 'Mrs.', Fax = '53738', AccountId = acc.Id);

        conList.add(con1);
        conList.add(con2);

        Insert conList;

        // Associated Opportunity
        
        List<Opportunity> opnList = new List<Opportunity>();

        Date d1 = Date.newInstance(2008, 12, 8);
        Opportunity opn1 = new Opportunity(Name = 'Opportunities 1', StageName = 'Needs Analysis', Probability = 80, LeadSource = 'Web', CloseDate = d1, AccountId = acc.Id);
        Date d2 = Date.newInstance(2009, 11, 5);
        Opportunity opn2 = new Opportunity(Name = 'Opportunities 2', StageName = 'Prospecting', Probability = 20, LeadSource = 'Phone Inquiry', CloseDate = d2, AccountId = acc.Id);
        Date d3 = Date.newInstance(2020, 09, 8);
        Opportunity opn3 = new Opportunity(Name = 'Opportunities 3', StageName = 'Closed Won', Probability = 100, LeadSource = 'Phone Referral', CloseDate = d3, AccountId = acc.Id);
        Date d4 = Date.newInstance(2011, 05, 15);
        Opportunity opn4 = new Opportunity(Name = 'Opportunities 4', StageName = 'Closed Lost', Probability = 100, LeadSource = 'Other', CloseDate = d4, AccountId = acc.Id);

        opnList.add(opn1);
        opnList.add(opn2);
        opnList.add(opn3);
        opnList.add(opn4);

        Insert opnList;
    }
}