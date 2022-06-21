-- *********************************************
-- * Standard SQL generation                   
-- *--------------------------------------------
-- * DB-MAIN version: 11.0.2              
-- * Generator date: Sep 14 2021              
-- * Generation date: Sun Jun 12 15:05:26 2022 
-- * LUN file: C:\Users\sarac\Desktop\Programmazione\DataBase\Progetto\PROJECT.lun 
-- * Schema: Skate School/1 
-- ********************************************* 


-- Database Section
-- ________________ 

use SkateSchool;


-- DBSpace Section
-- _______________


-- Tables Section
-- _____________ 

create table Attrezzatura (
     CodiceAttrezzatura int not null identity,
     CodiceSede int not null,
     Descrizione varchar(200) not null,
     constraint ID_ATTREZZATURA_ID primary key (CodiceAttrezzatura));

create table CentroEstivo (
     CodiceCentroEstivo int not null identity,
     DataInizio date not null,
     DataFine date not null,
     Descrizione varchar(200) not null,
     constraint ID_CENTROESTIVO_ID primary key (CodiceCentroEstivo));

create table Corso (
     CodiceCorso int not null identity,
     Descrizione varchar(200) not null,
     Livello varchar(20) not null,
     CodiceSede int not null,
     constraint ID_CORSO_ID primary key (CodiceCorso));

create table Gara (
     CodiceGara int not null identity,
     Data datetime2 not null,
     Citta varchar(30) not null,
     Categoria varchar(30) not null,
     Descrizione varchar(200) not null,
     constraint ID_GARA_ID primary key (CodiceGara));

create table Insegnamento (
     CodiceIstruttore int not null,
     CodiceSede int not null,
     constraint ID_insegnamento_ID primary key (CodiceSede, CodiceIstruttore));

create table Iscritto (
     CodiceIscritto int not null identity,
     Nome varchar(30) not null,
     Cognome varchar(30) not null,
     Eta int not null,
     Telefono varchar(20) not null,
     Livello varchar(20) not null,
     constraint FKPER_ISC_ID primary key (CodiceIscritto));

create table Iscrizione (
     CodiceIscritto int not null,
     CodiceLezione int not null,
     constraint ID_partecipazione_ID primary key (CodiceLezione, CodiceIscritto));

create table IscrizioneCentroEstivo (
     CodiceCentroEstivo int not null,
     CodiceIscritto int not null,
     constraint ID_attivita_ID primary key (CodiceIscritto, CodiceCentroEstivo));

create table IscrizioneGara (
     CodiceGara int not null,
     CodiceIscritto int not null,
     constraint ID_iscrizione_ID primary key (CodiceIscritto, CodiceGara));

create table Istruttore (
     CodiceIstruttore int not null identity,
     Nome varchar(30) not null,
     Cognome varchar(30) not null,
     Eta int not null,
     Telefono varchar(20) not null,
     constraint FKPER_IST_ID primary key (CodiceIstruttore));

create table Lezione (
     CodiceLezione int not null identity,
     CodiceIstruttore int not null,
     CodiceCorso int not null,
     MassimoPartecipanti int not null,
     Data datetime2 not null,
     constraint ID_LEZIONE_ID primary key (CodiceLezione),
     constraint SID_LEZIONE_ID unique (CodiceIstruttore, CodiceCorso));

create table LezionePrivata (
     CodiceIstruttore int not null,
     Data datetime2 not null,
     CodiceSede int not null,
     CodiceIscritto int not null,
     constraint ID_LEZIONE_PRIVATA_ID primary key (CodiceIstruttore, Data));

create table Oggetto (
     CodiceOggetto int not null identity,
     Quantita int not null,
     Prezzo real not null,
     Descrizione varchar(200) not null,
     CodiceSede int not null,
     CodiceTipo int not null,
     constraint IDOGGETTO primary key (CodiceOggetto));

