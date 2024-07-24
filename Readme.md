**Create .env file:**
```
cp .env.sample .env
```
### Run the containers:

#### For UAT Environment

```
docker compose -f docker-compose-uat.yml up -d
```

<strong>
Access the PGADMIN:
</strong>
<br>
<a href="http://localhost:1050">http://localhost:1050</a>

#### For Prod Environment


```
docker compose -f docker-compose-prod.yml up -d
```
<strong>
Access the PGADMIN:
</strong>
<br>
<a href="http://localhost:2050">http://localhost:2050</a>


<br>
<br>
<br>

**Create uat database:**
```
bash create_uat_db.sh <database_name>
```

**Create prod database:**
```
bash create_prod_db.sh <database_name>
```