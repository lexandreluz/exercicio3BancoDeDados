
.header on
.mode column

/* DDL - Data definition Language */
CREATE TABLE aluno (
  id INTEGER NOT NULL PRIMARY KEY,
  nome TEXT,
  ano INTEGER,
  nascimento DATE  
);

CREATE TABLE disciplina (
  id INTEGER NOT NULL PRIMARY KEY,
  nome TEXT,
  professor TEXT
);

CREATE TABLE matricula (
  id_disciplina INTEGER,
  id_aluno INTEGER,
  nota DOUBLE,
  FOREIGN KEY(id_disciplina) REFERENCES disciplina(id),
  FOREIGN KEY(id_aluno) REFERENCES aluno(id)
);

/* DML - Data Manipulation Language */
INSERT INTO aluno VALUES
  (1,'Adailton Lima', 2002, '1983-10-01'),
  (2,'Alexandre Oliveira', 2020, '1889-10-06'),
  (3,'Wanderson Silva', 2020, '1913-06-07'),
  (4,'Felipe Da Silva', 2020, '1880-01-04');
  
INSERT INTO disciplina VALUES
  (1,'Banco de Dados','Adailton Lima');

INSERT INTO matricula VALUES
  (1,1,0.0),
  (1,2,8.0),
  (1,3,7.0),
  (1,4,6.0);

.print 'Nome de Todos'
/* SQL  - Structured Query Language */
SELECT id, nome FROM aluno;

.print 'Disciplinas'
SELECT * FROM disciplina;

.print 'Matriculas'
SELECT * FROM matricula;

.print 'Alunos e Suas Notas'
SELECT a.nome as aluno_nome, m.nota as nota_aluno FROM aluno a , matricula m where m.id_aluno=a.id;


.print 'Junção entre Alunos e Matriculoas'

SELECT a.id,m.id_disciplina, m.nota, a.ano FROM aluno a , matricula m 
where m.nota>6 AND (a.id = m.id_aluno);


.print
.print 'Media de Ano'
SELECT avg(ano) AS media FROM aluno;
