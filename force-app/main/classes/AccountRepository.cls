/**
 * @author ercarval - topi/brq
 */
public virtual class AccountRepository {

    virtual
    public List<Account> findByCountry ( String country ) {
        return [SELECT Id, Name, Cnae__c, BillingStreet, BillingCity
                    , BillingCountry, BillingState, BillingPostalCode             
                FROM Account 
                WHERE BillingCountry =  :country];
    }


    virtual
    public List<Account> findWithContactsByCnaeCode ( String cnaeCode ) {
        return [SELECT Id, Name, Cnae__c, BillingStreet, BillingCity
                    , ( SELECT Id, Name, Email FROM Contacts WHERE Email != null )                    
                FROM Account 
                WHERE Cnae__r.CnaeCode__c =  :cnaeCode];
    }

    virtual
    public Account findById ( String id ) {
        return [SELECT Id, Name, Cnae__c, BillingStreet, BillingCity
                FROM Account 
                WHERE Id =  :id];
    }

    virtual
    public Account findByCnaeCode ( String cnaeCode ) {

        List<Account> accounts = [ SELECT Id, Name, Cnae__c
                                , Cnae__r.Description__c
                                , BillingStreet, BillingCity
                                FROM Account 
                                WHERE 
                                Cnae__r.CnaeCode__c =  :cnaeCode];

        return accounts.isEmpty () ? null : accounts.get (0);
    }    


    public Account create (Account account)  {
        create ( new List<Account> {account} );
        return account;
    }

    public List<Account> create (List<Account> accounts)  {

        insert accounts;

        return accounts;
    }


    public Account save (Account account)  {
        save ( new List<Account> {account} );
        return account;
    }

    public List<Account> save (List<Account> accounts)  {

        update accounts;

        return accounts;
    }    


    public void remove (List<Account> accounts)  {

        delete accounts;

    }    

    public void remove (Account account)  {

        delete account;

    }    


}
