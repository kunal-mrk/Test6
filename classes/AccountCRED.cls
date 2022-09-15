public class AccountCRED {
    public List<Account> acc {get;set;}
     public Account accObj{get;set;}
    public string recId{set;get;}
    
    public AccountCRED()
    {
        accObj = new Account();
       load(); // 
    }
    
    public void load()
    {
         acc = [select name,ownership,website,rating,industry , phone from Account order by createddate desc];
    }
    public void goRec()
    {
        //in case of update u shud have existing record
        accObj=[select name,industry,rating,phone,website,ownership from account where id = :recId];
    }
    
    public void doDelete()
    {
       Account ac =  [select id from account where id = :recId];
        Database.DeleteResult dr  =Database.delete(ac,false);
        if(dr.isSuccess())
        {
            ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.INFO,'Account Deleted'));
            accObj = new Account();
            load();
        }
    }
     public void saveAccount()
    {  
        //Database.SaveResult res = Database.insert(accObj,false);
       Database.UpsertResult res = Database.upsert(accObj,false); 
        //if id is thr thn it will be going to update else insert
        
        if(res.isSuccess())
        {            
            ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.INFO,'Account inserted'));                   
             accObj = new Account();
            load();
        }
        else{
            List<Database.Error> errs = res.getErrors();
            for(Database.Error er : errs)
            {
                ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR,'===>> '+er.getMessage()));
            }             
        }        
    }   
}