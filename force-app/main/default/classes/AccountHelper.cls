public with sharing class AccountHelper {
    public AccountHelper() {

    }

   public static void noDeleteAccountWithContact(List<Account> oldList){
       List<Contact> conList = [SELECT Id, Name, AccountId FROM Contact WHERE AccountId IN : oldList];
       For(Account acc : oldList)
       {
           For(Contact con : conList)
           {
               String accountId = acc.id;
               String conAccountId = con.AccountId;               
               if(accountId == conAccountId)
               {
                   acc.addError('Cannot Delete this Account with a Contact');
               }
           }
       }

    }

    public static void createDummyContact(List<Account> accList){

        List<Contact> newConList = new List<Contact>();

        for(Account acc: accList){
            Contact con = new Contact();
            con.lastName = 'TestLastName';
            con.AccountId = acc.Id;
            newConList.add(con);
        }
        
        Database.insert(newConList);

    }
}