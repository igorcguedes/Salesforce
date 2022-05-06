/**
 * @author ercarval - topi/brq
 */
trigger Account on Account (before insert
                            , before update
                            , after insert
                            , after update) {

    List<Account> newAccounts = (List<Account>) Trigger.new;

    Map<Id, Account> oldAccounts = (Map<Id, Account>) Trigger.oldMap;

    BrazilianDocumentValidator validator = new BrazilianDocumentValidator();

    switch on Trigger.operationType {

        when BEFORE_INSERT, BEFORE_UPDATE {

            for (Account account : newAccounts) {

                if ( !String.isEmpty( account.DocumentNumber__c) 
                     && !validator.isValid(account.DocumentNumber__c) ) {
                    account.DocumentNumber__c.addError ('CPF ou CNPJ inválido');                    
                } else if ( !String.isEmpty( account.DocumentNumber__c) ) {
                    account.DocumentNumber__c = 
                            new BrazilianDocument(account.DocumentNumber__c).getFormatted();
                }


                


            }
        }

        when AFTER_INSERT {
        }

        when AFTER_UPDATE {
        }


    }                                



}