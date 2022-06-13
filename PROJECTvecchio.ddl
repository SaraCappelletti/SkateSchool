-- *********************************************
-- * SQL MySQL generation                      
-- *--------------------------------------------
-- * DB-MAIN version: 11.0.2              
-- * Generator date: Sep 14 2021              
-- * Generation date: Wed Jun  1 12:05:42 2022 
-- * LUN file: C:\Users\sarac\Desktop\Programmazione\DataBase\Progetto\PROJECT.lun 
-- * Schema: Skate School/1 
-- ********************************************* 


-- Database Section
-- ________________ 

create database Skate School;
use Skate School;


-- Tables Section
-- _____________ 

create table attivita (
     CodiceCentroEstivo int not null,
     CodiceIscritto int not null,
     constraint ID_attivita_ID primary key (CodiceIscritto, CodiceCentroEstivo));

create table ATTREZZATURA (
     Descrizione varchar(1) not null,
     CodiceAttrezzo int not null,
     CodiceSede int not null,
     constraint ID_ATTREZZATURA_ID primary key (CodiceAttrezzo));

create table CENTROESTIVO (
     CodiceCentroEstivo int not null,
     DataInizio date not null,
     DataFine date not null,
     Descrizione varchar(1) not null,
     constraint ID_CENTROESTIVO_ID primary key (CodiceCentroEstivo));

create table CORSO (
     Livello varchar(1) not null,
     Descrizione varchar(1) not null,
     CodiceCorso int not null,
     CodiceSede int not null,
     constraint ID_CORSO_ID primary key (CodiceCorso));

create table GARA (
     Citta varchar(1) not null,
     Categoria varchar(1) not null,
     Data date not null,
     Descrizione varchar(1) not null,
     CodiceGara int not null,
     constraint ID_GARA_ID primary key (CodiceGara));

create table insegnamento (
     CodiceIstruttore int not null,
     CodiceSede int not null,
     constraint ID_insegnamento_ID primary key (CodiceSede, CodiceIstruttore));

create table ISCRITTO (
     CodiceIscritto int not null,
     Nome char(1) not null,
     Cognome char(1) not null,
     Età char(1) not null,
     Telefono char(1) not null,
     Livello varchar(1) not null,
     constraint FKPER_ISC_ID primary key (CodiceIscritto));

create table iscrizione (
     CodiceGara int not null,
     CodiceIscritto int not null,
     constraint ID_iscrizione_ID primary key (CodiceIscritto, CodiceGara));

create table ISTRUTTORE (
     CodiceIstruttore -- Compound attribute -- not null,
     Nome char(1) not null,
     Cognome char(1) not null,
     Età char(1) not null,
     Telefono char(1) not null,
     constraint FKPER_IST_ID primary key (CodiceIstruttore -- Compound attribute --));

create table LEZIONE (
     Data date not null,
     MassimoPartecipanti int not null,
     CodiceLezione int not null,
     CodiceIstruttore int not null,
     CodiceCorso int not null,
     constraint ID_LEZIONE_ID primary key (CodiceLezione),
     constraint SID_LEZIONE_ID unique (CodiceIstruttore, CodiceCorso, Data));

create table LEZIONE_PRIVATA (
     CodiceIstruttore int not null,
     Prezzo float(1) not null,
     Data date not null,
     CodiceSede int not null,
     CodicePersona int not null,
     constraint ID_LEZIONE_PRIVATA_ID primary key (CodiceIstruttore, Data));

create table OGGETTO (
     Qantita int not null,
     Prezzo float(1) not null,
     Descrizione varchar(1) not null,
     CodiceOggetto int not null,
     CodiceSede int not null,
     CodiceTipo int not null,
     constraint ID_OGGETTO_ID primary key (CodiceOggetto));

create table PAGAMENTO (
     Data date not null,
     NumeroLezioniRimaste int not null,
     CodicePagamento int not null,
     CodiceIscritto int not null,
     NumeroLezioni int not null,
     constraint ID_PAGAMENTO_ID primary key (CodicePagamento));

create table partecipazione (
     CodiceIscritto int not null,
     CodiceLezione int not null,
     constraint ID_partecipazione_ID primary key (CodiceLezione, CodiceIscritto));

