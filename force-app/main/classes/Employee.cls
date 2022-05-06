/**
 * @author ercarval - topi/brq
 */
public abstract class Employee {

    public String name;
    public String code;
    public Decimal salary;

    public void show () {
        System.debug(JSON.serialize( this ));
    }
   
    public abstract Decimal getBonus ();

}
