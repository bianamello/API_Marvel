#language: pt

Funcionalidade: Listar Personagens Marvel

    Sendo uma aplicação
    Posso solicitar o endpoint que lista os personagens da Marvel
    Para obter informações sobre os personagens

@listarPersonagens
Esquema do Cenário: Listar quantidade limitada de personagens
    
    Dado que eu informe os seguintes dados de autenticação da API:
        | ts     | <ts>     |
        | apikey | <apikey> |
        | hash   | <hash>   |
    Quando que eu faço uma solicitação do tipo GET para o endpoint que lista "<quantidade>" limitada de personagens da Marvel
    Então o código de resposta HTTP deve ser igual a "<status_code>"
    E devo receber a "<quantidade>" limitada de personagens
          
    Exemplos:
        | ts         | apikey                           | hash                             | status_code | quantidade |
        | 1549238400 | 047ba6c23ffc0e68fffb97d9c082edc0 | f5eb49fb2f46a77876e1c7a028ff5282 | 200         | 5          |


@listarInfoPersonagm
Esquema do Cenário: Listar informações de um personagem
    
    Dado que eu informe os seguintes dados de autenticação da API:
        | ts     | <ts>     |
        | apikey | <apikey> |
        | hash   | <hash>   |
    Quando que eu faço uma solicitação do tipo GET para o endpoint que lista as informações do personagem "<nome>"
    Então o código de resposta HTTP deve ser igual a "<status_code>"
    E devo receber as informações do personagem "<nome>"
          
    Exemplos:
        | ts         | apikey                           | hash                             | status_code | nome       |
        | 1549238400 | 047ba6c23ffc0e68fffb97d9c082edc0 | f5eb49fb2f46a77876e1c7a028ff5282 | 200         | Spider-Man |


@listarComicsPersonagem
Esquema do Cenário: Listar comics de um personagem
    
    Dado que eu informe os seguintes dados de autenticação da API:
        | ts     | <ts>     |
        | apikey | <apikey> |
        | hash   | <hash>   |
    Quando que eu faço uma solicitação do tipo GET para o endpoint que lista os comics de um personagem "<nome>"
    Então o código de resposta HTTP deve ser igual a "<status_code>"
    E devo receber os comics do personagem
          
    Exemplos:
        | ts         | apikey                           | hash                             | status_code | nome       |
        | 1549238400 | 047ba6c23ffc0e68fffb97d9c082edc0 | f5eb49fb2f46a77876e1c7a028ff5282 | 200         | Spider-Man |