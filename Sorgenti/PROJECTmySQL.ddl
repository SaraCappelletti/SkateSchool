-- *********************************************
-- * SQL MySQL generation                      
-- *--------------------------------------------
-- * DB-MAIN version: 11.0.2              
-- * Generator date: Sep 14 2021              
-- * Generation date: Sun Jun 12 16:09:55 2022 
-- * LUN file: C:\Users\sarac\Desktop\Programmazione\DataBase\Progetto\PROJECT.lun 
-- * Schema: SkateSchool/1 
-- ********************************************* 


-- Database Section
-- ________________ 

create database SkateSchool;
use SkateSchool;


-- Tables Section
-- _____________ 

create table ATTREZZATURE (
     CodiceAttrezzo int not null,
     CodiceSede int not null,
     Descrizione varchar(1) not null,
     constraint ID_ATTREZZATURA_ID primary key (CodiceAttrezzo));

create table CENTRI_ESTIVI (
     CodiceCentroEstivo int not null,
     DataInizio date not null,
     DataFine date not null,
     Descrizione varchar(1) not null,
     constraint ID_CENTROESTIVO_ID primary key (CodiceCentroEstivo));

create table CORSI (
     CodiceCorso int not null,
     Descrizione varchar(1) not null,
     Livello varchar(1) not null,
     CodiceSede int not null,
     constraint ID_CORSO_ID primary key (CodiceCorso));

create table GARE (
     CodiceGara int not null,
     Data char(1) not null,
     Città char(1) not null,
     Categoria char(1) not null,
     Descrizione char(1) not null,
     constraint ID_GARA_ID primary key (CodiceGara));

create table INSEGNAMENTI (
     CodiceIstruttore int not null,
     CodiceSede int not null,
     constraint ID_insegnamento_ID primary key (CodiceSede, CodiceIstruttore));

create table ISCRITTI (
     CodiceIscritto int not null,
     Nome varchar(1) not null,
     Cognome varchar(1) not null,
     Eta int not null,
     Telefono int not null,
     Livello varchar(1) not null,
     constraint FKPER_ISC_ID primary key (CodiceIscritto));

create table ISCRIZIONI (
     CodiceIscritto int not null,
     CodiceLezione int not null,
     constraint ID_partecipazione_ID primary key (CodiceLezione, CodiceIscritto));

create table ISCRIZIONI_CENTRO_ESTIVO (
     CodiceCentroEstivo int not null,
     CodiceIscritto int not null,
     constraint ID_attivita_ID primary key (CodiceIscritto, CodiceCentroEstivo));

create table ISCRIZIONI_GARA (
     CodiceGara int not null,
     CodiceIscritto int not null,
     constraint ID_iscrizione_ID primary key (CodiceIscritto, CodiceGara));

create table ISTRUTTORI (
     CodiceIstruttore int not null,
     Nome varchar(1) not null,
     Cognome varchar(1) not null,
     Eta int not null,
     Telefono int not null,
     constraint FKPER_IST_ID primary key (CodiceIstruttore));

create table LEZIONI (
     CodiceLezione int not null,
     CodiceIstruttore int not null,
     CodiceCorso int not null,
     MassimoPartecipanti int not null,
     Data date not null,
     constraint ID_LEZIONE_ID primary key (CodiceLezione),
     constraint SID_LEZIONE_ID unique (CodiceIstruttore, CodiceCorso));

create table LEZIONI_PRIVATE (
     CodiceIstruttore int not null,
     Data date not null,
     CodiceSede int not null,
     CodiceIscritto int not null,
     constraint ID_LEZIONE_PRIVATA_ID primary key (CodiceIstruttore, Data));

create table OGGETTI (
     CodiceOggetto int not null,
     Quantita int not null,
     Prezzo float(1) not null,
     Descrizione varchar(1) not null,
     CodiceSede int not null,
     CodiceTipo int not null,
     constraint IDOGGETTO primary key (CodiceOggetto));

create table PAGAMENTI (
     CodicePagamento int not null,
     NumeroLezioniRimaste int not null,
     Data date not null,
     CodiceIscritto int not null,
     CodiceTariffario int not null,
     constraint ID_PAGAMENTO_ID primary key (CodicePagamento));

