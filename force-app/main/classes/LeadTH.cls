/**
 * @author ercarval - topi/brq
 */
public with sharing class LeadTH extends TriggerHandler {

    List<Lead> newLeads;
    Map<Id,Lead> oldLeads;
    LeadFilter filter;

    LeadTaskEnricher taskEnricher;

    public LeadTH() {
        this ( (List<Lead>) Trigger.new,
                (Map<Id,Lead>) Trigger.oldMap );
    }

    public LeadTH(List<Lead> newLeads, Map<Id,Lead> oldLeads) {
        this.newLeads = newLeads;
        this.oldLeads = oldLeads;       
        this.filter = new LeadFilter(); 
        this.taskEnricher = new LeadTaskEnricher();
    }

    override
    public void afterUpdate() {

        createTasksForPendingContactStatus();

    }

    private void createTasksForPendingContactStatus () {
        List<Lead> leads = this.filter.byChangedStatusTo(newLeads
                                                    , oldLeads
                                                    , 'Pending Contact'); 

        this.taskEnricher.createContactTasks(leads);                                                   
    }


}
