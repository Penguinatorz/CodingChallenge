public class DataLord {
    
    public Integer numAccounts(){
        List<Account> returnAcc = [SELECT Name FROM Account];
        Integer returnNum = 0;
        for(Integer i = 0; i<returnAcc.Size(); i++){
            returnNum++;
        }
        
        
        return returnNum;
    }
    
    public Integer numHot(){
        List<Account> returnAcc = [SELECT Name FROM Account WHERE Rating = 'Hot'];
        Integer returnNum = 0;
        for(Integer i = 0; i<returnAcc.Size(); i++){
            returnNum++;
        }
        
        
        return returnNum;
    }
    
        public Integer numComplex(){
        List<Account> returnAcc = [SELECT Name FROM Account WHERE Name LIKE '%&%'];
        Integer returnNum = 0;
        for(Integer i = 0; i<returnAcc.Size(); i++){
            returnNum++;
        }
        
        
        return returnNum;
    }
    
    Public List<Account> bigFive (){
        return [SELECT Name, AnnualRevenue FROM Account WHERE AnnualRevenue > 1 ORDER BY AnnualRevenue DESC LIMIT 5];
    }
    
    Public List<Opportunity> lastBigOpportunity (){
        return [SELECT Name, Amount, CloseDate FROM Opportunity WHERE Amount > 100000 ORDER BY CloseDate Desc];
    }
    
    Public List<Contact> majorPlayers (){
        return [SELECT Name, Account.Name, Account.Rating FROM Contact WHERE Account.Rating = 'Hot'];
    }
    
    Public List<AggregateResult> mostPopularAccount (){
        return [SELECT Account.Name, count(Id) FROM Contact GROUP BY Account.Name ORDER BY count(ID) DESC LIMIT 1];
    }    
    
    Public List<List<sObject>> findingTom(){
        return [FIND 'Tom' RETURNING Contact(Name), Lead(Name)];
    }
    
    Public List<List<sObject>> findingLetters(){
        return [FIND 'a and o' IN ALL FIELDS RETURNING Account(Name)];
    }    
    
    Public void spawnContacts(){
        List<Contact> conList = new List<Contact>();
        for(Integer i = 0; i < 200; i++){
            Contact con = new Contact(LastName = 'Contact ' + i);
            conList.add(con);
        }
        insert conList;
    }
    
    Public Void createsHomes(){
        List<Account> accList = new List<Account>();
        for(Integer i = 0; i < 3; i++)
        {
            Account acc = new Account(Name = 'Account ' + i);
            accList.add(acc);
        }
		insert accList;        
    }
    
    Public Void relocate(){
        List<Contact> conList = [SELECT Id, Name FROM Contact ORDER BY CreatedDate DESC Limit 50];
        delete conList;
    }
    
    Public Void assignHomes(){
        List<Contact> conList = [SELECT Id, Name, AccountId FROM Contact WHERE Name Like 'Contact%'];
        List<Account> accList = [SELECT Id, Name FROM Account WHERE Name Like 'Account%'];
        for(Integer i = 0; i < conList.Size(); i++)
        {
            Double random = Math.random() * 11;
            if(random <= 3.99)
            {
                ConList[i].AccountId = accList[0].Id;
            }
            else if(random >=4 && random <= 7.99)
            {
                ConList[i].AccountId = accList[1].Id;                
            }
            else if(random >=8 && random <= 12)
            {
                ConList[i].AccountId = accList[2].Id;                
            }
        }
        update conList;
    }
    

}