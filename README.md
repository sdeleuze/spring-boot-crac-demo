## Spring Boot CRaC demo

This sample project is intended to demonstrate Spring Boot 3.2+ CRaC support by creating a ready to restore container image.

**Warning**: for real projects make sure to not leak sensitive data in CRaC files since they contain a snapshot of the memory of the running JVM instance. 

### Step 1: Checkpoint

From within the `spring-boot-crac-demo` folder, you have the choice to run either [On demand checkpoint/restore of a running application](https://docs.spring.io/spring-framework/reference/6.1/integration/checkpoint-restore.html#_on_demand_checkpointrestore_of_a_running_application) with:
```
./checkpoint.sh
```

Or to run an [automatic checkpoint/restore at startup](https://docs.spring.io/spring-framework/reference/6.1/integration/checkpoint-restore.html#_automatic_checkpointrestore_at_startup) with:
```
./checkpoint.sh
```

### Step 2: Restore
Restore the application with:
```
./restore.sh
```