create table PRESTITO (
     CodiceIscritto int not null,
     CodiceAttrezzo int not null,
     Data char(1) not null,
     Restituito char not null,
     constraint ID_PRESTITO_ID primary key (CodiceAttrezzo, CodiceIscritto, Data));

create table SEDE (
     Citta varchar(1) not null,
     SkatePark varchar(1) not null,
     CodiceSede int not null,
     constraint ID_SEDE_ID primary key (CodiceSede));

create table TARIFFARIO (
     NumeroLezioni int not null,
     Prezzo float(1) not null,
     constraint ID_TARIFFARIO_ID primary key (NumeroLezioni));

create table TIPOLOGIA_OGGETTO (
     Nome varchar(1) not null,
     CodiceTipo int not null,
     constraint ID_TIPOLOGIA_OGGETTO_ID primary key (CodiceTipo));

create table tutoraggio (
     CodiceIstruttore int not null,
     CodiceCentroEstivo int not null,
     constraint ID_tutoraggio_ID primary key (CodiceCentroEstivo, CodiceIstruttore));

create table VENDITA (
     Data date not null,
     Quantita int not null,
     CodiceVendita int not null,
     CodiceOggetto int not null,
     constraint ID_VENDITA_ID primary key (CodiceVendita));


-- Constraints Section
-- ___________________ 

alter table attivita add constraint FKatt_ISC
     foreign key (CodiceIscritto)
     references ISCRITTO (CodiceIscritto);

alter table attivita add constraint FKatt_CEN_FK
     foreign key (CodiceCentroEstivo)
     references CENTROESTIVO (CodiceCentroEstivo);

alter table ATTREZZATURA add constraint FKpossiede_FK
     foreign key (CodiceSede)
     references SEDE (CodiceSede);

alter table CORSO add constraint FKospita_FK
     foreign key (CodiceSede)
     references SEDE (CodiceSede);

alter table insegnamento add constraint FKins_SED
     foreign key (CodiceSede)
     references SEDE (CodiceSede);

alter table insegnamento add constraint FKins_IST_FK
     foreign key (CodiceIstruttore)
     references ISTRUTTORE (CodiceIstruttore -- Compound attribute --);

alter table iscrizione add constraint FKisc_ISC
     foreign key (CodiceIscritto)
     references ISCRITTO (CodiceIscritto);

alter table iscrizione add constraint FKisc_GAR_FK
     foreign key (CodiceGara)
     references GARA (CodiceGara);

alter table LEZIONE add constraint FKgestione
     foreign key (CodiceIstruttore)
     references ISTRUTTORE (CodiceIstruttore -- Compound attribute --);

alter table LEZIONE add constraint FKappartiene_FK
     foreign key (CodiceCorso)
     references CORSO (CodiceCorso);

alter table LEZIONE_PRIVATA add constraint FKluogo_FK
     foreign key (CodiceSede)
     references SEDE (CodiceSede);

alter table LEZIONE_PRIVATA add constraint FKsostiene_FK
     foreign key (CodicePersona)
     references ISCRITTO (CodiceIscritto);

alter table LEZIONE_PRIVATA add constraint FKpresiede
     foreign key (CodiceIstruttore)
     references ISTRUTTORE (CodiceIstruttore -- Compound attribute --);

alter table OGGETTO add constraint FKvendita_FK
     foreign key (CodiceSede)
     references SEDE (CodiceSede);

alter table OGGETTO add constraint FKappartenenza_FK
     foreign key (CodiceTipo)
     references TIPOLOGIA_OGGETTO (CodiceTipo);

alter table PAGAMENTO add constraint FKeffettuato_FK
     foreign key (CodiceIscritto)
     references ISCRITTO (CodiceIscritto);

alter table PAGAMENTO add constraint FKcomprende_FK
     foreign key (NumeroLezioni)
     references TARIFFARIO (NumeroLezioni);

alter table partecipazione add constraint FKpar_LEZ
     foreign key (CodiceLezione)
     references LEZIONE (CodiceLezione);

alter table partecipazione add constraint FKpar_ISC_FK
     foreign key (CodiceIscritto)
     references ISCRITTO (CodiceIscritto);

