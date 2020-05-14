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
    corso_laurea varchar(15) not null,
    nome varchar(15) not null,
    cognome varchar(15) not null,
    data_nascita date not null,
    codice_fiscale char(16) unique check(length(codice_fiscale) = 16),
    primary key(matricola)
    /* foreign key (corso_laurea) references corso_di_laurea(nome_corso_laurea)
    vincolo non funzionante */
);

create table if not exists dipartimento (
    codice char(4) check(length(codice) = 4),
    nome varchar(15) not null,
    primary key (codice)
);

create table if not exists docente (
    matricola numeric(6) check(matricola > 0),
    dipartimento varchar(15) not null,
    nome varchar(15) not null,
    cognome varchar(15) not null,
    data_nascita date not null,
    codice_fiscale char(16) unique check(length(codice_fiscale) = 16),
    primary key(matricola)
    /* foreign key (dipartimento) references dipartimento(nome)
       Anche qui il vincolo NON funziona: FAILED TO OPEN THE REFERENCED TABLE 'DIPARTIMENTO' */
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
    /* Qui i vincoli funzionano: se provo a registrare un esame di una matricola non presente in STUDENTI dà errore */
);

create table if not exists sede (
    codice char(4) check(length(codice) = 4),
    indirizzo varchar(20) not null,
    citta varchar(10) not null,
    primary key (codice)
);

create table if not exists sede_dipartimento (
    codice_sede char(4) check(length(codice_sede) = 4),
    codice_dipartimento char(4) check(length(codice_dipartimento) = 4),
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
	values(697768,'Informatica','Guido','Lippolis','2000-02-20','LPPGDU00B20L049S');

insert into studente(matricola,corso_laurea,nome,cognome,data_nascita,codice_fiscale)
	values(123456,'Informatica','Flavio','Collocola','1999-06-28','CLLFLV99H28L049Z');
    
insert into studente(matricola,corso_laurea,nome,cognome,data_nascita,codice_fiscale)
	values('453675','Informatica','Pierpaolo','Mariani','1998-08-5','MRNPPL98M05L049Z');
    
insert into studente(matricola,corso_laurea,nome,cognome,data_nascita,codice_fiscale)
	values('427684','Informatica','Andrea','Costantini','1999-12-28','CSTNDR99T28E506P');

insert into studente(matricola,corso_laurea,nome,cognome,data_nascita,codice_fiscale)
	values('561769','Informatica','Claudio','Minardi','1999-09-26','MNRCLD99P26L049F');
   
insert into studente(matricola,corso_laurea,nome,cognome,data_nascita,codice_fiscale)
	values('187945','Informatica','Luca','Fabbiano','1999-11-22','FBBLCU99S22L049G');
    
insert into studente(matricola,corso_laurea,nome,cognome,data_nascita,codice_fiscale)
	values('423712','Informatica','Francesco','Scarci','2000-02-23','SCRFNC00B23L049S');
    
insert into studente(matricola,corso_laurea,nome,cognome,data_nascita,codice_fiscale)
	values('285634','Informatica','Simone','Marchitelli','1999-06-21','MRCSMN99H21F205F');
    
insert into studente(matricola,corso_laurea,nome,cognome,data_nascita,codice_fiscale)
	values('955877','Informatica','Gianluca','Fornaro','1998-08-20','FRNGLC98M21L049S');
    
/* INSERIMENTO DIPARTIMENTI */

insert into dipartimento(codice,nome)
	values('A123','Informatica'); 
    
insert into dipartimento(codice,nome)
	values('A456','Matematica'); 
    
insert into dipartimento(codice,nome)
	values('A789','Giurisprudenza'); 
    
insert into dipartimento(codice,nome)
	values('B123','Fisica'); 
    
insert into dipartimento(codice,nome)
	values('B456','Chimica'); 
    
/* INSERIMENTO DOCENTI */
   
insert into docente(matricola,dipartimento,nome,cognome,data_nascita,codice_fiscale)
	values(573987,'Informatica','Carmelo','Ardito','1975-07-15','RDTCML75L15A662S');
    
insert into docente(matricola,dipartimento,nome,cognome,data_nascita,codice_fiscale)
	values(672987,'Informatica','Ciro','Castiello','1976-09-23','CSTCRI76P23A662M');
    
insert into docente(matricola,dipartimento,nome,cognome,data_nascita,codice_fiscale)
	values(176845,'Matematica','Genni','Fragnelli','1974-05-20','FRGGNN74E20G478C');
    
insert into docente(matricola,dipartimento,nome,cognome,data_nascita,codice_fiscale)
	values(287698,'Informatica','Marco','De Gemmis','1974-06-20','DGMMRC74H20A662Q');

insert into docente(matricola,dipartimento,nome,cognome,data_nascita,codice_fiscale)
	values(397546,'Matematica','Michele','Fiorentino','1980-02-10','FRNMHL80B10A662H');
    
insert into docente(matricola,dipartimento,nome,cognome,data_nascita,codice_fiscale)
	values(674123,'Informatica','Fedelucio','Narducci','1979-04-20','NRDFLC79D20A662N');

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
    
/* INSERIMENTO SEDI */

insert into sede(codice,indirizzo,citta)
	values('123A','Viale del lavoro','Taranto');
    
insert into sede(codice,indirizzo,citta)
	values('456A','Viale Ionio','Taranto');

insert into sede(codice,indirizzo,citta)
	values('789A','Corso Umberto','Taranto');
    
insert into sede(codice,indirizzo,citta)
	values('123B','Corso Italia','Taranto');
    
insert into sede(codice,indirizzo,citta)
	values('456B','Via Dante','Taranto');
    
insert into sede(codice,indirizzo,citta)
	values('789B','Via Campania','Taranto');
    
/* INSERIMENTO SEDI DIPARTIMENTI */

insert into sede_dipartimento(codice_sede,codice_dipartimento)
	values('123A','A456');
    
insert into sede_dipartimento(codice_sede,codice_dipartimento)
	values('456A','A123');
    
insert into sede_dipartimento(codice_sede,codice_dipartimento)
	values('789A','A789');
    
insert into sede_dipartimento(codice_sede,codice_dipartimento)
	values('123B','B456');
    
insert into sede_dipartimento(codice_sede,codice_dipartimento)
	values('456B','B123');
