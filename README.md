# employees_database
You can run the docker containers with sample database [employees](https://dev.mysql.com/doc/employee/en/).

This repository supports MySQL and PostgreSQL.

## Extract data folder
```
tar jxf data.tar.bz2
```

## Run container
You can run the docker containers with using following `docker-compose` command.
```
docker-compose up -d
```

## Connect to database
You need to install MySQL or PostgreSQL on your computer.

### MySQl
```
mysql -u root -p -h 127.0.0.1 --port 33306

Enter password: toor
```

### PostgreSQL
```
psql -U postgres -h 127.0.0.1 --port 15432

Password for user postgres: toor
```

## Connect to database from inside of container
If MySQL or PostgreSQL is not installed, you can connect to database from inside of docker container with `docker exec it` command.

### MySQL
```
docker exec -it mysql-employees sh

mysql -u root -p -h localhost --port 3306

Enter password: toor
```

### PostgreSQL
```
docker exec -it psql-employees sh

psql -U postgres -h 127.0.0.1 -p 5432
```

## References
- [https://github.com/vrajmohan/pgsql-sample-data](https://github.com/vrajmohan/pgsql-sample-data)
