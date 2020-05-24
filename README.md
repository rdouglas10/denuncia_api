# Módulo: denuncia_api
Developer RoR

### Recursos utilizados
- Ruby 2.5.5
- Rails 4.0
- Postgres 12.2
- JWT para autenticação.

### Observações
- Existe um arquivo chamado: Users.postman_collection.json (POSTMAN) que contém as collections com as informações necessárias para testar cada endpoint da API.
- Script do bando de dados encontra-se na raiz do projeto, por nome: dump_bd.sql

### API

**Público**


- Endpoint: Cadastro de usuário:

                    
URI  | METHOD | CONTENT-TYPE | INPUT-FIELDS-EXAMPLE | OUTPUT
------------- | ------------- | ------------- | ------------- | -------------
http://localhost:3000/users  | POST  | Application/json | {"name": "Primeiro Usuário","username": "user", "email": "user@gmail.com", "password":"123456","password_confirmation": "123456"} | {"status": "ok"}




- Endpoint: Login:

URI  | METHOD | CONTENT-TYPE | INPUT-FIELDS-EXAMPLE | OUTPUT
------------- | ------------- | ------------- | ------------- | -------------
http://localhost:3000/auth/login  | POST  | Application/json | {"email": "user@gmail.com", "password":"123456"} | {"status": "ok"}


		    

- Endpoint: Recuperar senha:

  Para esse endpoint foi utilizado dois processos:
  
  * geração de um token por meio de um forgot, que teria por objetivo enviar para o email do usuário, para que ele pudesse efetuar uma verificação.
  * com o token gerado, o usuário poderia redefinir sua senha por meio de uma atualização.
  
  
  * 1º Etapa:
  
URI  | METHOD | CONTENT-TYPE | INPUT-FIELDS-EXAMPLE | OUTPUT
------------- | ------------- | ------------- | ------------- | -------------
http://localhost:3000/passwords/forgot  | POST  | Application/json | {"email": "user@gmail.com" | {"token": "4f8fb7a71c2ba15c079e"}


                      
                    
 2º Etapa:
 
 URI  | METHOD | CONTENT-TYPE | INPUT-FIELDS-EXAMPLE | OUTPUT
------------- | ------------- | ------------- | ------------- | -------------
http://localhost:3000/passwords/reset  | POST  | Application/json | {"email": "user@gmail.com", "token": "4f8fb7a71c2ba15c079e", "password": "123123"} | {"status": "ok"}

 

**Requer Autenticação**

- Endpoint: Editar apenas os dados do usuário logado:

 URI  | METHOD | AUTHORIZATION | CONTENT-TYPE | INPUT-FIELDS-EXAMPLE | OUTPUT
------------- | ------------- | ------------- | ------------- | ------------- | -------------
http://localhost:3000/users/(username)  | PUT | eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1ODQ3NzEzNjl9.IdLGeZ3ShB6W9sYbwtEww0KgqiHy8Rx7oZbO6SyYV4k | Application/json | {"username": "teste","token_access": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1LCJleHAiOjE1ODQ4MTc2Mzl9.AM6Wx5H8xedmDMQGchkBviGISaOwt6QNpyiiu1KS_P0"} | {"status": "ok"}
		    
OBS: Nesse endpoint nós vinculamos o token_access (AUTHORIZATION) ao usúario, onde por meio dele, conseguimos listar somente os dados do usuário logado, bem como utilizar para recuperar o usuário (foreingKey) para utlizar no momento da criação da denúncia.



- Endpoint: Listar todas as denúncias cadastradas, com suporte a paginação:

 URI  | METHOD | AUTHORIZATION | CONTENT-TYPE | OUTPUT
------------- | ------------- | ------------- | ------------- | ------------- 
http://localhost:3000/denunciations  | GET  | eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1ODQ3NzEzNjl9.IdLGeZ3ShB6W9sYbwtEww0KgqiHy8Rx7oZbO6SyYV4k | Application/json | {"status": "ok"}



- Endpoint: Criar denúncia:

URI  | METHOD | CONTENT-TYPE | AUTHORIZATION |  INPUT-FIELDS-EXAMPLE | OUTPUT
------------- | ------------- | ------------- | ------------- | ------------- | -------------
http://localhost:3000/denunciations  | POST  | Application/json | eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1ODQ3NzEzNjl9.IdLGeZ3ShB6W9sYbwtEww0KgqiHy8Rx7oZbO6SyYV4k | {"descricao": "Test description test", "status": "Pendent", "latitude": "25º 55", "longitude": "35º 43", "medida_adotada": "adopted measure number three", "token_access_user": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1ODQ3NzEzNjl9.IdLGeZ3ShB6W9sYbwtEww0KgqiHy8Rx7oZbO6SyYV4k"} | {"status": "ok"}



- Endpoint: Editar denúncia (INCOMPLETO...):

URI  | METHOD | CONTENT-TYPE | AUTHORIZATION |  INPUT-FIELDS-EXAMPLE | OUTPUT
------------- | ------------- | ------------- | ------------- | ------------- | -------------
http://localhost:3000/denunciations/(id)  | PUT  | Application/json | eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1ODQ3NzEzNjl9.IdLGeZ3ShB6W9sYbwtEww0KgqiHy8Rx7oZbO6SyYV4k | {"descricao": "Test description test", "status": "Pendent", "latitude": "25º 55", "longitude": "35º 43", "medida_adotada": "adopted measure number three", "token_access_user": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1ODQ3NzEzNjl9.IdLGeZ3ShB6W9sYbwtEww0KgqiHy8Rx7oZbO6SyYV4k"} | {"status": "ok"}


