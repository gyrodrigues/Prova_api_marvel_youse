# language: pt
# coding: utf-8

@listar_personagens
Funcionalidade: Listar informações dos personagens da Marvel
 Eu como usuário dessa api
 Quero listar 5 personagens
 Pra veficar se a lista de personagens esta funcionando corretamente.

 Eu como usuário dessa api 
 Quero listar informações sobre um personagem específico.
 Para validar se a lista por usuário esta funcionando corretamente.

Eu como usuário dessa api 
Gostaria de filtrar comics de um usuário específico. 
Para validar se a lista por comics de um personagem esta funcionando corretamente.

Contexto: Acessa a Api
Dado que acesse a api characters Marvel


@cinco_personagens
Cenário: Listar 5 personagens da Marvel
        Quando busco por cinco personagens
        Então devo visualizar as informações dos 5 personagens

@id_personagem
Cenário: Listar único personagem da Marvel
        Quando buscar por pelo personagem com id "1017100"
        Então devo visualizar a informação do personagem

@comic_personagem
Cenário: Listar comics de único personagem da Marvel
        Quando buscar as comics de um único personagem
        Então devo visualizar as comics do personagem