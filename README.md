# mykey
install core os in virtual box

```git clond https://github.com/B35T/mykey.git```

cd mykey \
```sudo coreos-install -d /dev/sda -C stable -i ~/ignition.json```

***install PostgreSQL*** \
**option 1**

```
docker pull postgres:tag
docker run -d --name=myposgresDB --config my-config.yml postgres:tag
```

in my-config.yml \
```
POSTGRES_DB=myappdb \
POSTGRES_USER=admin \
POSTGRES_PASSWORD=pleasechangeme 
```

**option 2** \
```
docker run -d --name=myposgresDB -e POSTGRES_DB=mydatabase -e POSTGRES_USER=admin -e POSTGRES_PASSWORD=secret --restart=always postgres:tag
```

***install mongodb***
```
docker run --name mongodb -v /docker/data/db:/data/db -p 22017:27017 -d mongo:tag --auth
```
