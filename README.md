# mykey
install core os in virtual box

git clond https://github.com/B35T/mykey.git

cd mykey

sudo coreos-install -d /dev/sda -C stable -i ~/ignition.json

install PostgreSQL
docker pull postgres:tag
docker run -d my-posgresDB --config my-config.yml postgres:tag

in my-config.yml \
POSTGRES_DB=myappdb \
POSTGRES_USER=admin \
POSTGRES_PASSWORD=pleasechangeme 
