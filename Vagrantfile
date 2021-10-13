Vagrant.configure("2") do |config|

  config.vm.define "bdd" do |bdd|
    bdd.vm.provider "docker" do |d|
      d.image = "bitnami/mongodb"
    end

     bdd.vm.hostname = "bdd"
     bdd.vm.network "private_network", ip: "192.168.1.10"
   end

   config.vm.define "was" do |was|
     was.vm.provider "docker" do |d|
       d.build_dir = "."
       d.remains_running = true
       d.has_ssh = true
     end
     was.vm.hostname = "was"
     was.vm.provision "ansible" do |ansible|
       ansible.playbook = "playbook.yml"
     end
     was.vm.synced_folder ".", "/tmp/test"
     was.vm.network "private_network", ip: "192.168.1.11"
   end


end
