# README

This repository contains a vagrant setup that automates setting up
a virtual machine that can be used as a free-software alternative
to Docker Desktop.

This recipe has been developed and tested on macOS 11, but should
also work on other proprietary platforms (i.e. MS Windows).

# Requirements

- docker client
- vagrant
- virtualbox

# Bereidingswijze[*] ;-)
- Clone the repo
```shell
$ git clone ....
```

- Enter the directory and create the VM. Docker will be automatically installed.
```
$ cd docker-vm && vagrant up
```

- If all goes well you should see the following message
```shell
    default: Docker VM is now ready :-) In order to use the docker daemon running within this VM from your host, you'll need the following:
    default:
    default: 1. export DOCKER_HOST=tcp://docker-vm:2375 (e.g. from your ~/.zshrc)
    default: 2. make sure your /etc/hosts file contains the following line:
    default:
    default: 192.168.178.75 docker-vm
    default:
    default: Have fun!
```

You'll need to follow these bits of instructions and make the necessary changes to your *host* machine. 
Having done that you should now be able to use docker. These changes are required only when you first boot
your VM or when you recreate the VM from scratch. The VM can be started and stopped as you see fit. As long
as the DHCP-assigned IP does not change you won't need any further adjustment.

Verify the output of 
```shell
$ docker system info
```

should look like the following:
```
Client:
 Context:    default
 Debug Mode: false

Server:
 Containers: 0
  Running: 0
  Paused: 0
  Stopped: 0
 Images: 0
 Server Version: 20.10.10
 Storage Driver: overlay2
  Backing Filesystem: extfs
  Supports d_type: true
  Native Overlay Diff: true
  userxattr: false
 Logging Driver: json-file
 Cgroup Driver: systemd
 Cgroup Version: 2
 Plugins:
  Volume: local
  Network: bridge host ipvlan macvlan null overlay
  Log: awslogs fluentd gcplogs gelf journald json-file local logentries splunk syslog
 Swarm: inactive
 Runtimes: runc io.containerd.runc.v2 io.containerd.runtime.v1.linux
 Default Runtime: runc
 Init Binary: docker-init
 containerd version: 5b46e404f6b9f661a205e28d59c982d3634148f8
 runc version: v1.0.2-0-g52b36a2
 init version: de40ad0
 Security Options:
  apparmor
  seccomp
   Profile: default
  cgroupns
 Kernel Version: 5.10.0-9-amd64
 Operating System: Debian GNU/Linux 11 (bullseye)
 OSType: linux
 Architecture: x86_64
 CPUs: 12
 Total Memory: 7.769GiB
 Name: bullseye
 ID: DNHP:5NYK:SQ6Q:JTRE:ALVQ:EX4X:UVMV:MJNR:FWD6:7F5Y:37JS:HGU7
 Docker Root Dir: /var/lib/docker
 Debug Mode: false
 Registry: https://index.docker.io/v1/
 Labels:
 Experimental: false
 Insecure Registries:
  127.0.0.0/8
 Live Restore Enabled: false

WARNING: API is accessible on http://0.0.0.0:2375 without encryption.
         Access to the remote API is equivalent to root access on the host. Refer
         to the 'Docker daemon attack surface' section in the documentation for
         more information: https://docs.docker.com/go/attack-surface/
➜  docker-vm git:(main) ✗
```

[*] Preparation instructions
