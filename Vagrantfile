IP_BDD = "192.168.1.10"
IP_WAS_DEBIAN = "192.168.1.11"
IP_WAS_CENTOS = "192.168.1.12"
WEB_DEBIAN_HOST_PORT = 9002
WEB_CENTOS_HOST_PORT = 9003
WEB_GUEST_PORT = 9292
MOUNT_POINT = "/tmp/test"
RUN_CENTOS = true
RUN_DEBIAN = true
LOAD_SINATRA = true

Vagrant.configure("2") do |config|

  config.vm.define "bdd" do |bdd|
    bdd.vm.provider "docker" do |d|
      d.image = "bitnami/mongodb"
    end
     bdd.vm.hostname = "bdd"
     bdd.vm.network "private_network", ip: IP_BDD
   end
   
   if RUN_DEBIAN then
     config.vm.define "was-debian" do |was|
       was.vm.provider "docker" do |d|
         d.build_dir = "."
         d.dockerfile = "Dockerfile_debian"
         d.remains_running = true
         d.has_ssh = true
       end
       was.vm.hostname = "was-debian"
       was.vm.provision "ansible" do |ansible|
         ansible.playbook = "playbook.yml"
         ansible.extra_vars = {sinatra_path: MOUNT_POINT, load_sinatra: LOAD_SINATRA}
         ansible.groups = { "debian" => ["was-debian"]}
       end
       was.vm.synced_folder ".", MOUNT_POINT
       was.vm.network "private_network", ip: IP_WAS_DEBIAN
       was.vm.network :forwarded_port, guest: WEB_GUEST_PORT, host: WEB_DEBIAN_HOST_PORT
     end
   end
   if RUN_CENTOS then
     config.vm.define "was-centos" do |was|
       was.vm.provider "docker" do |d|
         d.build_dir = "."
         d.dockerfile = "Dockerfile_centos"
         d.remains_running = true
         d.has_ssh = true
       end
       was.vm.hostname = "was-centos"
       was.vm.provision "ansible" do |ansible|
         ansible.playbook = "playbook.yml"
         ansible.extra_vars = {sinatra_path: MOUNT_POINT, load_sinatra: LOAD_SINATRA}
         ansible.groups = { "centos" => ["was-centos"]}
       end
       was.vm.synced_folder ".", MOUNT_POINT, type: "rsync", rsync__exclude: "Gemfile.lock"
       was.vm.network "private_network", ip: IP_WAS_CENTOS
       was.vm.network :forwarded_port, guest: WEB_GUEST_PORT, host: WEB_CENTOS_HOST_PORT
     end
   end

end
