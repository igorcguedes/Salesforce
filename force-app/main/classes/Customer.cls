/**
 * @author ercarval - topi/brq
 */
public class Customer implements Authenticable {

    public String name;
    public String code;
    public String billingStreet;
    public String billingCity;
    public String billingState;

    public Customer () {

    }

    public Customer (String code) {
        this.code = code;
    }

    public Customer (String code, String name) {
        this.code = code;
        this.name = name;
    }

    public Customer (String billingStreet, String billingCity
                    , String billingState ) {



    }

    public Customer (String code
                    , String name
                    , String billingStreet
                    , String billingCity
                    , String billingState ) {

        

    }   

    public void show () {
        System.debug ( JSON.serialize ( this ) );
    }

    public void debugLog () {
        System.debug ( JSON.serialize ( this ) );
    }

    public void show (Boolean showLog) {
        if (showLog) {
            System.debug ( JSON.serialize ( this ) );
        }       

    }

    public Boolean login (String username, String password) {
        System.debug('Customer login: ' + username + ' ' + password);
        return true;
    }

}
