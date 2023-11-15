/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2000                    */
/* Created on:     08/11/2023 20:06:55                          */
/*==============================================================*/


if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('COMPTE') and o.name = 'FK_COMPTE_POSSEDER_CLIENT')
alter table COMPTE
   drop constraint FK_COMPTE_POSSEDER_CLIENT
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CONSEILLERS') and o.name = 'FK_CONSEILL_TRAVAILLE_AGENCES')
alter table CONSEILLERS
   drop constraint FK_CONSEILL_TRAVAILLE_AGENCES
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('LIGNES_COMPTES') and o.name = 'FK_LIGNES_C_CONTIENT_COMPTE')
alter table LIGNES_COMPTES
   drop constraint FK_LIGNES_C_CONTIENT_COMPTE
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('RESPONSABLE') and o.name = 'FK_RESPONSA_RESPONSAB_CLIENT')
alter table RESPONSABLE
   drop constraint FK_RESPONSA_RESPONSAB_CLIENT
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('RESPONSABLE') and o.name = 'FK_RESPONSA_RESPONSAB_CONSEILL')
alter table RESPONSABLE
   drop constraint FK_RESPONSA_RESPONSAB_CONSEILL
go

if exists (select 1
            from  sysobjects
           where  id = object_id('AGENCES')
            and   type = 'U')
   drop table AGENCES
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CLIENT')
            and   type = 'U')
   drop table CLIENT
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('COMPTE')
            and   name  = 'POSSEDER_FK'
            and   indid > 0
            and   indid < 255)
   drop index COMPTE.POSSEDER_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('COMPTE')
            and   type = 'U')
   drop table COMPTE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CONSEILLERS')
            and   name  = 'TRAVAILLER_FK'
            and   indid > 0
            and   indid < 255)
   drop index CONSEILLERS.TRAVAILLER_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CONSEILLERS')
            and   type = 'U')
   drop table CONSEILLERS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('LIGNES_COMPTES')
            and   name  = 'CONTIENT_FK'
            and   indid > 0
            and   indid < 255)
   drop index LIGNES_COMPTES.CONTIENT_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LIGNES_COMPTES')
            and   type = 'U')
   drop table LIGNES_COMPTES
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('RESPONSABLE')
            and   name  = 'RESPONSABLE_FK'
            and   indid > 0
            and   indid < 255)
   drop index RESPONSABLE.RESPONSABLE_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('RESPONSABLE')
            and   name  = 'RESPONSABLE2_FK'
            and   indid > 0
            and   indid < 255)
   drop index RESPONSABLE.RESPONSABLE2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('RESPONSABLE')
            and   type = 'U')
   drop table RESPONSABLE
go

/*==============================================================*/
/* Table: AGENCES                                               */
/*==============================================================*/
create table AGENCES (
   AGENCE_ID            int                  not null,
   NOM_AGENCE           varchar(20)          null,
   ADRESSE_AGENCE       varchar(50)          null,
   constraint PK_AGENCES primary key nonclustered (AGENCE_ID)
)
go

/*==============================================================*/
/* Table: CLIENT                                                */
/*==============================================================*/
create table CLIENT (
   CLIENT_ID            int                  not null,
   NOM_CLIENT           varchar(20)          null,
   ADRESSE_CLIENT       varchar(50)          null,
   DATE_DE_NAISSANCE    datetime             null,
   SITUATION_FAMILIALE  varchar(20)          null,
   PROFESSION           varchar(20)          null,
   constraint PK_CLIENT primary key nonclustered (CLIENT_ID)
)
go

/*==============================================================*/
/* Table: COMPTE                                                */
/*==============================================================*/
create table COMPTE (
   COMPTE_ID            int                  not null,
   CLIENT_ID            int                  not null,
   TYPE                 varchar(20)          null,
   DATE_OUVERTURE       datetime             null,
   SOLDE                double precision     null,
   constraint PK_COMPTE primary key nonclustered (COMPTE_ID)
)
go

/*==============================================================*/
/* Index: POSSEDER_FK                                           */
/*==============================================================*/
create index POSSEDER_FK on COMPTE (
CLIENT_ID ASC
)
go

/*==============================================================*/
/* Table: CONSEILLERS                                           */
/*==============================================================*/
create table CONSEILLERS (
   CONSEILLER_ID        int                  not null,
   AGENCE_ID            int                  not null,
   NOM_CONSEILLER       varchar(20)          null,
   PRENOM_CONSEILLER    varchar(20)          null,
   EMAIL                varchar(20)          null,
   constraint PK_CONSEILLERS primary key nonclustered (CONSEILLER_ID)
)
go

/*==============================================================*/
/* Index: TRAVAILLER_FK                                         */
/*==============================================================*/
create index TRAVAILLER_FK on CONSEILLERS (
AGENCE_ID ASC
)
go

/*==============================================================*/
/* Table: LIGNES_COMPTES                                        */
/*==============================================================*/
create table LIGNES_COMPTES (
   LIGNE_ID             int                  not null,
   COMPTE_ID            int                  not null,
   DATE_OPERATION       datetime             null,
   DESCRIPTION          varchar(50)          null,
   MONTANT              double precision     null,
   constraint PK_LIGNES_COMPTES primary key nonclustered (LIGNE_ID)
)
go

/*==============================================================*/
/* Index: CONTIENT_FK                                           */
/*==============================================================*/
create index CONTIENT_FK on LIGNES_COMPTES (
COMPTE_ID ASC
)
go

/*==============================================================*/
/* Table: RESPONSABLE                                           */
/*==============================================================*/
create table RESPONSABLE (
   CONSEILLER_ID        int                  not null,
   CLIENT_ID            int                  not null,
   constraint PK_RESPONSABLE primary key nonclustered (CONSEILLER_ID, CLIENT_ID)
)
go

/*==============================================================*/
/* Index: RESPONSABLE2_FK                                       */
/*==============================================================*/
create index RESPONSABLE2_FK on RESPONSABLE (
CONSEILLER_ID ASC
)
go

/*==============================================================*/
/* Index: RESPONSABLE_FK                                        */
/*==============================================================*/
create index RESPONSABLE_FK on RESPONSABLE (
CLIENT_ID ASC
)
go

alter table COMPTE
   add constraint FK_COMPTE_POSSEDER_CLIENT foreign key (CLIENT_ID)
      references CLIENT (CLIENT_ID)
go

alter table CONSEILLERS
   add constraint FK_CONSEILL_TRAVAILLE_AGENCES foreign key (AGENCE_ID)
      references AGENCES (AGENCE_ID)
go

alter table LIGNES_COMPTES
   add constraint FK_LIGNES_C_CONTIENT_COMPTE foreign key (COMPTE_ID)
      references COMPTE (COMPTE_ID)
go

alter table RESPONSABLE
   add constraint FK_RESPONSA_RESPONSAB_CLIENT foreign key (CLIENT_ID)
      references CLIENT (CLIENT_ID)
go

alter table RESPONSABLE
   add constraint FK_RESPONSA_RESPONSAB_CONSEILL foreign key (CONSEILLER_ID)
      references CONSEILLERS (CONSEILLER_ID)
go

