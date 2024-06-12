public with sharing class lwcChallenge2 {
    public lwcChallenge2() {

    }
    @AuraEnabled(Cacheable=true)
    public static list<Case> getCases(String query){
        try {            
            String sanititizeQ = String.escapeSingleQuotes(query);
            String q = '%' + sanititizeQ + '%';
            return [SELECT CaseNumber, Subject, Description FROM Case WHERE Subject LIKE :q];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}