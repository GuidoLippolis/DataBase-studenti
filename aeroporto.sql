drop database if exists aeroporto;
create database aeroporto;
use aeroporto;

create table if not exists aeroporto (
    citta varchar(15),
    nazione varchar(15) not null,
    numPiste numeric(2),
    primary key (citta)
);

create table if not exists volo (
	idVolo char(5),
    giornoSett varchar(10),
    cittaPart varchar(10) not null,
    oraPart numeric(2) not null,
    cittaArr varchar(10) not null,
    oraArr numeric(2) not null,
    tipoAereo varchar(10) not null,
    primary key (idVolo, giornoSett)
    /* foreign key (tipoAereo) references aereo(tipoAereo) DOMANDA: perché non funziona il vincolo? */
);

create table if not exists aereo (
    tipoAereo varchar(10),
    numPasseggeri numeric(2),
    qtaMerci numeric(3) not null,
    primary key (tipoAereo)
);

insert into aeroporto(citta,nazione,numPiste)
	values('Taranto','Italia',20);
    
insert into aeroporto(citta,nazione,numPiste)
	values('Roma','Italia',40);
    
insert into aeroporto(citta,nazione)
	values('Milano','Italia');
    
insert into aeroporto(citta,nazione)
	values('Bologna','Italia');
    
insert into aeroporto(citta,nazione,numPiste)
	values('Berlino','Germania',25);
    
insert into aeroporto(citta,nazione,numPiste)
	values('Parigi','Francia',60);
    
insert into volo(idVolo,giornoSett,cittaPart,oraPart,cittaArr,oraArr,tipoAereo)
	values('AB123','Lunedi','Taranto',10,'Bologna',12,'Linea');
    
insert into volo(idVolo,giornoSett,cittaPart,oraPart,cittaArr,oraArr,tipoAereo)
	values('AB456','Martedi','Bologna',14,'Berlino',16,'Turbojet');
    
insert into volo(idVolo,giornoSett,cittaPart,oraPart,cittaArr,oraArr,tipoAereo)
	values('AB789','Mercoledi','Roma',11,'Bologna',13,'Regionale');
    
insert into volo(idVolo,giornoSett,cittaPart,oraPart,cittaArr,oraArr,tipoAereo)
	values('BC123','Giovedi','Berlino',17,'Bologna',19,'Linea');
    
insert into volo(idVolo,giornoSett,cittaPart,oraPart,cittaArr,oraArr,tipoAereo)
	values('BC456','Venerdi','Taranto',12,'Bari',14,'Boeing');
    
insert into aereo(tipoAereo,numPasseggeri,qtaMerci)
	values('Linea',50,350);
    
insert into aereo(tipoAereo,numPasseggeri,qtaMerci)
	values('Turbojet',70,450);
    
insert into aereo(tipoAereo,numPasseggeri,qtaMerci)
	values('Boeing',65,600);
    
insert into aereo(tipoAereo,numPasseggeri,qtaMerci)
	values('Regionale',80,450);
    
/*
Trovare le città con un aeroporto di cui non è noto il numero di piste
SELECT *
FROM aeroporto
WHERE numPiste is null */

/*
Trovare le nazioni da cui parte e arriva un volo con codice BC123
SELECT nazione
FROM aeroporto JOIN volo P ON citta = P.cittaPart JOIN volo A ON citta = A.cittaArr
WHERE A.idVolo = 'BC123'*/

/*
Trovare i tipi di aereo usati nei voli che partono da Bologna
SELECT tipoAereo
FROM volo
WHERE cittaPart = 'Bologna'*/

/*
Trovare i tipi di aereo e il corrispondente numero di passeggeri per i tipi di aereo usati nei voli che partono da Taranto
SELECT volo.tipoAereo, aereo.numPasseggeri
FROM volo JOIN aereo ON volo.tipoAereo = aereo.tipoAereo
WHERE cittaPart = 'Taranto'*/

/*
Trovare le città da cui partono voli diretti a Bologna, ordinate alfabeticamente
SELECT cittaPart
FROM volo
WHERE cittaArr = 'Bologna'
order by cittaPart*/

/* DOMANDA: come trovo i voli internazionali? */
