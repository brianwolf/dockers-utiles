# eliminar versiones anteriores
sudo apt-get remove docker docker-engine docker.io containerd runc


# instalar docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh


# agregar usuario
sudo groupadd docker
sudo usermod -aG docker $USER