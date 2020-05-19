drop database if exists universita;
create database universita;
use universita;

create table if not exists corso_di_laurea (
    codice_corso_laurea char(4) check(length(codice_corso_laurea) = 4),
    nome_corso_laurea varchar(15) not null,
    descrizione varchar(30),
    primary key (codice_corso_laurea)
);

create table if not exists studente (
    matricola numeric(6) check(matricola > 0),
    corso_laurea char(4) check(length(corso_laurea) = 4) not null,
    nome varchar(15) not null,
    cognome varchar(15) not null,
    data_nascita date not null,
    codice_fiscale char(16) unique check(length(codice_fiscale) = 16),
    primary key(matricola),
    foreign key (corso_laurea) references corso_di_laurea(codice_corso_laurea)
);

create table if not exists dipartimento (
    codice char(3) check(length(codice) = 3),
    nome varchar(15) not null,
    primary key (codice)
);

create table if not exists docente (
    matricola numeric(6) check(matricola > 0),
    dipartimento char(3) check(length(dipartimento) = 3) not null,
    nome varchar(15) not null,
    cognome varchar(15) not null,
    data_nascita date not null,
    codice_fiscale char(16) unique check(length(codice_fiscale) = 16),
    primary key(matricola),
    foreign key (dipartimento) references dipartimento(codice)
);

create table if not exists modulo (
    codice char(3) check(length(codice) = 3),
    nome varchar(30) not null,
    descrizione varchar(30),
    cfu numeric(2) not null, check(cfu > 0 AND cfu <= 12),
    primary key(codice)
);

create table if not exists esame (
    matricola_studente numeric(6) check(matricola_studente > 0),
    codice_modulo char(3) not null check(length(codice_modulo) = 3),
    matricola_docente numeric(6) check(matricola_docente > 0),
    data_esame date not null,
    voto numeric(2) check(voto >= 18 AND voto <= 30) not null,
    note varchar(30),
    primary key(matricola_studente,codice_modulo),
    foreign key(codice_modulo) references modulo(codice),
    foreign key(matricola_studente) references studente(matricola),
    foreign key(matricola_docente) references docente(matricola)
);

create table if not exists sede (
    codice char(4) check(length(codice) = 4),
    indirizzo varchar(20) not null,
    citta varchar(10) not null,
    primary key (codice)
);

create table if not exists sede_dipartimento (
    codice_sede char(4) check(length(codice_sede) = 4),
    codice_dipartimento char(4) check(length(codice_dipartimento) = 3),
    note varchar(30),
    primary key(codice_sede),
    foreign key (codice_dipartimento) references dipartimento(codice),
    foreign key (codice_sede) references sede(codice)
);

/* INSERIMENTO CORSI DI LAUREA */

insert into corso_di_laurea(codice_corso_laurea,nome_corso_laurea)
	values('ABC1','Informatica');
    
insert into corso_di_laurea(codice_corso_laurea,nome_corso_laurea)
	values('ABC2','Matematica');
    
insert into corso_di_laurea(codice_corso_laurea,nome_corso_laurea)
	values('ABC3','Giurisprudenza');
    
insert into corso_di_laurea(codice_corso_laurea,nome_corso_laurea)
	values('ABC4','Fisica');
    
insert into corso_di_laurea(codice_corso_laurea,nome_corso_laurea)
	values('ABC5','Chimica');

/* INSERIMENTO STUDENTI */

insert into studente(matricola,corso_laurea,nome,cognome,data_nascita,codice_fiscale)
	values(697768,'ABC1','Guido','Lippolis','2000-02-20','LPPGDU00B20L049S');

insert into studente(matricola,corso_laurea,nome,cognome,data_nascita,codice_fiscale)
	values(123456,'ABC1','Flavio','Collocola','1999-06-28','CLLFLV99H28L049Z');
    
insert into studente(matricola,corso_laurea,nome,cognome,data_nascita,codice_fiscale)
	values('453675','ABC1','Pierpaolo','Mariani','1998-08-5','MRNPPL98M05L049Z');
    
insert into studente(matricola,corso_laurea,nome,cognome,data_nascita,codice_fiscale)
	values('427684','ABC1','Andrea','Costantini','1999-12-28','CSTNDR99T28E506P');