create table Pagamento (
     CodicePagamento int not null identity,
     NumeroLezioniRimaste int not null,
     Data datetime2 not null,
     CodiceIscritto int not null,
     CodiceTariffario int not null,
     constraint ID_PAGAMENTO_ID primary key (CodicePagamento));

create table Prestito (
     CodiceIscritto int not null,
     CodiceAttrezzatura int not null,
     Data datetime2 not null,
     Restituito bit not null,
     constraint ID_PRESTITO_ID primary key (CodiceAttrezzatura, CodiceIscritto, Data));

create table Sede (
     CodiceSede int not null identity,
     Citta varchar(30) not null,
     SkatePark varchar(30) not null,
     constraint ID_SEDE_ID primary key (CodiceSede));

create table Tariffario (
     CodiceTariffario int not null identity,
     NumeroLezioni int not null,
     Prezzo real not null,
     Privata bit not null,
     constraint ID_TARIFFARIO_ID primary key (CodiceTariffario));

create table TipologiaOggetto (
     CodiceTipo int not null identity,
     Nome varchar(30) not null,
     constraint ID_TIPOLOGIA_OGGETTO_ID primary key (CodiceTipo));

create table TutoraggioCentroEstivo (
     CodiceIstruttore int not null,
     CodiceCentroEstivo int not null,
     constraint ID_tutoraggio_ID primary key (CodiceCentroEstivo, CodiceIstruttore));

create table Vendita (
     CodiceVendita int not null identity,
     CodiceOggetto int not null,
     Quantita int not null,
     Data datetime2 not null,
     constraint ID_VENDITA_ID primary key (CodiceVendita));


-- Constraints Section
-- ___________________ 

alter table Attrezzatura add constraint FKpossiede_FK
     foreign key (CodiceSede)
     references Sede;

alter table Corso add constraint FKospita_FK
     foreign key (CodiceSede)
     references Sede;

alter table Insegnamento add constraint FKins_SED
     foreign key (CodiceSede)
     references Sede;

alter table Insegnamento add constraint FKins_IST_FK
     foreign key (CodiceIstruttore)
     references Istruttore;

alter table Iscrizione add constraint FKpar_LEZ
     foreign key (CodiceLezione)
     references Lezione;

alter table Iscrizione add constraint FKpar_ISC_FK
     foreign key (CodiceIscritto)
     references Iscritto;

alter table IscrizioneCentroEstivo add constraint FKatt_ISC
     foreign key (CodiceIscritto)
     references Iscritto;

alter table IscrizioneCentroEstivo add constraint FKatt_CEN_FK
     foreign key (CodiceCentroEstivo)
     references CentroEstivo;

alter table IscrizioneGara add constraint FKisc_ISC
     foreign key (CodiceIscritto)
     references Iscritto;

alter table IscrizioneGara add constraint FKisc_GAR_FK
     foreign key (CodiceGara)
     references Gara;

alter table Lezione add constraint FKgestione
     foreign key (CodiceIstruttore)
     references Istruttore;

alter table Lezione add constraint FKappartiene_FK
     foreign key (CodiceCorso)
     references Corso;

alter table LezionePrivata add constraint FKluogo_FK
     foreign key (CodiceSede)
     references Sede;

alter table LezionePrivata add constraint FKsostiene_FK
     foreign key (CodiceIscritto)
     references Iscritto;

alter table LezionePrivata add constraint FKpresiede
     foreign key (CodiceIstruttore)
     references Istruttore;

alter table Oggetto add constraint FKvendita_FK
     foreign key (CodiceSede)
     references Sede;

alter table Oggetto add constraint FKappartenenza_FK
     foreign key (CodiceTipo)
     references TipologiaOggetto;

alter table Pagamento add constraint FKeffettuato_FK
     foreign key (CodiceIscritto)
     references Iscritto;

alter table Pagamento add constraint FKcomprende_FK
     foreign key (CodiceTariffario)
     references Tariffario;

