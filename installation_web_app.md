

1. created a VM of fedora 29
2. created a git prj named installation_web
   1. ui
      1. Dockerfile
      2. dist
      3. others
   2. api
      1. Dockerfile
      2. dist
   3. db

3. clone git install-prj onto fedora 29
   1. instll git on linux
   2. clone prj
~~~sh

$ sudo dnf install git-all
$ git clone https://github.com/teng-liu/installation_web.git

~~~

4. install nodejs
~~~
sudo dnf install nodejs
~~~

4. install docker
~~~
$ sudo dnf install docker-ce docker-ce-cli containerd.io
~~~

5. build
~~~
npm install
npm run build

# prepare Dockerfile

# open firewall for http
[root@localhost html]# firewall-cmd --zone=FedoraServer --add-service=http --permanent
success
[root@localhost html]# firewall-cmd --reload
success
[root@localhost html]#


docker build . -t itss/cms-ui:1.0.0 -t itss/cms-ui:latest  
docker run -d --name cms.ui -p 8100:80 itss/cms-ui

# port forward:  vm:host   8100:8100

~~~





5. docker build web_app
~~~sh
docker build . -t cms

docker build -t <username>/docker-react-sample .
~~~

6. check docker image
~~~
docker image ls
~~~

7. run the image
~~~
docker run -p 3000:3000 -d <username>/docker-react-sample

$ docker run -p 8000:80 react-docker

docker ps
~~~

8. If you need to go inside the container you can use the exec command:
~~~
docker exec -it <container id> /bin/bash
ls -l
~~~




For Documentation
=================

How to make installation package
--------------------------------
1. logon a Linux system/VM
2. install git [sudo dnf -y install git]
3. install node [sudo dnf -y install nodejs]
4. install docker [*refer to document]
5. get the latest source code from gitlab:
```
git clone https://gitlab.gpei.ca/quickr/framework/coop-student-shared-repository.git
```
6. npm install, npm build
```
cd coop-student-shared-repository
cd contract-system-ui
npm install
npm run build

cd contract-system-api
npm install
npm run build

```
7. docker build ui
```
cd contract-system-ui
docker build . -t itss/cms-ui:1.0.0 -t itss/cms-ui:latest  
docker image ls
```

8. docker build api
```
cd ..
cd contract-system-api
docker build . -t itss/cms-api:1.0.0 -t itss/cms-api:latest
docker image ls
```
9. Copy all the files under "cms-data/*" to vm path: "/opt/postgres/cms-data/"
~~~
mkdir -p /opt/postgres/cms-data
cp ./cms-data/* /opt/postgres/cms-data/
~~~

10. create docker folder:
~~~
mkdir -p /opt/itss-cms.docker
cd /opt/itss-cms.docker
touch docker-compose.yml
vi docker-compose.yml
# paste all the given content to docker-compose.yml and SAVE
~~~

11. docker-compose up
~~~
docker-compose up -d

# check log:  docker-compose logs -f
# turn down:  docker-compose down
~~~

12. testing system running well, then packing all the images
~~~
docker save -o /opt/itss-cms.docker/cms-ui-image.tar itss/cms-ui:latest
docker save -o /opt/itss-cms.docker/cms-api-image.tar itss/cms-api:latest
~~~