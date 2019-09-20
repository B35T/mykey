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
docker run  -d --name mongodb -v /docker/data/db:/data/db -p 27017:27017 --restart=always mongo:tag --auth
```

***สร้าง user สำหรับ login database***
เนื่องจากเรายังไม่มี user บน db เลย เราจึงต้องสร้าง user คนแรกขึ้นมาก่อน (ไม่งั้นจะเปิด auth เพื่อ?) โดย connect เข้าไปที่ mongo shell ของ container ด้วยคำสั่ง
```
docker exec -it mongodb mongo admin
```
จากนั้นก็สร้าง user ด้วย mongo shell
```
db.createUser({
  user: "admin", 
  pwd: "secure", 
  roles: [ { role: "root", db: "admin" } ]
})
```
test
```show dbs``` = ```error successful```

***portainer for docker***

```
docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
```
***install konga***
```
docker run —p 1337:1337 -d —network=kong-net \
 --name konga -e “NODE_ENV=production" \
 -e “TOKEN_SECRET={{somerandomstring}}" \
 pantsel/konga
```
