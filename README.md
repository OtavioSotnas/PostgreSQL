# PostgreSQL

- Tipos de dados:

| Nome | Descrição | Exemplo | Formatação |
| ------- | ------- | ------- | ------- |
| integer | Numeros inteiros entre -2147483648 e +2147483647 | Idade de uma pessoa | 20 |
| real | Números com casas decimais de até seis dígitos | Altura de uma pessoa | 1.79|
| serial | Números inteiros positivos com incremento automático  | O ID em uma base de dados | 1 |
| numeric(10,2) | Números com casas decimais pré-definidas | Dinheiro ou Renda | 1400.20| 
| varchar(n) | Textos com tamanho pré determinado | O nome de uma pessoa | 'Otávio' |
| char(n) | Quantidade exata de caracteres utilizados | CPF sempre vai ter 11 caracteres | '123.456.789-10 |
| text | Textos com tamanhos infinitos | Descrição ou obervações | '..............'|
| date | Data sem o tempo do dia | Data de nascimento | '2003-06-02' |
| time | Tempo do dia sem a data | Horário de chegada | '19:02:50' |
| timestamp | Data e tempo do dia | Acontecimento de algo | '2020-02-05 12:00:00' |
