public with sharing class ContactController {
    public ContactController() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(){
        try {
            //return [SELECT firstName, lastName, Email FROM Contact];
            throw new AuraHandledException('Forced error');
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}