create table PRESTITI (
     CodiceIscritto int not null,
     CodiceAttrezzo int not null,
     Data date not null,
     Restituito char not null,
     constraint ID_PRESTITO_ID primary key (CodiceAttrezzo, CodiceIscritto, Data));

create table SEDI (
     CodiceSede int not null,
     Citta varchar(1) not null,
     SkatePark varchar(1) not null,
     constraint ID_SEDE_ID primary key (CodiceSede));

create table TARIFFARI (
     CodiceTariffario int not null,
     NumeroLezioni char(1) not null,
     Prezzo float(1) not null,
     constraint ID_TARIFFARIO_ID primary key (CodiceTariffario));

create table TIPOLOGIE_OGGETTO (
     CodiceTipo int not null,
     Nome varchar(1) not null,
     constraint ID_TIPOLOGIA_OGGETTO_ID primary key (CodiceTipo));

create table TUTORAGGI_CENTRO_ESTIVO (
     CodiceIstruttore int not null,
     CodiceCentroEstivo int not null,
     constraint ID_tutoraggio_ID primary key (CodiceCentroEstivo, CodiceIstruttore));

create table VENDITE (
     CodiceVendita int not null,
     CodiceOggetto int not null,
     Quantita int not null,
     Data date not null,
     constraint ID_VENDITA_ID primary key (CodiceVendita));


-- Constraints Section
-- ___________________ 

alter table ATTREZZATURE add constraint FKpossiede_FK
     foreign key (CodiceSede)
     references SEDI (CodiceSede);

alter table CORSI add constraint FKospita_FK
     foreign key (CodiceSede)
     references SEDI (CodiceSede);

alter table INSEGNAMENTI add constraint FKins_SED
     foreign key (CodiceSede)
     references SEDI (CodiceSede);

alter table INSEGNAMENTI add constraint FKins_IST_FK
     foreign key (CodiceIstruttore)
     references ISTRUTTORI (CodiceIstruttore);

alter table ISCRIZIONI add constraint FKpar_LEZ
     foreign key (CodiceLezione)
     references LEZIONI (CodiceLezione);

alter table ISCRIZIONI add constraint FKpar_ISC_FK
     foreign key (CodiceIscritto)
     references ISCRITTI (CodiceIscritto);

alter table ISCRIZIONI_CENTRO_ESTIVO add constraint FKatt_ISC
     foreign key (CodiceIscritto)
     references ISCRITTI (CodiceIscritto);

alter table ISCRIZIONI_CENTRO_ESTIVO add constraint FKatt_CEN_FK
     foreign key (CodiceCentroEstivo)
     references CENTRI_ESTIVI (CodiceCentroEstivo);

alter table ISCRIZIONI_GARA add constraint FKisc_ISC
     foreign key (CodiceIscritto)
     references ISCRITTI (CodiceIscritto);

alter table ISCRIZIONI_GARA add constraint FKisc_GAR_FK
     foreign key (CodiceGara)
     references GARE (CodiceGara);

alter table LEZIONI add constraint FKgestione
     foreign key (CodiceIstruttore)
     references ISTRUTTORI (CodiceIstruttore);

alter table LEZIONI add constraint FKappartiene_FK
     foreign key (CodiceCorso)
     references CORSI (CodiceCorso);

alter table LEZIONI_PRIVATE add constraint FKluogo_FK
     foreign key (CodiceSede)
     references SEDI (CodiceSede);

alter table LEZIONI_PRIVATE add constraint FKsostiene_FK
     foreign key (CodiceIscritto)
     references ISCRITTI (CodiceIscritto);

alter table LEZIONI_PRIVATE add constraint FKpresiede
     foreign key (CodiceIstruttore)
     references ISTRUTTORI (CodiceIstruttore);

alter table OGGETTI add constraint FKvendita_FK
     foreign key (CodiceSede)
     references SEDI (CodiceSede);

alter table OGGETTI add constraint FKappartenenza_FK
     foreign key (CodiceTipo)
     references TIPOLOGIE_OGGETTO (CodiceTipo);

alter table PAGAMENTI add constraint FKeffettuato_FK
     foreign key (CodiceIscritto)
     references ISCRITTI (CodiceIscritto);

alter table PAGAMENTI add constraint FKcomprende_FK
     foreign key (CodiceTariffario)
     references TARIFFARI (CodiceTariffario);

