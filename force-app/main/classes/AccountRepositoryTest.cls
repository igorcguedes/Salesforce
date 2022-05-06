/**
 * @author ercarval - topi/brq
 */
@isTest
public class AccountRepositoryTest {

    @isTest
    static void givenAccountWithBillingCountryWhenFindAccountByBillingCountryThenReturnAccountsWithBillingCountry () {

        // given
        Account account = AccountFixtureFactory.createAccount('Teste do Bisso');

        // when
        AccountRepository repository = new AccountRepository();

        Test.startTest();

        List<Account> accounts = repository.findByCountry('Brasil');

        Test.stopTest();

        // then
        System.assert( !accounts.isEmpty() );

        System.assertEquals( 1 ,  accounts.size() );

        Account storedAccount = accounts.get(0);

        System.assertEquals( account.Id ,  storedAccount.Id );
        System.assertEquals( account.BillingCountry ,  storedAccount.BillingCountry );

    }


    @isTest
    public static void givenAccountWithCnaeWhenFindByCnaeCodeThenReturnOneAccount () {

        // given 
        CNAE__c cnae = CnaeFixtureFactory.createCnae('12345');

        Account account = AccountFixtureFactory.createAccount('Teste', cnae);

        // WHEN

        AccountRepository repository = new AccountRepository();

        Test.startTest();

        Account storedAccount = repository.findByCnaeCode('12345');

        Test.stopTest();

        // THEN

        System.assert(storedAccount != null);
        System.assertEquals(account.Id , storedAccount.Id);
        System.assertEquals(account.Cnae__c , storedAccount.Cnae__c);

    }

    @isTest
    public static void givenValidAccountWhenCreateThenReturnAccountWithId () {

        Account account = AccountFixtureFactory.newAccount('Teste');

        AccountRepository repository = new AccountRepository();

        Test.startTest();

        Account storedAccount = repository.create(account);

        Test.stopTest();

        System.assert(storedAccount.Id != null);

    }


    @isTest
    public static void givenCreatedAccountWhenSaveThenReturnChangedAccount () {

        //given
        Account account = AccountFixtureFactory.createAccount('Teste');

        account.Name = 'Teste 2';

        //when
        AccountRepository repository = new AccountRepository();   
        
        Test.startTest();
        
        Account storedAccount = repository.save(account);

        Test.stopTest();

        //Then
        System.assertEquals(account.Name , storedAccount.Name);

    }

    @isTest
    public static void givenCreatedAccountWhenFindByIdThenReturnStoredAccount () {

        //given
        Account account = AccountFixtureFactory.createAccount('Teste');

        //when
        AccountRepository repository = new AccountRepository();     
        
        Test.startTest();

        Account storedAccount = repository.findById(account.Id);

        Test.stopTest();

        //Then
        System.assertEquals(account.Id , storedAccount.Id);

    }

    @isTest
    public static void givenAccountWithContactWhenFindAccountWithContactByCnaeCodeThenReturnAccountWithContact () {

        Map<String, SObject> records = ContactFixtureFactory.createIntegratedScenario();

        AccountRepository repository = new AccountRepository();     
        
        Cnae__c cnae = (Cnae__c) records.get('cnae');

        Test.startTest();

        List<Account> storedAccounts = repository.findWithContactsByCnaeCode(cnae.CnaeCode__c);

        Test.stopTest();

        System.assert(!storedAccounts.isEmpty());
        
        System.assertEquals(1 , storedAccounts.size());
        
        List<Contact> contacts = storedAccounts.get(0).Contacts;
        
        System.assert(!contacts.isEmpty());
        System.assertEquals(1, contacts.size());

    }



}
