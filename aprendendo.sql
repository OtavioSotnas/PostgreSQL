integer
real
serial
numeric
----------
varchar(n)
char(n)
text
----------
boolean
----------
date
time
timestamp
----------
	
CREATE TABLE aluno(
	id SERIAL, 
	nome VARCHAR(255),
	cpf CHAR(11),
	observacao TEXT,
	idade INTEGER,
	renda NUMERIC(10,2),
	altura REAL,
	ativo BOOLEAN,
	data_nascimento DATE,
	hora_aula TIME,
	matriculado_em TIMESTAMP
);

SELECT * FROM aluno;

INSERT INTO aluno (
	nome, 
	cpf,
	observacao,
	idade,
	renda,
	altura,
	ativo,
	data_nascimento,
	hora_aula,
	matriculado_em
) 
VALUES (
	'Otávio',
	'12345678901',
	'teste.',
	20,
	1400.50,
	1.79,
	TRUE,
	'2003-06-02',
	'19:00:00',
	'2020-02-05 12:00:00'
);

SELECT * 
	FROM aluno
WHERE id = 30

UPDATE aluno
	SET nome = 'Marianna', 
	cpf = '10987654321',
	idade = '20',
	ativo = FALSE,
	observacao = 'teste',
	renda = 600.30,
	altura = 1.60,
	data_nascimento = '2003-06-05',
	hora_aula = '18:50:00',
	matriculado_em = '2023-02-05 12:00:00'
WHERE id = 30

DELETE 
	FROM aluno
	WHERE nome = 'Marianna';
	
SELECT nome AS "Nome do aluno",
idade, 
matriculado_em
FROM aluno;

INSERT INTO aluno (nome) VALUES ('Vinícius Dias');
INSERT INTO aluno (nome) VALUES ('Nico Steppat');
INSERT INTO aluno (nome) VALUES ('João Roberto');
INSERT INTO aluno (nome) VALUES ('Diego');
INSERT INTO aluno (nome) VALUES ('Diogo');

SELECT * FROM aluno
WHERE nome = 'Diogo'

SELECT * FROM aluno
WHERE nome != 'Diogo'

SELECT * FROM aluno
WHERE nome LIKE 'Di_go' -- o _ significa "qualquer caractere naquela posição"   
