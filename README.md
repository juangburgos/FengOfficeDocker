## Feng Office Docker

### Build

```bash
docker build --rm -t juangburgos/myfengoffice .
```

### Prepare

Move to directory where we want the mounted volumes in the host machine and create necessary directory.

```bash
# Move to Target Dir
cd srv
# Create Dir
mkdir ${PWD}/fengoffice/
chmod -R 777 ${PWD}/fengoffice/
```

### Run

* Interactive (**Mandatory** for first run)

```bash
rm -rf fengoffice/; mkdir fengoffice/; chmod -R 777 fengoffice/;
docker run --name fengoffice -it --rm \
-p 80:80 \
-v ${PWD}/fengoffice:/opt/lampp:Z \
juangburgos/myfengoffice
```

* Detached

```bash
docker run --name fengoffice --detach --restart always \
-p 80:80 \
-v ${PWD}/fengoffice:/opt/lampp:Z \
juangburgos/myfengoffice
```

**NOTE** : If this is the first time the container is started, startup procedure might take some minutes.

---

### Some Notes

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


