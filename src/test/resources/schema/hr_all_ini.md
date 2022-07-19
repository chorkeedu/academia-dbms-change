# [academia-dbms-change][103]

```bash
:'
/opt/path/academia-dbms-change/
  ├─ README.md
  ├─ pom.xml
  ├─ src
  │   ├─ test/
  │   │   ├─ java
  │   │   │   ├─ org.chokre.academia.boot/BootstrapApplication.java
  │   │   │   ├─ org.chokre.academia.config/package-info.java
  │   │   │   └─ org.chokre.academia.dbms.change.test/ChangeTests.java
  │   │   └─ resources/
  │   │       ├─ log4j.xml
  │   │       ├─ application.properties
  │   │       ├─ liquibase
  │   │       │   ├─ dev.properties
  │   │       │   ├─ dif.properties
  │   │       │   ├─ qac.properties
  │   │       │   ├─ uat.properties
  │   │       │   └─ pro.properties
  │   │       ├─ schema/
  │   │       │   ├─ hr_all_ini.md
  │   │       │   ├─ hr_all_ini.sql
  │   │       │   ├─ hr_dev_bas_ini.sql
  │   │       │   ├─ hr_dev_dif_add.sql
  │   │       │   └─ hr_dev_dif_rev.sql
  │   │       └─ change/
  │   └─ main/
  │       ├─ java/org.chokre.academia.dbms.change/package-info.java
  │       └─ resources/META-INF/migrations/
  │           ├─ db.changelog-master.xml
  │           ├─ config/
  │           │   ├─ db.changelog-config.xml
  │           │   ├─ db.changelog-property.xml
  │           │   └─ db.changelog-restrict.xml
  │           └─ change/
  │               ├─ db.changelog-v1.xml
  │               └─ v1/
  │                   ├─ db.changelog-v1.0.xml
  │                   └─ v1.0/
  │                       ├─ db.changelog-v1.0.00.xml
  │                       └─ v1.0.00/
  │                           ├─ db.changelog-v1.0.00_20180801_110011.xml
  │                           ├─ db.changelog-v1.0.00_20180802_110011.xml
  │                           ├─ db.changelog-v1.0.00_20180803_110011.xml
  │                           ├─ db.changelog-v1.0.00_20180804_110011.xml
  │                           ├─ db.changelog-v1.0.00_20180805_110011.xml
  │                           ├─ db.changelog-v1.0.00_20180806_110011.xml
  │                           └─ 20180802_110011/
  │                               ├─ countries__dev_qac_uat_pro.csv
  │                               ├─ departments__dev_qac.csv
  │                               ├─ departments__uat_pro.csv
  │                               ├─ employees__dev_qac.csv
  │                               ├─ job_history__dev_qac.csv
  │                               ├─ jobs__dev_qac_uat_pro.csv
  │                               ├─ locations__dev_qac_uat_pro.csv
  │                               └─ regions__dev_qac_uat_pro.csv
  └─ target/
      ├─ academia-dbms-change-0.0.00.GA.jar
      ├─ db.changelog-v1.0.00_20180814_070816.xml
      └─ 20180814_070816/
          ├─ countries.csv
          ├─ departments.csv
          ├─ employees.csv
          ├─ job_history.csv
          ├─ jobs.csv
          ├─ locations.csv
          └─ regions.csv
'
```

### MySQL
```bash
mysql -h localhost -u root -p << EOF
CREATE USER 'academia'@'localhost' IDENTIFIED BY 'finology';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, FILE, INDEX, ALTER, CREATE TEMPORARY TABLES,
 CREATE VIEW, EVENT, TRIGGER, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, EXECUTE ON *.*
 TO 'academia'@'localhost' REQUIRE NONE WITH MAX_QUERIES_PER_HOUR 0
 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0
 MAX_USER_CONNECTIONS 0;
EOF

mysql -h localhost -u root -p << EOF
DROP DATABASE IF EXISTS hr_dev;
DROP DATABASE IF EXISTS hr_qac;
DROP DATABASE IF EXISTS hr_uat;
DROP DATABASE IF EXISTS hr_pro;
EOF

mysql -h localhost -u academia -p << EOF
CREATE DATABASE IF NOT EXISTS hr_dev DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS hr_qac DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS hr_uat DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS hr_pro DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
EOF
```

