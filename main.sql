.header on
.mode column

CREATE TABLE cartaoVacinacao(
  idPaciente INTEGER NOT NULL PRIMARY KEY,
  nomePaciente TEXT,
  cnes INTEGER,
  dataDeVacinacao DATE,
  vacina TEXT,
  dose INTEGER,
  lote INTEGER,
  FOREIGN KEY (vacina) REFERENCES fabricanteVacina(nomeFabricante)
);

CREATE TABLE fabricanteVacina(
  idFabricante INTEGER,
  nomeFabricante TEXT NOT NULL PRIMARY KEY
);

INSERT INTO cartaoVacinacao VALUES
  (1, 'Alexandre', 67868, '15/01/2021', 'BUTANTAM', 1, 2021),
  (2, 'Berenice', 33493, '17/01/2021', 'BUTANTAM', 1, 2021),
  (3, 'Gilvia', 45645, '18/01/2021', 'CORONAVAC', 1, 2021),
  (4, 'Maytê', 89089, '14/01/2021', 'mRNA1273', 1, 2021),
  (5, 'Ana', 56787, '18/01/2021', 'CORONAVAC', 1, 2021),
  (6, 'Pitterson', 28896, '16/01/2021', 'mRNA1273', 1, 2021);

INSERT INTO fabricanteVacina VALUES
  (11111, 'BUTANTAM'),
  (22222, 'CORONAVAC'),
  (33333, 'mRNA1273');

.print
.print 'Vacinados'
select c.nomePaciente, f.nomeFabricante, c.dataDeVacinacao, c.lote from cartaoVacinacao c, fabricanteVacina f on c.vacina = nomeFabricante;

.print
.print 'Vacinados pelo BUTANTAM'
select c.nomePaciente, f.nomeFabricante, c.dataDeVacinacao, c.lote from cartaoVacinacao c, fabricanteVacina f on c.vacina = nomeFabricante where f.nomeFabricante = 'BUTANTAM';

.print
.print 'Vacinados pelo CORONAVAC'
select c.nomePaciente, f.nomeFabricante, c.dataDeVacinacao, c.lote from cartaoVacinacao c, fabricanteVacina f on c.vacina = nomeFabricante where f.nomeFabricante = 'CORONAVAC';

.print
.print 'Vacinados pelo mRNA1273'
select c.nomePaciente, f.nomeFabricante, c.dataDeVacinacao, c.lote from cartaoVacinacao c, fabricanteVacina f on c.vacina = nomeFabricante where f.nomeFabricante = 'mRNA1273';