alter table PRESTITO add constraint FKprestito
     foreign key (CodiceAttrezzo)
     references ATTREZZATURA (CodiceAttrezzo);

alter table PRESTITO add constraint FKprende_FK
     foreign key (CodiceIscritto)
     references ISCRITTO (CodiceIscritto);

alter table tutoraggio add constraint FKtut_CEN
     foreign key (CodiceCentroEstivo)
     references CENTROESTIVO (CodiceCentroEstivo);

alter table tutoraggio add constraint FKtut_IST_FK
     foreign key (CodiceIstruttore)
     references ISTRUTTORE (CodiceIstruttore -- Compound attribute --);

alter table VENDITA add constraint FK_vendita_FK
     foreign key (CodiceOggetto)
     references OGGETTO (CodiceOggetto);


-- Index Section
-- _____________ 

create unique index ID_attivita_IND
     on attivita (CodiceIscritto, CodiceCentroEstivo);

create index FKatt_CEN_IND
     on attivita (CodiceCentroEstivo);

create unique index ID_ATTREZZATURA_IND
     on ATTREZZATURA (CodiceAttrezzo);

create index FKpossiede_IND
     on ATTREZZATURA (CodiceSede);

create unique index ID_CENTROESTIVO_IND
     on CENTROESTIVO (CodiceCentroEstivo);

create unique index ID_CORSO_IND
     on CORSO (CodiceCorso);

create index FKospita_IND
     on CORSO (CodiceSede);

create unique index ID_GARA_IND
     on GARA (CodiceGara);

create unique index ID_insegnamento_IND
     on insegnamento (CodiceSede, CodiceIstruttore);

create index FKins_IST_IND
     on insegnamento (CodiceIstruttore);

create unique index FKPER_ISC_IND
     on ISCRITTO (CodiceIscritto);

create unique index ID_iscrizione_IND
     on iscrizione (CodiceIscritto, CodiceGara);

create index FKisc_GAR_IND
     on iscrizione (CodiceGara);

create unique index FKPER_IST_IND
     on ISTRUTTORE (CodiceIstruttore -- Compound attribute --);

create unique index ID_LEZIONE_IND
     on LEZIONE (CodiceLezione);

create unique index SID_LEZIONE_IND
     on LEZIONE (CodiceIstruttore, CodiceCorso, Data);

create index FKappartiene_IND
     on LEZIONE (CodiceCorso);

create unique index ID_LEZIONE_PRIVATA_IND
     on LEZIONE_PRIVATA (CodiceIstruttore, Data);

create index FKluogo_IND
     on LEZIONE_PRIVATA (CodiceSede);

create index FKsostiene_IND
     on LEZIONE_PRIVATA (CodicePersona);

create unique index ID_OGGETTO_IND
     on OGGETTO (CodiceOggetto);

create index FKvendita_IND
     on OGGETTO (CodiceSede);

create index FKappartenenza_IND
     on OGGETTO (CodiceTipo);

create unique index ID_PAGAMENTO_IND
     on PAGAMENTO (CodicePagamento);

create index FKeffettuato_IND
     on PAGAMENTO (CodiceIscritto);

create index FKcomprende_IND
     on PAGAMENTO (NumeroLezioni);

create unique index ID_partecipazione_IND
     on partecipazione (CodiceLezione, CodiceIscritto);

create index FKpar_ISC_IND
     on partecipazione (CodiceIscritto);

create unique index ID_PRESTITO_IND
     on PRESTITO (CodiceAttrezzo, CodiceIscritto, Data);

create index FKprende_IND
     on PRESTITO (CodiceIscritto);

create unique index ID_SEDE_IND
     on SEDE (CodiceSede);

create unique index ID_TARIFFARIO_IND
     on TARIFFARIO (NumeroLezioni);

create unique index ID_TIPOLOGIA_OGGETTO_IND
     on TIPOLOGIA_OGGETTO (CodiceTipo);

create unique index ID_tutoraggio_IND
     on tutoraggio (CodiceCentroEstivo, CodiceIstruttore);

create index FKtut_IST_IND
     on tutoraggio (CodiceIstruttore);

create unique index ID_VENDITA_IND
     on VENDITA (CodiceVendita);

create index FK_vendita_IND
     on VENDITA (CodiceOggetto);

