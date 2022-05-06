public class Customer {

    public String name;
    public String code;
    public String billingStreet;
    public String billingCity;
    public String billingState;

    public  void show(){

        System.debug ( JSON.serialize ( this ) );
    }

}
