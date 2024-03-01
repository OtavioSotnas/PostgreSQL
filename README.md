# **PostgreSQL**

**Tipos de dados:**

| Nome | Descrição | Exemplo | Formatação |
| ------- | ------- | ------- | ------- |
| integer | Numeros inteiros entre -2147483648 e +2147483647 | Idade de uma pessoa | 20 |
| real | Números com casas decimais de até seis dígitos | Altura de uma pessoa | 1.79|
| serial | Números inteiros positivos com incremento automático  | O ID em uma base de dados | 1 |
| numeric(10,2) | Números com casas decimais pré-definidas | Dinheiro ou Renda | 1400.20| 
| varchar(n) | Textos com tamanho pré determinado | O nome de uma pessoa | 'Otávio' |
| char(n) | Quantidade exata de caracteres utilizados | CPF sempre vai ter 11 caracteres | '12345678910 |
| text | Textos com tamanhos infinitos | Descrição ou obervações | '............................................'|
| date | Data sem o tempo do dia | Data de nascimento | '2003-06-02' |
| time | Tempo do dia sem a data | Horário de chegada | '19:02:50' |
| timestamp | Data e tempo do dia | Acontecimento de algo | '2020-02-05 12:00:00' |

## **1. EXECUTANDO OPERAÇÕES**

### 1.1 Para criar uma tabela:
```sql
CREATE TABLE aluno (
	id SERIAL, 
	nome VARCHAR(255),
	cpf CHAR(11),
	idade INTEGER,
	ativo BOOLEAN
)
```
### 1.2 Inserindo um dado na tabela:
```sql
INSERT INTO aluno (nome, cpf, idade, ativo) 
  VALUES ('Otávio', '12345678901', 20, TRUE)
```
### 1.3 Modificando um dado:
```sql
UPDATE aluno
  SET nome = 'Marianna', cpf = '10987654321', idade = '20', ativo = FALSE
  WHERE id = 1
```
### 1.4 Excluindo um dado:
```sql
DELETE 
  FROM aluno
  WHERE nome = 'Marianna'
```

## **2. CONSULTAS COM FILTROS**

### 2.1 Selecionando colunas específicas da tabela:

```sql
-- O asterísco retorna todas colunas da tabela
SELECT * FROM aluno

-- Desta maneira retorna só as colunas que passarmos
SELECT nome AS "Nome do aluno", 
matriculado_em AS quando_se_matriculou # Podemos utilizar o AS para mudar o nome na consulta
FROM aluno
```

### 2.2 Filtrando registros do tipo texto

```sql
SELECT * FROM aluno
WHERE nome = 'Diogo' # Dados com nome igual a 'Diogo'.

SELECT * FROM aluno
WHERE nome != 'Diogo' # Dados com nome diferente de 'Diogo'.
```

```sql
SELECT * FROM aluno
WHERE nome LIKE 'Di_go' # O _ (underline) significa "qualquer caractere naquela posição".   

SELECT * FROM aluno
WHERE nome LIKE 'D%' # Dados que começam com 'D' e com qualquer caracter depois.

SELECT * FROM aluno
WHERE nome LIKE '%s' # Dados que possuem qualquer caracter mas terminem com 's'.
```
### 2.3 Filtrando registros do tipo númerico

```sql
SELECT * FROM aluno
WHERE idade = 20; # Idade do aluno igual a 20.

SELECT * FROM aluno
WHERE idade != 20; # Idade do aluno diferente de 20.

SELECT * FROM aluno
WHERE idade > 20; # Idade do aluno maior que 20.

SELECT * FROM aluno
WHERE idade < 20; # Idade do aluno menor que 20.

SELECT * FROM aluno
WHERE idade BETWEEN 10 AND 20; # Idade do aluno entre 10 e 20.
```

### 2.4 Filtrando registros do tipo Booleano
```sql
SELECT * FROM aluno
WHERE ativo = true # Retorna todos True.

SELECT * FROM aluno # Retorna todos False.
WHERE ativo = false
```

### 2.5 Filtrando registros do tipo Null
```sql
SELECT * FROM aluno
WHERE cpf IS NULL # Retorna todos os nulos.

SELECT * FROM aluno
WHERE cpf IS NOT NULL # Retorna todos não nulos.
```


## 3. TRABALHANDO COM RELACIONAMENTOS

### 3.1 Chave-Primária
```sql
CREATE TABLE curso (
    id INTEGER PRIMARY KEY, -- Representa UNIQUE e NOT NULL ao mesmo tempo
        nome VARCHAR(255) NOT NULL
);
```

### 3.2 Chave-Estrangeira
```sql
FOREIGN KEY (CAMPO_NA_TABELA_ORIGEM)
REFERENCES TABELA_DESTINO (CAMPO_NA_TABELA DESTINO)

CREATE TABLE turma (
    aluno_id INTEGER,
    curso_id INTEGER,
    PRIMARY KEY (aluno_id, curso_id),

    FOREIGN KEY (aluno_id)
    REFERENCES aluno (id),
```

### 3.3 Consultas com relacionamentos
```sql
-- Junta a tabela aluno com a turma onde a variável aluno_id = variável id da tabela aluno
SELECT *
  FROM aluno
  JOIN turma ON turma.aluno_id = aluno.id

-- Junta a tabela aluno com turma e curso e retorna tambem alunos,
-- tabela da esquerda (aluno), que não tem um curso
SELECT aluno.nome as "Nome do Aluno",
        curso.nome as "Nome do Curso"
    FROM aluno
LEFT JOIN turma ON turma.aluno_id = aluno.id
LEFT JOIN curso ON curso.id = turma.curso_id

-- Junta a tabela aluno com turma e curso e retorna tambem cursos,
-- tabela da direita (curso), que não tem alunos.
SELECT aluno.nome as "Nome do Aluno",
        curso.nome as "Nome do Curso"
    FROM aluno
RIGHT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
RIGHT JOIN curso ON curso.id = aluno_curso.curso_id

-- Retorna todos dados, mesmo eles não tendo correspondência
-- nas outras tabelas
SELECT aluno.nome as "Nome do Aluno",
        curso.nome as "Nome do Curso"
    FROM aluno
FULL JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
FULL JOIN curso ON curso.id = aluno_curso.curso_id
```


## 4. USANDO CASCADE

### 4.1 Delete and Uptade Cascade

```sql
-- Por padrão, chaves estrangeiras impedem que você exclua
-- ou altere registros que existem em outras tabelas.
FOREIGN KEY (aluno_id)
  REFERENCES aluno (id)
  ON DELETE RESTRICT # Padrão
  ON UPDATE RESTRICT # Padrão

-- Para mudar isso apenas mudamos o argumento para CASCADE
FOREIGN KEY (aluno_id)
  REFERENCES aluno (id)
  ON DELETE CASCADE
  ON UPDATE CASCADE
```

## 5. AVANÇANDO COM CONSULTAS

### 5.1 Ordenando Consultas
