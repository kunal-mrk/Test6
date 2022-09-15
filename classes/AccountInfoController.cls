public class AccountInfoController {
    public list<Account> acc {get;set;}
    public AccountInfoController(){
        acc = [select name,ownership,website,rating,industry , phone from Account order by createddate desc];
        
    }
    public pageReference docreate(){
    PageReference pr = new PageReference('/apex/SimpleInsert');
    return pr;
    }
}