@RESTResource(urlMapping='/CreateLead/')
global with sharing class CreateLeadAPI {
    
    @HTTPPost
    global static String createLead(){
        
        String fName, lName, company;
        
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;

        String jsonBody = req.requestBody.toString();

        JSONParser parser = JSON.createParser(jsonBody);

        return 'Lead Created';

    }
}