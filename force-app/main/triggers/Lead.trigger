/**
 * @author ercarval - topi/brq
 */
trigger Lead on Lead (after update) {

   new LeadTH().run();

}