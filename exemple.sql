.header on
.mode column

CREATE TABLE projeto (
  codProjeto TEXT NOT NULL PRIMARY KEY, 
  nome TEXT,
  tipoProjeto TEXT, 
  chave_departamento TEXT, 
  FOREIGN KEY (tipoProjeto) REFERENCES tipo_projeto(nome),
  FOREIGN KEY (chave_departamento) REFERENCES departamento(nome)
);

CREATE TABLE departamento (
  verba FLOAT,
  nome TEXT NOT NULL PRIMARY KEY 
);

CREATE TABLE tipo_projeto (
  nome TEXT NOT NULL PRIMARY KEY,
  descricao TEXT
);

INSERT INTO departamento(verba, nome) 
VALUES
  (1000, 'TI'),
  (50000, 'RH');

INSERT INTO tipo_projeto VALUES
  ('Software','Fazer software'),
  ('Construção Civil', 'Fazer alguma casa');


INSERT INTO projeto VALUES
  ('PR1','Projeto Casa Flutuante','Construção Civil','RH'),
  ('PR2','Projeto App Empresa','Software','TI');
  

.print 'LISTAGEM DE PROJETOS'
select codProjeto, nome from projeto;

.print 'LISTAGEM DE DEPARTAMENTOS'
select nome from departamento;

.print 'LISTAGEM DE TIPO PROJETO'
select descricao from tipo_projeto;


.print 'JUNCAO DE PROJETO COM DEPARTAMENTO'
select p.nome,d.verba from projeto p, departamento d on p.chave_departamento = d.nome ;


.print 'JUNCAO DE PROJETO COM DEPARTAMENTO'
select p.nomeProjeto from projeto p , tipo_projeto t on p.tipoProjeto = t.nome ;

