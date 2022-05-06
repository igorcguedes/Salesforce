/**
 * @author ercarval - topi/brq
 */
public class FinancialAnalyst extends Employee {

    public String financialTool;
    
    override
    public Decimal getBonus () {
        return ( this.salary * 1.2 )  + 25000;
    }

}
