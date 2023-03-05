# Projeto

Aplicativo Flutter com login de usuário e player de vídeo utilizando arquitetura Flutter Modular + Mobx. 

## Versão do Flutter

- 3.3.10

## Telas

- LoginPage
<img src="https://user-images.githubusercontent.com/69534679/222989325-794668fc-eebd-464e-9f89-aa5fcc3f1ee1.png" width="20%" height="auto">

- HomePage
<img src="https://user-images.githubusercontent.com/69534679/222989852-7d785c18-bf7b-4068-b537-fa06cce94827.png" width="20%" height="auto">

## Telas de erros
- API retornando 400
<img src="https://user-images.githubusercontent.com/69534679/222989928-2a37d101-938f-412e-9bef-6481b2b14469.png" width="20%" height="auto">

- API retornando 401
<img src="https://user-images.githubusercontent.com/69534679/222989956-94f40fa9-f232-4176-ade4-55d139df3154.png" width="20%" height="auto">
<img src="https://user-images.githubusercontent.com/69534679/222989961-eaffe64b-ca3a-4f83-b4ba-a342418f71e3.png" width="20%" height="auto">

- API retornando 404
<img src="https://user-images.githubusercontent.com/69534679/222989994-036d1d1c-f591-4f76-9e21-75714eb7f390.png" width="20%" height="auto">

- API retornando 500
<img src="https://user-images.githubusercontent.com/69534679/222990044-c9dbb5db-9b4e-4379-927d-8692edb83158.png" width="20%" height="auto">
<img src="https://user-images.githubusercontent.com/69534679/222990029-7c3080b6-a693-4c54-8f38-387002f71032.png" width="20%" height="auto">

## Bibliotecas utilizadas
- flutter_mobx e mobx: Essas bibliotecas foram utilizadas para fazer o gerenciamento de estado da aplicação.
- flutter_modular: Injeção de dependência e gerenciamento de rotas da aplicação.
- http: Usado para fazer chamadas http (Comunicação com API).
- flutter_secure_storage: Usado para fazer o cacheamento do token do usuário, permitindo que o usuário não precise digitar suas crendeciais toda vez que abrir o aplicativo. Essa biblioteca foi utilizada para armazenar e utilizar o token salvo do dispositivo do usuário após realizar o primeiro login com sucesso.
- http_interceptor: Usado para injetar o token do usuário nas chamadas à api e para fazer o tratamento de erros. Foram criados dois interceptos, sendo eles: AutheticationInterceptor (responsável por inserir o x-access-token no header da chamada http) e ErrorInterceptor (responsável por capturar e gerenciar os erros obtidos pela API).
- chewie e video_player: Essas bibliotecas fora utilizadas para renderizar o vídeo na aplicação no formato .m3u8
- build_runner e mobx_codegen: Usado para gerar os arquivos necessários para implementar a gerencia de estados utilizando Mobx.
- mocktail: Usado para criação de testes unitários e teste de widgets
- modular_test: Usada para simular as injeções de dependência do Flutter Modular nos testes desenvolvidos.




