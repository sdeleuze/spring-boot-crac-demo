From within the spring-boot-crac-demo folder run:
```
docker compose up -d
./checkpoint.sh
```

And then restore it:
```
./restore.sh
docker-compose down
```
