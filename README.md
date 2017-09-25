## Feng Office Docker

Unofficial [Docker image](https://hub.docker.com/r/juangburgos/fengoffice/) for the *Community* version of Feng Office.

The **Dockerfile** can be [found here](https://github.com/juangburgos/FengOfficeDocker).

Feng Office is a Collaboration Platform and Project Management System. It is licensed under the Affero GPL 3 license.

For further information, please visit:

* <http://www.fengoffice.com/>

* <http://fengoffice.com/web/forums/>

* <http://fengoffice.com/web/wiki/>

* <http://sourceforge.net/projects/opengoo>

## RUN BY CLONE

Move to directory where we want the mounted volumes in the host machine and create necessary directory.

```bash
# Move to Target Dir
cd srv
# Create Dir
mkdir ${PWD}/fengoffice/
chmod -R 777 ${PWD}/fengoffice/
```

Run as a service

```bash
docker run --name fengoffice --detach --restart always \
-p 80:80 \
-v ${PWD}/fengoffice:/opt/lampp:Z \
juangburgos/fengoffice
```

---

## RUN BY BUILD

### Build

```bash
docker build --rm -t juangburgos/myfengoffice .
```

### Run

Move to directory where we want the mounted volumes in the host machine and create necessary directory.

```bash
# Move to Target Dir
cd srv
# Create Dir
mkdir ${PWD}/fengoffice/
chmod -R 777 ${PWD}/fengoffice/
```

* Interactive (For debugging)

```bash
rm -rf fengoffice/; mkdir fengoffice/; chmod -R 777 fengoffice/;
docker run --name fengoffice -it --rm \
-p 80:80 \
-v ${PWD}/fengoffice:/opt/lampp:Z \
juangburgos/myfengoffice
```

* Detached (As a service)

```bash
docker run --name fengoffice --detach --restart always \
-p 80:80 \
-v ${PWD}/fengoffice:/opt/lampp:Z \
juangburgos/myfengoffice
```

**NOTE** : If this is the first time the container is started, startup procedure might take some minutes.

---

### Configuration in Web Interface

* Database user is ```root```, *no password* (empty) and any database name will do.

* The **Absolute script URL** must be the **public Ip** of the docker **host** with the **mapped port**, otherwise the page will not load correctly

* Access MySql databsae

First enter the container

```bash
docker exec -it fengoffice /bin/bash
```

Then use the *mysql client*

```bash
/opt/lampp/bin/mysql -u root -p
```


