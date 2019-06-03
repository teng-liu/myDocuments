# Setup Database

You will learn how to
- Install fedora 29 in virtual machine
- Install docker and docker-compose
- Install postgres database and pgadmin4 management tool

You may need to read document about how to use:
- dnf
  - a package management tool used by fedora / redhat / centos
- docker
  - a container management tool

You also need to have basic knowledge about how to use linux and bash.

## Install Fedora on VirtualBox

- Download and install **VirtualBox**
- Download **Fedora Server 29** installation image (Fedora-Server-dvd-x86_64-29-1.2.iso)
  - https://www.server-world.info/en/note?os=Fedora_29&p=desktop&f=1
- Create a virtual machine named: pei-cms.vm-db
   - 1 GB memory
   - 60 GB disk (minimum recommendation), with incremental size.
  
- In settings->storage of virtual machine pei-cms.vm-db, specify fedora29.iso in cd-rom
- Start virtual machine and complete the installation
- Install guest tools (Optional, Recommended)
   - guest tools are linux kernel patch installed into guest system to make it faster, better memory management and several additional features like sharing files and copy / paste between host and guest systems. 
   - follow the [instruction here](https://www.if-not-true-then-false.com/2010/install-virtualbox-guest-additions-on-fedora-centos-red-hat-rhel/)

## Install Docker

#### References:
- <https://docs.docker.com/install/linux/docker-ce/fedora/>

```sh
# Install the dnf-plugins-core package which provides the commands to manage your DNF repositories from the command line.
sudo dnf -y install dnf-plugins-core

# Use the following command to set up the stable repository.
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo

# Install the docker ce
sudo dnf install -y docker-ce docker-ce-cli containerd.io

# Add docker as system service
sudo systemctl enable docker

# start docker
sudo systemctl start docker

# Verify that Docker CE is installed correctly by running the hello-world image.
sudo docker run hello-world

# instal docker compose
sudo dnf -y install docker-compose

```

## Start PostgreSQL database in docker

Create folder for database data files

```sh
# for data files
mkdir -p /opt/postgres/data

# for pgadmin
mkdir -p /opt/postgres/pgadmin
```


Create this file:  */opt/pei-cms.db.docker/docker-compose.yml*

Edit the file like this:
```yml
version: '3.5'

services:
  postgres:
    container_name: pei-cms.postgres
    image: postgres:11
    volumes:
      - /opt/postgres/data:/data/postgres
    ports:
      - "5432:5432"
    networks:
      - postgres
    restart: unless-stopped
  
  pgadmin:
    container_name: pei-cms.pgadmin
    image: dpage/pgadmin4
    environment:
      PGADMIN_DEFAULT_EMAIL: ${PGADMIN_DEFAULT_EMAIL:-pgadmin4@pgadmin.org}
      PGADMIN_DEFAULT_PASSWORD: ${PGADMIN_DEFAULT_PASSWORD:-admin}
    volumes:
       - /opt/postgres/pgadmin:/root/.pgadmin
    ports:
      - "${PGADMIN_PORT:-15432}:80"
    networks:
      - postgres
    restart: unless-stopped

networks:
  postgres:
    driver: bridge
```

cd to folder *~/pei-cms.db.docker*, and execute

```sh
docker-compose up -d
```
You should have two containers running
- postgres database
- pgadmin4
  - A web-base tool to manage the database

#### How to access pgadmin
- Configure VM's settings / network, add port forward to guest system's 15432 port.
- Open http://localhost:15432 in web browser.
  - When asked to login, use user name:  pgadmin4@pgadmin.org, password is: admin
- Add database server
  - host address: postgres
  - user name: postgres
  - password: postgres


## Install PostgreSQL client (Optional)

The postgres client consists a command line tool *psql*, which can be used to manage database or manipulate the data.

```sh
# configure the PostgreSQL repository
rpm -Uvh https://yum.postgresql.org/11/fedora/fedora-29-x86_64/pgdg-fedora-repo-latest.noarch.rpm

# install client
sudo dnf install -y postgresql11
```

Then you can connect to database:

```sh
psql -h localhost -U postgres
```


Reference: <https://tecadmin.net/install-postgresql-11-on-fedora/>

