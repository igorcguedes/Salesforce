/**
 * @author ercarval - topi/brq
 */
public class TaskRepository {

    public List<Task> save (List<Task> tasks) {
        upsert tasks;
        return tasks;
    }
}