insert into studente(matricola,corso_laurea,nome,cognome,data_nascita,codice_fiscale)
	values('561769','ABC1','Claudio','Minardi','1999-09-26','MNRCLD99P26L049F');
   
insert into studente(matricola,corso_laurea,nome,cognome,data_nascita,codice_fiscale)
	values('187945','ABC1','Luca','Fabbiano','1999-11-22','FBBLCU99S22L049G');
    
insert into studente(matricola,corso_laurea,nome,cognome,data_nascita,codice_fiscale)
	values('423712','ABC1','Francesco','Scarci','2000-02-23','SCRFNC00B23L049S');
    
insert into studente(matricola,corso_laurea,nome,cognome,data_nascita,codice_fiscale)
	values('285634','ABC1','Simone','Marchitelli','1999-06-21','MRCSMN99H21F205F');
    
insert into studente(matricola,corso_laurea,nome,cognome,data_nascita,codice_fiscale)
	values('955877','ABC1','Gianluca','Fornaro','1998-08-20','FRNGLC98M21L049S');
    
/* INSERIMENTO DIPARTIMENTI */

insert into dipartimento(codice,nome)
	values('ICD','Informatica'); 
    
insert into dipartimento(codice,nome)
	values('MAT','Matematica'); 
    
insert into dipartimento(codice,nome)
	values('GIU','Giurisprudenza'); 
    
insert into dipartimento(codice,nome)
	values('FIS','Fisica'); 
    
insert into dipartimento(codice,nome)
	values('CHI','Chimica'); 
    
/* INSERIMENTO DOCENTI */
   
insert into docente(matricola,dipartimento,nome,cognome,data_nascita,codice_fiscale)
	values(573987,'ICD','Carmelo','Ardito','1975-07-15','RDTCML75L15A662S');
    
insert into docente(matricola,dipartimento,nome,cognome,data_nascita,codice_fiscale)
	values(672987,'ICD','Ciro','Castiello','1976-09-23','CSTCRI76P23A662M');
    
insert into docente(matricola,dipartimento,nome,cognome,data_nascita,codice_fiscale)
	values(176845,'MAT','Genni','Fragnelli','1974-05-20','FRGGNN74E20G478C');
    
insert into docente(matricola,dipartimento,nome,cognome,data_nascita,codice_fiscale)
	values(287698,'ICD','Marco','De Gemmis','1974-06-20','DGMMRC74H20A662Q');

insert into docente(matricola,dipartimento,nome,cognome,data_nascita,codice_fiscale)
	values(397546,'MAT','Michele','Fiorentino','1980-02-10','FRNMHL80B10A662H');
    
insert into docente(matricola,dipartimento,nome,cognome,data_nascita,codice_fiscale)
	values(674123,'ICD','Fedelucio','Narducci','1979-04-20','NRDFLC79D20A662N');
    
insert into docente(matricola,dipartimento,nome,cognome,data_nascita,codice_fiscale)
	values(734987,'ICD','Miguel','Ceriani','1974-01-5','CRNMGL74A05L049W');
    
insert into docente(matricola,dipartimento,nome,cognome,data_nascita,codice_fiscale)
	values(547123,'ICD','Enrichetta','Gentile','1954-03-12','GNTNCH54C12A662R');

/* INSERIMENTO MODULI */

insert into modulo(codice,nome,cfu)
	values('001','Programmazione',12);

insert into modulo(codice,nome,cfu)
	values('002','Architettura degli Elaboratori',9);
    
insert into modulo(codice,nome,cfu)
	values('003','Analisi Matematica',9);
    
insert into modulo(codice,nome,cfu)
	values('004','Linguaggi di Programmazione',9);
    
insert into modulo(codice,nome,cfu)
	values('005','Matematica Discreta',9);
    
insert into modulo(codice,nome,cfu)
	values('006','Laboratorio di Informatica',6);
    
insert into modulo(codice,nome,cfu)
	values('007','Basi di Dati',9);
    
insert into modulo(codice,nome,cfu)
	values('008','Fondamenti di Informatica',6);

/* INSERIMENTO ESAMI */

insert into esame(matricola_studente,codice_modulo,matricola_docente,data_esame,voto)
	values(697768,'001',573987,'2019-01-23',28);
    
