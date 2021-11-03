Vagrant.configure("2") do |config|

  config.vm.box = "debian/bullseye64"
  config.vm.box_check_update = false

  # Give VM 1/2 system memory & access to all cpu cores on the host
  config.vm.provider "virtualbox" do |v|
    host = RbConfig::CONFIG['host_os']

    if host =~ /darwin/
      cpus = `sysctl -n hw.ncpu`.to_i

      # sysctl returns Bytes and we need to convert to MB
      mem = `sysctl -n hw.memsize`.to_i / 1024 / 1024 / 2

    elsif host =~ /linux/
      cpus = `nproc`.to_i

      # meminfo shows KB and we need to convert to MB
      mem = `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kB//'`.to_i / 1024 / 2

    else # unsupported systems (e.g. Windows) get basic defaults
      cpus = 2
      mem = 1024
    end

    v.customize ["modifyvm", :id, "--memory", mem]
    v.customize ["modifyvm", :id, "--cpus", cpus]
  end

  # Configure VM visibility as an external host with its own IP address. This is useful so that all the ports from the guest
  # will be visible from the host. Useful for tools like TestContainers that open connections on random ports.
  config.vm.network "public_network", bridge: "en0: Wi-Fi (Wireless)"
  config.vm.provision :shell, path: "scripts/install-docker.sh", run: 'once'
  config.vm.provision :shell, path: "scripts/bootstrap.sh", run: 'always'
end
