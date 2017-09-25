* Restart

```bash
docker stop fengoffice
docker rm fengoffice
rm -rf /srv/fengoffice/
mkdir /srv/fengoffice/
chmod -R 777 /srv/fengoffice/
docker build --rm -t juangburgos/myfengoffice .

```

* Test

```bash
docker run --name fengoffice -it --rm \
--publish 192.168.1.41:8081:80 \
--volume /srv/fengoffice:/opt/lampp:Z \
juangburgos/myfengoffice
```

* Deploy

```bash
docker run --name fengoffice --detach --restart always \
--publish 192.168.1.41:8081:80 \
--volume /srv/fengoffice:/opt/lampp:Z \
juangburgos/myfengoffice
```

**NOTE** : Wait a little before calling the webapp.

---

### Some Notes

* Database user is ```root```, *no password* (empty) and any database name will do.

* Access MySql databse

```bash
/opt/lampp/bin/mysql -u root -p
```

* Need to map full

```bash
/opt/lampp/
```