insert into esame(matricola_studente,codice_modulo,matricola_docente,data_esame,voto)
	values(697768,'002',672987,'2019-02-05',22);

insert into esame(matricola_studente,codice_modulo,matricola_docente,data_esame,voto)
	values(697768,'003',176845,'2019-01-31',25);
    
insert into esame(matricola_studente,codice_modulo,matricola_docente,data_esame,voto)
	values(697768,'004',287698,'2019-06-06',25);
    
insert into esame(matricola_studente,codice_modulo,matricola_docente,data_esame,voto)
	values(697768,'005',397546,'2019-06-05',30);
    
insert into esame(matricola_studente,codice_modulo,matricola_docente,data_esame,voto)
	values(697768,'006',674123,'2019-06-20',27);
    
insert into esame(matricola_studente,codice_modulo,matricola_docente,data_esame,voto)
	values(123456,'005',397546,'2019-06-05',30);
    
insert into esame(matricola_studente,codice_modulo,matricola_docente,data_esame,voto)
	values(423712,'005',397546,'2019-06-05',23);
    
insert into esame(matricola_studente,codice_modulo,matricola_docente,data_esame,voto)
	values(423712,'001',573987,'2019-01-23',25);
    
insert into esame(matricola_studente,codice_modulo,matricola_docente,data_esame,voto)
	values(123456,'007',734987,'2020-06-23',30);
    
insert into esame(matricola_studente,codice_modulo,matricola_docente,data_esame,voto)
	values(697768,'007',734987,'2020-06-23',28);
    
insert into esame(matricola_studente,codice_modulo,matricola_docente,data_esame,voto)
	values(423712,'007',734987,'2020-06-23',25);
    
insert into esame(matricola_studente,codice_modulo,matricola_docente,data_esame,voto)
	values(955877,'005',573987,'2019-01-23',24);
    
insert into esame(matricola_studente,codice_modulo,matricola_docente,data_esame,voto)
	values(123456,'002',672987,'2019-02-05',30);

insert into esame(matricola_studente,codice_modulo,matricola_docente,data_esame,voto)
	values(123456,'004',287698,'2019-06-06',30);
    
insert into esame(matricola_studente,codice_modulo,matricola_docente,data_esame,voto)
	values(123456,'003',176845,'2019-01-31',30);
    
insert into esame(matricola_studente,codice_modulo,matricola_docente,data_esame,voto)
	values(697768,'008',547123,'2020-01-21',30);

insert into esame(matricola_studente,codice_modulo,matricola_docente,data_esame,voto)
	values(423712,'008',547123,'2020-01-21',18);
    
/* INSERIMENTO SEDI */

insert into sede(codice,indirizzo,citta)
	values('123A','Viale del lavoro','Taranto');
    
insert into sede(codice,indirizzo,citta)
	values('456A','Viale Ionio','Bari');

insert into sede(codice,indirizzo,citta)
	values('789A','Corso Umberto','Bari');
    
insert into sede(codice,indirizzo,citta)
	values('123B','Corso Italia','Taranto');
    
insert into sede(codice,indirizzo,citta)
	values('456B','Via Dante','Brindisi');
    
insert into sede(codice,indirizzo,citta)
	values('789B','Via Campania','Barletta');
    
insert into sede(codice,indirizzo,citta)
	values('456Z','Via Polibio','Brindisi');
    
/* INSERIMENTO SEDI DIPARTIMENTI */

insert into sede_dipartimento(codice_sede,codice_dipartimento)
	values('123A','MAT');
    
insert into sede_dipartimento(codice_sede,codice_dipartimento)
	values('456A','ICD');
    
insert into sede_dipartimento(codice_sede,codice_dipartimento)
	values('789A','CHI');
    
insert into sede_dipartimento(codice_sede,codice_dipartimento)
	values('123B','ICD');
    
insert into sede_dipartimento(codice_sede,codice_dipartimento)
	values('456B','FIS');
    
 insert into sede_dipartimento(codice_sede,codice_dipartimento)
	values('456Z','CHI');
    
/* QUERY DI ESERCITAZIONE */
    
