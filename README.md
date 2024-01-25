# README

## setup

```rails db:create```
```rails db:migrate```

## Autenticación

Como autenticación básica con el API es necesario crear un token. Esto es algo muy simple, haz una call al enpoint:

POST
```/tokens```

guarda el token value en el ```.env.local``` de la fontend NextJS app como ```TOKEN=token```

después corre:

```rails db:seed```
