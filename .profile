# .profile
# git clone https://github.com/b35t/mykey.git
#sudo mkdir /docker/prometheus

echo 'install prometheus and add config'

docker run -d --name=prometheus -p 9090:9090 -v /etc/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus

sudo cp prometheus.yml /ect/prometheus

docker restart prometheus

#Install Grafana
echo 'Install Grafana'
docker run -d --name=grafana -p 3000:3000 grafana/grafana
