# Sinatra Simple application
Deploy sinatra application in docker container with vagrant and ansible.

- Use case development for my use.
- Fast integration.
- Low level load with docker.
- Work on a small compute laptop.
- Work on the way.

Available for:

- [X] Debian
- [X] CentOS 8

## System requirements

Deployment environment must have Ansible 2.11.5+ and Vagrant 2.2.18+.

### Clone the repository

    git clone https://github.com/CamillePaquet/sinatra-simple.git

## Playbook


    ---
    - name: install sample application
      hosts: all
      become: true
      tasks:
        - include_role:
            name: base
        - include_role:
            name: sinatra
          when: "{{ load_sinatra == True }}"

## Structure

```
.
├── README.md
├── Vagrantfile
├── playbook.yml
├── Dockerfile_centos
├── Dockerfile_debian
├── Gemfile
├── app.rb
├── config.ru
├── config
│   └── mongoid.yml
├── group_vars
│   ├── centos.yml
│   └── debian.yml
├── models
│   ├── init.rb
│   └── user.rb
├── public
├── views
│   └── index.erb
└── roles
    ├── base
        └── tasks
            └── main.yml
    └── sinatra
        └── tasks
            └── main.yml

```

## group_vars directory

- debian.yml
- centos.yml

## Testing

1. Run `vagrant up` to start the Docker containers.  
2. Run `vagrant ssh was-centos` to connect on was-centos container.  
3. Run `curl -v 'http://localhost:9292/'` to check if the application start and display "Hello world".
4. Run `exit` to exit the was-centos container.
5. Run `curl -v 'http://localhost:9003/'` to test if the forwarding on the host machine is ok.
6. Run `vagrant ssh was-debian` to connect on was-centos container.
7. Run `curl -v 'http://localhost:9292/'` to check if the application start and display "Hello world".
8. Run `exit` to exit the was-debian container.
9. Run `curl -v 'http://localhost:9002/'` to test if the forwarding on the host machine is ok.