/* 1. Mostrare nome e descrizione di tutti i moduli da 9 CFU
SELECT nome, descrizione
FROM modulo
WHERE cfu = 9 */

/* 2. Mostrare matricola, nome e cognome dei docenti che hanno più di 60 anni
SELECT matricola, nome, cognome
FROM docente
WHERE data_nascita < '1959-01-01' */

/* 3. Mostrare nome, cognome e nome del dipartimento di ogni docente, ordinati dal più giovane al più anziano
SELECT docente.nome, docente.cognome, D.nome as NomeDipartimento
FROM docente JOIN dipartimento D ON docente.dipartimento = D.codice
ORDER BY docente.data_nascita */

/* 4. Mostrare citta e indirizzo di ogni sede del dipartimento con codice "ICD"
SELECT citta, indirizzo
FROM sede JOIN sede_dipartimento ON sede.codice = codice_sede
WHERE codice_dipartimento = 'ICD' */

/* Query n. 4 con operatore IN */

/* SELECT citta, indirizzo
FROM sede
WHERE codice IN ( SELECT codice_sede
			      FROM sede_dipartimento
                  WHERE codice_dipartimento = 'ICD' ) */
                  
/* Query n. 4 con operatore EXISTS */

/* SELECT citta, indirizzo
FROM sede
WHERE EXISTS ( SELECT *
			   FROM sede_dipartimento
               WHERE codice_dipartimento = 'ICD' AND codice_sede = sede.codice ) */

/* 5. Mostrare nome del dipartimento, città e indirizzo di ogni sede di ogni dipartimento, ordinate alfabeticamente prima per
nome dipartimento, poi per nome città e infine per indirizzo
SELECT dipartimento.nome AS NomeDipartimento, citta, indirizzo
FROM sede_dipartimento JOIN dipartimento ON dipartimento.codice = codice_dipartimento JOIN sede ON sede.codice = codice_sede
ORDER BY dipartimento.nome */

/* 6. Mostrare il nome di ogni dipartimento che ha una sede a Bari
SELECT dipartimento.nome AS NomeDipartimento
FROM sede JOIN sede_dipartimento ON codice_sede = sede.codice JOIN dipartimento ON dipartimento.codice = codice_dipartimento
WHERE citta = 'Bari' */

/* 7. Mostrare il nome di ogni dipartimento che non ha una sede a Brindisi
SELECT DISTINCT dipartimento.nome AS NomeDipartimento
FROM sede JOIN sede_dipartimento ON codice_sede = sede.codice JOIN dipartimento ON dipartimento.codice = codice_dipartimento
WHERE citta != 'Brindisi' */

/* 8. Mostrare media, numero esami sostenuti e totale CFU acquisiti dello studente con matricola 697768
SELECT AVG(voto) AS MediaVoti, SUM(cfu) AS TotCFU, count(*) AS NumEsamiSostenuti
FROM esame JOIN modulo ON codice_modulo = modulo.codice
WHERE matricola_studente = 697768 */

/* 9. Mostrare nome, cognome, nome del corso di laurea, media e numero esami sostenuti dello studente con matricola 697768
SELECT studente.nome, studente.cognome, corso_di_laurea.nome_corso_laurea, AVG(voto) AS MediaVoti, count(*) AS NumEsamiSuperati
FROM studente JOIN esame ON studente.matricola = matricola_studente JOIN corso_di_laurea ON codice_corso_laurea = studente.corso_laurea
WHERE matricola_studente = 697768
GROUP BY matricola_studente */

/* 10. Mostrare codice, nome e voto medio di ogni modulo, ordinati dalla media più alta alla più bassa
SELECT codice_modulo, modulo.nome, AVG(voto) AS MediaPerModulo
FROM modulo JOIN esame ON modulo.codice = codice_modulo
GROUP BY codice_modulo
ORDER BY MediaPerModulo DESC */

