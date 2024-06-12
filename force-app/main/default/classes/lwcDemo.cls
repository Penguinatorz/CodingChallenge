public with sharing class lwcDemo {
    public lwcDemo() {

    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(String query){
        try {
            String sanititizeQ = String.escapeSingleQuotes(query);
            String q = '%' + sanititizeQ + '%';
            return [SELECT Name, Rating FROM Account WHERE Name LIKE :q AND Rating = 'Hot'];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}