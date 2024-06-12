public with sharing class ContactHelper {
    public ContactHelper() {

    }
    
    public static void defaultEmailDomain(List<Contact> newList)
    {
        for (Contact con : newList)
        {
            if(String.isEmpty(con.Email))
            {
                con.Email = 'defaultEmail@email.com';
            }
        }
    }
    
    public static void updateAccountPhoneField(List<Contact> newList)
    {
        Set<Id> conAccountId = new Set<id>();
        for(Contact con : newList)
        {
            conAccountId.add(con.AccountId);
        }
       	List<Account> accList = [SELECT Id, Name, Phone FROM Account WHERE Id IN : conAccountId];
        List<Account> updateAccList = new List<Account>();
        For(Contact newCon : newList)
        {
            Contact oldCon = (Contact) Trigger.oldMap.get(newCon.Id);
            String oldPhone = oldCon.Phone;
            String newPhone = newCon.Phone;
            if(oldPhone != newPhone)
            {
                for(Account acc : accList)
                {
                    acc.Phone = newCon.Phone;
                    updateAccList.add(acc);
                }
            }
            
        }
        update updateAccList;
    }

    public static void preventEmailDomainChange(Map<Id, Contact> oldMap, List<Contact> newList){

        
        for (Contact cn : newList) {

            Contact co = oldMap.get(cn.Id);//efficient way of retrieving the record
            //as Map takes contains two paramters the ID and the old Contact
            //This allow us to iterate through the new contact and cycle through the Id.
            //using the .get method allow us to get the iterated contact id and retireve the
            //old contact.
           
                if(cn.Id == co.Id){
                    if (String.isBlank(co.Email)) {
                        return;
                        //guardclause if the situation occurs it will kick us out
                    }

                    String oldDomain = co.Email.substringAfter('@');
                    String newDomain = cn.Email.substringAfter('@');

                    if (oldDomain != newDomain) {
                        //this will show error message at the top of the page
                        //cn.addError('Domain can not be changed!');

                        cn.Email.addError('Domain can not be changed!');
                        // This will show the error at the email field
                    }
                }
                
            
            
        }

    }
}