### PgSQL
```bash
sudo su postgres

cat << EOF | psql -U postgres
DROP DATABASE IF EXISTS hr_dev;
DROP DATABASE IF EXISTS hr_qac;
DROP DATABASE IF EXISTS hr_uat;
DROP DATABASE IF EXISTS hr_pro;
EOF

cat << EOF | psql -U postgres
CREATE DATABASE hr_dev;
CREATE DATABASE hr_qac;
CREATE DATABASE hr_uat;
CREATE DATABASE hr_pro;
EOF

cat << EOF | psql -U postgres
CREATE USER academia WITH ENCRYPTED PASSWORD 'finology';
EOF

cat << EOF | psql -U postgres
GRANT ALL PRIVILEGES ON DATABASE hr_dev TO academia;
GRANT ALL PRIVILEGES ON DATABASE hr_qac TO academia;
GRANT ALL PRIVILEGES ON DATABASE hr_uat TO academia;
GRANT ALL PRIVILEGES ON DATABASE hr_pro TO academia;
EOF
```

### JDBC URL
```properties
jdbc:mysql://127.0.0.1:3306/hr_dev?autoReconnect=true&useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull
jdbc:h2:file:~/.chorke/academia/var/h2/dbms/hr_dev;db_close_on_exit=false;mode=MySQL;user=academia;password=finology
jdbc:hsqldb:file:~/.chorke/academia/var/hsqldb/dbms/hr_dev;sql.syntax_mys=true;user=academia;password=finology
jdbc:derby://127.0.0.1:1527/hr_dev;create=true;user=academia;password=finology
jdbc:sqlserver://127.0.0.1:1433;databaseName=hr_dev
jdbc:postgresql://127.0.0.1:5432/hr_dev
jdbc:oracle:thin:@127.0.0.1:1521:hr_dev
```

### JDBC Driver
```properties
sqlserver: com.microsoft.sqlserver.jdbc.SQLServerDriver
derby: org.apache.derby.jdbc.ClientDriver
hsqldb: org.hsqldb.jdbc.JDBCDriver
postgresql: org.postgresql.Driver
oracle: oracle.jdbc.OracleDriver
mysql: com.mysql.jdbc.Driver
h2: org.h2.Driver
```
### Config
```bash
mkdir -p ~/.chorke/academia/etc/cfg/liquibase/dbms
cp src/test/resources/liquibase/*.properteis ~/.chorke/academia/etc/cfg/liquibase/dbms

# postgresql
cat <<EOF > ~/.chorke/academia/etc/cfg/liquibase/dbms/dev.properties
url: jdbc:postgresql://localhost:5432/hr_dev
driver: org.postgresql.Driver
username: academia
password: finology
EOF

# mysql
cat <<EOF > ~/.chorke/academia/etc/cfg/liquibase/dbms/dev.properties
url: jdbc:mysql://localhost:3306/hr_dev?autoReconnect=true&amp;useUnicode=true&amp;characterEncoding=utf-8
driver: com.mysql.jdbc.Driver
username: academia
password: finology
EOF

# hsqldb
cat <<EOF > ~/.chorke/academia/etc/cfg/liquibase/dbms/dev.properties
url: jdbc:hsqldb:file:~/.chorke/academia/var/hsqldb/dbms/hr_dev;sql.syntax_mys=true;user=academia;password=finology
driver: org.hsqldb.jdbc.JDBCDriver
username: academia
password: finology
EOF

# h2
cat <<EOF > ~/.chorke/academia/etc/cfg/liquibase/dbms/dev.properties
url: jdbc:h2:file:~/.chorke/academia/var/h2/dbms/hr_dev;db_close_on_exit=false;mode=MySQL;user=academia;password=finology
driver: org.h2.Driver
username: academia
password: finology
EOF
```

### Contact

- [**info@chorke.org**][200]
- [**chorke.org**][100] 


[100]:  https://chorke.org "Chorke, Inc."
[101]:  https://github.com/ "GitHub"
[102]:  https://github.com/chorkeedu/academia-dbms-parent "academia-dbms-parent"
[103]:  https://github.com/chorkeedu/academia-dbms-change "academia-dbms-change"

[200]:  mailto:info@chorke.org "Chorke Contact"
[201]:  mailto:info@shahed.biz "Md Shahed Hossain"
