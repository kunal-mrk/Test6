public class AccountSearch {
    public string t {get;set;}
    public List<Account> acc {get;set;}
    
    public void fetchInfo()
    {
        string str = '%' + t +'%';
        acc = [select name,rating,phone,industry from account where name like :str];
    }


}