alter table Prestito add constraint FKprestito
     foreign key (CodiceAttrezzatura)
     references Attrezzatura;

alter table Prestito add constraint FKprende_FK
     foreign key (CodiceIscritto)
     references Iscritto;

alter table TutoraggioCentroEstivo add constraint FKtut_CEN
     foreign key (CodiceCentroEstivo)
     references CentroEstivo;

alter table TutoraggioCentroEstivo add constraint FKtut_IST_FK
     foreign key (CodiceIstruttore)
     references Istruttore;

alter table Vendita add constraint FKR
     foreign key (CodiceOggetto)
     references Oggetto;


-- Index Section
-- _____________ 

create unique index ID_ATTREZZATURA_IND
     on Attrezzatura (CodiceAttrezzatura);

create index FKpossiede_IND
     on Attrezzatura (CodiceSede);

create unique index ID_CENTROESTIVO_IND
     on CentroEstivo (CodiceCentroEstivo);

create unique index ID_CORSO_IND
     on Corso (CodiceCorso);

create index FKospita_IND
     on Corso (CodiceSede);

create unique index ID_GARA_IND
     on Gara (CodiceGara);

create unique index ID_insegnamento_IND
     on Insegnamento (CodiceSede, CodiceIstruttore);

create index FKins_IST_IND
     on Insegnamento (CodiceIstruttore);

create unique index FKPER_ISC_IND
     on Iscritto (CodiceIscritto);

create unique index ID_partecipazione_IND
     on Iscrizione (CodiceLezione, CodiceIscritto);

create index FKpar_ISC_IND
     on Iscrizione (CodiceIscritto);

create unique index ID_attivita_IND
     on IscrizioneCentroEstivo (CodiceIscritto, CodiceCentroEstivo);

create index FKatt_CEN_IND
     on IscrizioneCentroEstivo (CodiceCentroEstivo);

create unique index ID_iscrizione_IND
     on IscrizioneGara (CodiceIscritto, CodiceGara);

create index FKisc_GAR_IND
     on IscrizioneGara (CodiceGara);

create unique index FKPER_IST_IND
     on Istruttore (CodiceIstruttore);

create unique index ID_LEZIONE_IND
     on Lezione (CodiceLezione);

create unique index SID_LEZIONE_IND
     on Lezione (CodiceIstruttore, CodiceCorso);

create index FKappartiene_IND
     on Lezione (CodiceCorso);

create unique index ID_LEZIONE_PRIVATA_IND
     on LezionePrivata (CodiceIstruttore, Data);

create index FKluogo_IND
     on LezionePrivata (CodiceSede);

create index FKsostiene_IND
     on LezionePrivata (CodiceIscritto);

create index FKvendita_IND
     on Oggetto (CodiceSede);

create index FKappartenenza_IND
     on Oggetto (CodiceTipo);

create unique index ID_PAGAMENTO_IND
     on Pagamento (CodicePagamento);

create index FKeffettuato_IND
     on Pagamento (CodiceIscritto);

create index FKcomprende_IND
     on Pagamento (CodiceTariffario);

create unique index ID_PRESTITO_IND
     on Prestito (CodiceAttrezzatura, CodiceIscritto, Data);

create index FKprende_IND
     on Prestito (CodiceIscritto);

create unique index ID_SEDE_IND
     on Sede (CodiceSede);

create unique index ID_TARIFFARIO_IND
     on Tariffario (CodiceTariffario);

create unique index ID_TIPOLOGIA_OGGETTO_IND
     on TipologiaOggetto (CodiceTipo);

create unique index ID_tutoraggio_IND
     on TutoraggioCentroEstivo (CodiceCentroEstivo, CodiceIstruttore);

create index FKtut_IST_IND
     on TutoraggioCentroEstivo (CodiceIstruttore);

create unique index ID_VENDITA_IND
     on Vendita (CodiceVendita);
