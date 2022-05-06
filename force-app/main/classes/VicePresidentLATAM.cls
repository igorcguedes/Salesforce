/**
 * @author ercarval - topi/brq
 */
public class VicePresidentLATAM extends Employee {

    override
    public Decimal getBonus() {
        return this.salary * 20;
    }

}
