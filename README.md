# database-roadmap
My roadmap learning database.

O objetivo deste repositório é registrar algumas coisas interessantes sobre o meu apdrendizado de banco de dados relacional e SQL.


## Instalação do ambiente em Linux

O caminho que utilizarei aqui será o apresentado pelo Daniel Morais do [Infocotidiano](https://www.youtube.com/channel/UCzSoG5woURgXNNaDjdm6f4Q), onde ele apresenta como instalar o mySQL server em um máquina ubuntu ([link](https://www.youtube.com/watch?v=vt6W_YBHH_E)). Contudo, ao invés de instalar o mySQL em uma máquina virtual, instalarei em um Docker container. Além do mais, admitirei que qualquer pessoa venha a utilizar estas anotações tenha conhecimentos em Docker.

### Instalando container na máquina

Primeiramente vamos baixar imagem do ubuntu e montar o nosso container.

```bash
docker pull ubuntu:focal
docker run --name mySQL-db  -it ubuntu:focal bash
exit
```
Vamos dar start nosso container e rodar o bash no mesmo.

```bash
docker start mySQL-db
docker exec -it mySQL-db bash
apt update
```

[commit no docker](https://www.youtube.com/watch?v=u0_V8Scg9hI)

### Instalando o container do mySQL

[Link](https://techexpert.tips/mysql/mysql-docker-installation/#:~:text=Tutorial%20MySQL%20%2D%20Docker%20Installation%20on,Install%20the%20Docker%20service.&text=Download%20the%20MySQL%20docker%20image%20from%20the%20online%20repository.&text=List%20the%20Docker%20images%20installed%20on%20your%20system.&text=Start%20a%20new%20MySQL%20container%20using%20this%20Docker%20image.) do tutorial

### Instalando o mySQL Server
[Link](https://www.youtube.com/watch?v=vr_2yqOmyFk) do vídeo de instalação
Comandos:

```bash
sudo apt update
sudo apt install mysql-server
sudo mysql_secure_installation
sudo mysql
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'Info@1234';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' WITH GRANT OPTION;

CREATE USER 'suporte'@'%' IDENTIFIED BY 'Info@1234';
GRANT ALL PRIVILEGES ON *.* TO 'suporte'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;

sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
para liberar acesso de outros computadores, mude o bind-address
para 0.0.0.0
skip-name-resolve (conflitos dns /request de ip)

sudo service mysql restart

```

### comandos de teste
apt-get install dialog apt-utils

sudo su
export RUNLEVEL=1
service mysql status
service mysql start

mysql user is looking for a home directory, which seems to have not been assigned. To do that, you can execute:

sudo service mysql stop
sudo usermod -d /var/lib/mysql/ mysql
sudo service mysql start

Tive alguns problemas com o docker, portanto tive que fazer algumas alterações no meu container

dei commit em uma imagem do ubuntu:focal que eu tinha previamente instalado o MySQL da seguinte forma

```bash
docker run --name mySQL-db-net -p3306:3306 -v mysql-volume:/var/lib/mysql  -it caiomaia3/mysql-image:version1 bash
```
Com este comando eu definir portas de acesso específicas e utilizei um volume que tinha previamente definido.
O volume foi criado como seguinte comando no terminal

```
bash
docker run --name mySQL-db-net -p3306:3306 -v mysql-volume:/var/lib/mysql  -it caiomaia3/mysql-image:version1 bash
```
Para colocar o container para rodar basta dar start no container e depois executar um comando para rodar um serviço do mysql

```bash
docker start mySQL-db-net
docker exec mySQL-db-net service mysql start
```
Agora basta abrir o workbench e acessar o container. Uma outra forma e utilizar o client que instalamos previamente, bastando executar cliente ``mysql -u(user) -p(password) -h(host-ip).

```bash
mysql -usuporte -pInfo@1234 -h172.17.0.2
```

### Como instalar SQL Server (Microsoft)

[Video](https://www.youtube.com/watch?v=vt6W_YBHH_E) de instalação

Comandos:

```bash
wget -qO- https://packages.microsoft.com/keys/m... | sudo apt-key add -
sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config...)"
sudo apt-get update
sudo apt-get install -y mssql-server
sudo /opt/mssql/bin/mssql-conf setup
systemctl status mssql-server --no-pager
```

### How to install the mySQL Workbench

O tutorial pode ser encontrado aqui, mas fui direto no site da Oracle pra pegar os links corretos. Por uma questão de segurança.


download o arquivo .deb no site da oracle
https://dev.mysql.com/downloads/file/?id=507338
cd Downloads
sudo apt install ./mysql-apt-config_0.8.16-1_all.deb
sudo apt update
sudo apt install mysql-workbench-community

## Criando um Banco de dados e Tabelas

Para criar um banco de dados basta entrar no ambeinte do mysql ou no workbench e rodar o seguinte query

```sql
create database cadastro;
```
Detalhe, como eu estou no ambiente linux, a configuração do ``charset`` e do ``collate`` são por padrão utf8. Caso precise configurar o banco com este padrão de caractere, basta rodar o seguinte query

```sql
create database cadastro
default character set utf8
default collate utf8_general_ci;
```

Em seguida podemos criar uma tabela da seguinte forma

```sql
use database cadastro;

create table pessoas(
id int not null auto_increment,
nome varchar(30) not null,
nascimento date,
sexo enum('M','F'),
peso decimal(5,2),
altura decimal(3,2),
nacionalidade varchar(30) default 'Brasil',
primary key (id)
) default charset =utf8;
```

## Instalando o PhpMyAdmin no docker

Para isto basta fazer um link entre o container do server mysql criado com um container no phpMyAdmin a ser criado. Deste modo podemos utilizar o seguinte comando:

```bash
docker run --name phpMyAdmin -d --link mySQL-db-net:db -p 8080:80 phpmyadmin
```

Em seguida basta acessar o ip do host no navegador, que no nosso caso é: ``127.17.0.2:8080``.