/* 11. Mostrare nome e cognome del docente, nome e descrizione del modulo per ogni docente ed ogni modulo di
   cui quel docente abbia tenuto almeno un esame; il risultato deve includere anche i docenti che non abbiano
   tenuto alcun esame, in quel caso rappresentati con un'unica tupla in cui nome e descrizione del modulo
   avranno valore NULL
SELECT DISTINCT docente.nome NomeDocente, docente.cognome CognomeDocente, modulo.nome NomeModulo, modulo.descrizione DescrizioneModulo
FROM modulo RIGHT JOIN esame ON modulo.codice = esame.codice_modulo RIGHT JOIN docente ON esame.matricola_docente = docente.matricola
WHERE docente.matricola IN ( SELECT esame.matricola_docente
	                     FROM esame ) OR docente.matricola NOT IN ( SELECT esame.matricola_docente
									FROM esame ) */
   
/* 12. Mostrare matricola, nome, cognome, data di nascita, media e numero esami sostenuti di ogni studente
SELECT studente.matricola, studente.nome, studente.cognome, studente.data_nascita, AVG(voto) AS MediaVoti, COUNT(*) AS NumEsamiSostenuti
FROM studente JOIN esame ON studente.matricola = esame.matricola_studente
GROUP BY studente.matricola */

/* 13. Mostrare matricola, nome, cognome, data di nascita, media e numero esami sostenuti di ogni studente del corso
   di laurea di codice "ICD" che abbia media maggiore di 24
SELECT studente.matricola, studente.nome, studente.cognome, studente.data_nascita, AVG(voto) AS MediaVoti, COUNT(*) AS NumEsamiSostenuti
FROM studente JOIN esame ON studente.matricola = esame.matricola_studente
GROUP BY studente.matricola
HAVING(MediaVoti > 24) */
 
/* 14. Mostrare nome, cognome e data di nascita di tutti gli studenti che ancora non hanno superato nessun esame
SELECT studente.nome, studente.cognome, studente.data_nascita
FROM studente
WHERE studente.matricola NOT IN ( SELECT matricola_studente
			          FROM esame ) */

/* 15. Mostrare la matricola di tutti gli studenti che hanno superato almeno un esame e che hanno preso sempre voti maggiori di 26
SELECT S.matricola
FROM studente S
WHERE S.matricola IN ( SELECT matricola_studente
		       FROM esame ) AND NOT EXISTS ( SELECT *
		                                     FROM studente T JOIN esame ON T.matricola = esame.matricola_studente
                                                     WHERE S.matricola = T.matricola AND voto < 26 ) */

/* 16. Mostrare, per ogni modulo, il numero degli studenti che hanno preso tra 18 e 21, quelli che hanno preso tra 22
    e 26 e quelli che hanno preso tra 27 e 30 (con un'unica interrogazione)
SELECT modulo.codice, modulo.nome,
(SELECT count(*) FROM esame WHERE (esame.codice_modulo = modulo.codice AND (voto >= 18 AND voto <= 21))) AS Conteggio_18_21,
(SELECT count(*) FROM esame WHERE (esame.codice_modulo = modulo.codice AND (voto >= 22 AND voto <= 26))) AS Conteggio_22_26,
(SELECT count(*) FROM esame WHERE (esame.codice_modulo = modulo.codice AND (voto >= 27 AND voto <= 30))) AS Conteggio_27_30
FROM esame JOIN modulo ON esame.codice_modulo = modulo.codice
GROUP BY modulo.codice; */

/* 17. Mostrare matricola, nome, cognome e voto di ogni studente che ha preso un voto maggiore della media nel modulo "BDD"
SELECT studente.matricola, studente.nome, studente.cognome, voto, codice_modulo
FROM studente JOIN esame ON studente.matricola = esame.matricola_studente
WHERE codice_modulo = '007' AND voto >= ( SELECT AVG(voto) AS MediaVotiBDD
					  FROM esame
                                          WHERE codice_modulo = '007' ) */                    
									
/* 18. Mostrare matricola, nome, cognome di ogni studente che ha preso ad almeno 3 esami un voto maggiore della media per quel modulo
SELECT esame.matricola_studente, studente.nome, studente.cognome, COUNT(*) AS EsamiOltreMedia
FROM esame JOIN modulo M ON esame.codice_modulo = M.codice JOIN studente ON studente.matricola = esame.matricola_studente
WHERE voto > ( SELECT AVG(voto)
	       FROM esame JOIN modulo N ON esame.codice_modulo = N.codice
               WHERE M.codice = N.codice )
GROUP BY esame.matricola_studente
HAVING(EsamiOltreMedia >= 3) */
