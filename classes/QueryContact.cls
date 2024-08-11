/**
 * @description       : 
 * @author            : Sangram Keshari Upadhyaya
 * @group             : 
 * @last modified on  : 04-01-2024
 * @last modified by  : Sangram Keshari Upadhyaya
 * Modifications Log
 * Ver   Date         Author                      Modification
 * 1.0   04-01-2024   Sangram Keshari Upadhyaya   Initial Version
**/
public class QueryContact {
    public static Id getContactID(String lastName, String title) {
    
        try {
            Contact myContact = Database.query(
            'SELECT ID FROM Contact WHERE lastName = :lastName AND title = :title LIMIT 1'
            );
        
            return myContact.Id;

        } 
        
        catch (Exception ex) {
        
            return null;

        }
    
    }

    public static Id getContactIDWithBinds(Map<String, Object> bindVars) {
    //do not modify any code above this line
    //implement the logic that will use bindVars to retrieve the contact's ID

        String queryString = 'SELECT ID FROM Contact WHERE lastName = :lastName AND title = :title LIMIT 1';
        List<Contact> conList = Database.queryWithBinds( queryString, bindVars, AccessLevel.USER_MODE );

        if(!conList.isEmpty() && conList != NULL){

            return conList[0].Id;
        
        }

        else {

            return null;
        
        }

    }

}