alter table PRESTITI add constraint FKprestito
     foreign key (CodiceAttrezzo)
     references ATTREZZATURE (CodiceAttrezzo);

alter table PRESTITI add constraint FKprende_FK
     foreign key (CodiceIscritto)
     references ISCRITTI (CodiceIscritto);

alter table TUTORAGGI_CENTRO_ESTIVO add constraint FKtut_CEN
     foreign key (CodiceCentroEstivo)
     references CENTRI_ESTIVI (CodiceCentroEstivo);

alter table TUTORAGGI_CENTRO_ESTIVO add constraint FKtut_IST_FK
     foreign key (CodiceIstruttore)
     references ISTRUTTORI (CodiceIstruttore);

alter table VENDITE add constraint FKR
     foreign key (CodiceOggetto)
     references OGGETTI (CodiceOggetto);


-- Index Section
-- _____________ 

create unique index ID_ATTREZZATURA_IND
     on ATTREZZATURE (CodiceAttrezzo);

create index FKpossiede_IND
     on ATTREZZATURE (CodiceSede);

create unique index ID_CENTROESTIVO_IND
     on CENTRI_ESTIVI (CodiceCentroEstivo);

create unique index ID_CORSO_IND
     on CORSI (CodiceCorso);

create index FKospita_IND
     on CORSI (CodiceSede);

create unique index ID_GARA_IND
     on GARE (CodiceGara);

create unique index ID_insegnamento_IND
     on INSEGNAMENTI (CodiceSede, CodiceIstruttore);

create index FKins_IST_IND
     on INSEGNAMENTI (CodiceIstruttore);

create unique index FKPER_ISC_IND
     on ISCRITTI (CodiceIscritto);

create unique index ID_partecipazione_IND
     on ISCRIZIONI (CodiceLezione, CodiceIscritto);

create index FKpar_ISC_IND
     on ISCRIZIONI (CodiceIscritto);

create unique index ID_attivita_IND
     on ISCRIZIONI_CENTRO_ESTIVO (CodiceIscritto, CodiceCentroEstivo);

create index FKatt_CEN_IND
     on ISCRIZIONI_CENTRO_ESTIVO (CodiceCentroEstivo);

create unique index ID_iscrizione_IND
     on ISCRIZIONI_GARA (CodiceIscritto, CodiceGara);

create index FKisc_GAR_IND
     on ISCRIZIONI_GARA (CodiceGara);

create unique index FKPER_IST_IND
     on ISTRUTTORI (CodiceIstruttore);

create unique index ID_LEZIONE_IND
     on LEZIONI (CodiceLezione);

create unique index SID_LEZIONE_IND
     on LEZIONI (CodiceIstruttore, CodiceCorso);

create index FKappartiene_IND
     on LEZIONI (CodiceCorso);

create unique index ID_LEZIONE_PRIVATA_IND
     on LEZIONI_PRIVATE (CodiceIstruttore, Data);

create index FKluogo_IND
     on LEZIONI_PRIVATE (CodiceSede);

create index FKsostiene_IND
     on LEZIONI_PRIVATE (CodiceIscritto);

create index FKvendita_IND
     on OGGETTI (CodiceSede);

create index FKappartenenza_IND
     on OGGETTI (CodiceTipo);

create unique index ID_PAGAMENTO_IND
     on PAGAMENTI (CodicePagamento);

create index FKeffettuato_IND
     on PAGAMENTI (CodiceIscritto);

create index FKcomprende_IND
     on PAGAMENTI (CodiceTariffario);

create unique index ID_PRESTITO_IND
     on PRESTITI (CodiceAttrezzo, CodiceIscritto, Data);

create index FKprende_IND
     on PRESTITI (CodiceIscritto);

create unique index ID_SEDE_IND
     on SEDI (CodiceSede);

create unique index ID_TARIFFARIO_IND
     on TARIFFARI (CodiceTariffario);

create unique index ID_TIPOLOGIA_OGGETTO_IND
     on TIPOLOGIE_OGGETTO (CodiceTipo);

create unique index ID_tutoraggio_IND
     on TUTORAGGI_CENTRO_ESTIVO (CodiceCentroEstivo, CodiceIstruttore);

create index FKtut_IST_IND
     on TUTORAGGI_CENTRO_ESTIVO (CodiceIstruttore);

create unique index ID_VENDITA_IND
     on VENDITE (CodiceVendita);

