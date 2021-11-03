HOST=$(ip -o address | grep -e 192\.168\.1 | awk '{ print $4 }' | sed 's/\/24//')

cat <<EOF
Docker VM is now ready :-) In order to use the docker daemon running within this VM from your host, you'll need the following:

1. export DOCKER_HOST=tcp://docker-vm:2375 (e.g. from your ~/.zshrc)
2. make sure your /etc/hosts file contains the following line:

$HOST docker-vm

Have fun!
EOF
