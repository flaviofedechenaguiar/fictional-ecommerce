# Fictional Ecommerce Project
## Sobre o Projeto
Este projeto foi desenvolvido para a conclusão do curso Técnico em Informática do [Intituto Federal do Paraná - Campus Umuarama](https://umuarama.ifpr.edu.br/).

O projeto e um sistema de E-commerce, onde foram utilizandas algumas técnologias, entre elas estão:
 - Nodejs
 - Express
 - Docker & Docker Compose
 - Ejs
 - Bootstrap
 - Mysql
 - ORM Sequelize

Padrão de projeto utilizado: MVC
## Execuão do Projeto
Para executarmos o Projeto devemos seguir os seguintes passos:
- obs. Local em que será executados os próximos comandos:
    ```sh
    userFoo@userFoo:~/folderFoo/fictional-ecommerce-main$ ls
    annotations.md      Dockerfile   mysql-container.session.sql  public
    controllers         index.js     package.json                 README.md
    database            middlewares  package-lock.json            views
    docker-compose.yml  models       plugins
    ```
 - 1). Instalação das dependência:
    ```
    npm install
    ```
 - 2). Subindo o Container
    - 1). Buildar o container 
        ```sh
        docker-compose build
        ```
    - 2). Subir o container
        ```sh
        docker-compose up
        
        # 1 - Pode ser gerando um erro por parte de mysql, esse erro acontece pois ainda não foi criado o container do mysql, por conta disso ele não encontra a porta. Portanto caso aconteça reesecute o comando.
        # 2 - será retornado a seguinte menssagem quando terminar de subir o container 
        #mysql-container   | 2021-08-28T00:47:30.375232Z 0 [System] [MY-010931] [Server] /usr/sbin/mysqld: ready for connections. Version: '8.0.26'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  MySQL Community Server - GPL.
        #mysql-container   | 2021-08-28T00:47:30.375401Z 0 [System] [MY-011323] [Server] X Plugin ready for connections. Bind-address: '::' port: 33060, socket: /var/run/mysqld/mysqlx.sock
        ```
 - 3). Acesse [localhost:3030](http://localhost:3030)

 - 4). Caso queira subir um script SQL com dados já cadastrados:
 
    - 1). Ceder permissão para a pasta `database/mysql`
       
      ```sh
      sudo chmod -R 777 database/mysql
      ```
    - 2). Copiar o arquivo SQL `backup.sql` para a pasta `database/mysql`
       
      ```sh
      cp database/backup.sql database/mysql
      ```
    - 3). Entrar no container `mysql-container`
     
      ```sh
      docker exec -it mysql-container bash
      ```
    - 4). Importar a base de dados para o Mysql
      
      ```sh
      mysql -u root -p < /var/lib/mysql/backup.sql
      ```

## Desenvolvido por 

[Fábio Fedechen Aguiar](https://www.instagram.com/fagod5) e [Flavio Fedechen Aguiar](https://www.instagram.com/flaviofeaguiar)
 
    
