# [academia-dbms-change][103]

Most of the projects of [Chorke Academia, Inc.][100] are mavenized, It's a maven `POM` project for Database Migration on top of Java using Liquibase. This project develop to knowledge share of Liquibase migration process for`IHE Team`. It will be package as `JAR`. The immediate child projects of the [academia-dbms-change][103] are able to access all of the properties, dependencies as well as profiles by following way:


```xml
<dependency>
    <artifactId>academia-dbms-change</artifactId>
    <groupId>org.chorke.academia.dbms</groupId>
    <version>1.0.00.GA</version>
</dependency>
```
Most of the resource and library of [Chorke Academia, Inc.][100] permitted to use under considering `GPL V3` license. Clone the source code from [GitHub][101] at [academia-dbms-change][103] `git` repository.

```bash
git clone git@github.com:chorkeedu/academia-dbms-change.git
cd ./academia-dbms-change

```

### Properties Files
```bash
mkdir -p $HOME/.chorke/academia/etc/cfg/liquibase/dbms
cp ./src/test/resources/liquibase/*.properties $HOME/.chorke/academia/etc/cfg/liquibase/dbms
cd $HOME/.chorke/academia/etc/cfg/liquibase/dbms
explorer .

```

### Path Settings
```bash
export MYSQL_HOME=/c/opt/xampp/mysql
export PATH=$PATH:$MYSQL_HOME/bin

```

### Database Creation
```bash
# execute database creation script for empty password
mysql -uroot < ./src/test/resources/schema/hr_all_ini.sql
# execute database creation script for prompt password in cli
mysql -uroot -p < ./src/test/resources/schema/hr_all_ini.sql

```

### Import Dump
```bash
# import hr_dev_bas_ini.sql dump into hr_dev from cli
mysql -uroot hr_dev < ./src/test/resources/schema/hr_dev_bas_ini.sql
# import hr_dev_bas_ini.sql dump into hr_dev & prompt password from cli
mysql -uroot -p hr_dev < ./src/test/resources/schema/hr_dev_bas_ini.sql

```

### Maven Commands
```bash
mvn clean install -Pdev,log
mvn clean install -Pdev,syn
mvn clean install -Pdev,upd
mvn clean install -Pdif

mvn clean install -Pqac,syn
mvn clean install -Pqac,upd

mvn clean install -Puat,syn
mvn clean install -Puat,upd

mvn clean install -Ppro,syn
mvn clean install -Ppro,upd

mvn clean install -Ppro,del
mvn clean install -Ppro,rol -Dacademia.tag=20180806

```

You may use [`Epoch Converter`][300] for **UTC Time Stamp** Standard Id, Here is the maven repository of this project. add the repository to `.m2` `settings.xml` or `pom.xml`.


```xml
<server>
  <id>chorke.snapshots</id>
  <configuration>
      <httpHeaders>
        <property>
          <name>Authorization</name>
          <value>Basic bWF2ZW46bWF2ZW4=</value>
        </property>
      </httpHeaders>
  </configuration>
</server>

<repository>
    <id>chorke.releases</id>
    <url>https://mvn.chorke.org/m2/snapshots/</url>
    <releases>
        <enabled>true</enabled>
    </releases>
    <snapshots>
        <enabled>false</enabled>
    </snapshots>
</repository>
```

### LICENSE

```
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is furnished
to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
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

[300]: https://www.epochconverter.com "Epoch Converter"
