/**
 * @author ercarval - topi/brq
 */
public class AccountSOQL {
    
    public void findAccountByBillingCountry (String country) {
        List<Account> accounts = [SELECT Id
                                    , Name
                                    , Cnae__c 
                                    FROM Account 
                                    WHERE BillingCountry =  :country ];

        String billingCountry = [ SELECT Id
                            , Name
                            , Cnae__c 
                            , BillingCountry
                            FROM Account 
                            WHERE BillingCountry =  :country
                            LIMIT 1 ].BillingCountry;

        for (Account account : [SELECT Id
                                , Name
                                , Cnae__c 
                                FROM Account 
                                WHERE BillingCountry =  :country]) {

            


        }

        System.debug( JSON.serialize(accounts) );                                 
    }
    
}
