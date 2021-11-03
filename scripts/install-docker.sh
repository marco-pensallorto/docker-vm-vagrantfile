set -ex
echo "Installing Docker CE..."

echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
apt-get update -qq
apt-get install -qq apt-transport-https ca-certificates curl gnupg

curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
    | tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update -qq
apt-get install -qq docker-ce docker-ce-cli containerd.io

sed -i 's/-H fd:\/\/ //' /lib/systemd/system/docker.service
echo '{"hosts": ["tcp://0.0.0.0:2375", "unix:///var/run/docker.sock"]}' \
     | tee /etc/docker/daemon.json

systemctl daemon-reload
systemctl restart docker.service
systemctl status docker.service

echo "Done."
