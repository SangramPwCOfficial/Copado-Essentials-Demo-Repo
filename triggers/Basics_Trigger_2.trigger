// EXAMPLE OF AFTER TRIGGER

trigger Basics_Trigger_2 on Contact (after insert) {

    Contact c = Trigger.new[0];
    Account a = new Account();

    a.Name = c.LastName + ' & Company';

    INSERT a;
}