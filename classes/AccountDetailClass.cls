public class AccountDetailClass {
      @AuraEnabled
    public static List<Customer__c> getAllAccount(){
        return [select Name,Customer_Name__c,Address__c,Email_Id__c from customer__c];
    }
     @AuraEnabled
    public static Customer__c getCustomerDetails(Id aId){
        return [select Name,Customer_Name__c,Address__c,Email_Id__c from Customer__c where id = :aId];
    }
}