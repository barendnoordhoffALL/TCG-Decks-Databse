/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     10/15/2025 1:42:55 AM                        */
/*==============================================================*/

drop index if exists COLOR_PK;

alter table if exists COLOR
   drop constraint if exists PK_COLOR;

drop table if exists COLOR;

drop index if exists FK_ONEPIECEDECK_STATUS_FK;

drop index if exists FK_ONEPIECEDECK_SET_FK;

drop index if exists ONEPIECEDECK_PK;

alter table if exists ONEPIECEDECK
   drop constraint if exists PK_ONEPIECEDECK;

drop table if exists ONEPIECEDECK;

drop index if exists FK_ONEPIECEDECK_COLOR_FK;

drop index if exists FK_COLOR_ONEPIECEDECK_FK;

drop index if exists ONEPIECEDECKCOLORS_PK;

alter table if exists ONEPIECEDECKCOLORS
   drop constraint if exists PK_ONEPIECEDECKCOLORS;

drop table if exists ONEPIECEDECKCOLORS;

drop index if exists FK_ONEPIECEDECK_TYPING_FK;

drop index if exists FK_TYPING_ONEPIECEDECK_FK;

drop index if exists ONEPIECEDECK_TYPINGS_PK;

alter table if exists ONEPIECEDECK_TYPINGS
   drop constraint if exists PK_ONEPIECEDECK_TYPINGS;

drop table if exists ONEPIECEDECK_TYPINGS;

drop index if exists SET_PK;

alter table if exists SET
   drop constraint if exists PK_SET;

drop table if exists SET;

drop index if exists STATUS_PK;

alter table if exists STATUS
   drop constraint if exists PK_STATUS;

drop table if exists STATUS;

drop index if exists TYPING_PK;

alter table if exists TYPING
   drop constraint if exists PK_TYPING;

drop table if exists TYPING;

/*==============================================================*/
/* Table: COLOR                                                 */
/*==============================================================*/
create table COLOR (
   COLOR                VARCHAR(10)          not null
);

alter table COLOR
   add constraint PK_COLOR primary key (COLOR);

/*==============================================================*/
/* Index: COLOR_PK                                              */
/*==============================================================*/
create unique index COLOR_PK on COLOR (
COLOR
);

/*==============================================================*/
/* Table: ONEPIECEDECK                                          */
/*==============================================================*/
create table ONEPIECEDECK (
   LEADER               VARCHAR(25)          not null,
   STATUS               VARCHAR(25)          not null,
   SET                  VARCHAR(10)          not null,
   POWER                INT4                 null,
   LIFE                 INT4                 null
);

alter table ONEPIECEDECK
   add constraint PK_ONEPIECEDECK primary key (LEADER, SET);

/*==============================================================*/
/* Index: ONEPIECEDECK_PK                                       */
/*==============================================================*/
create unique index ONEPIECEDECK_PK on ONEPIECEDECK (
LEADER,
SET
);

/*==============================================================*/
/* Index: FK_ONEPIECEDECK_SET_FK                                */
/*==============================================================*/
create unique index FK_ONEPIECEDECK_SET_FK on ONEPIECEDECK (
SET
);

/*==============================================================*/
/* Index: FK_ONEPIECEDECK_STATUS_FK                             */
/*==============================================================*/
create  index FK_ONEPIECEDECK_STATUS_FK on ONEPIECEDECK (
STATUS
);

/*==============================================================*/
/* Table: ONEPIECEDECKCOLORS                                    */
/*==============================================================*/
create table ONEPIECEDECKCOLORS (
   COLOR                VARCHAR(10)          not null,
   SETNAME              VARCHAR(10)          not null,
   LEADER               VARCHAR(25)          not null
);

alter table ONEPIECEDECKCOLORS
   add constraint PK_ONEPIECEDECKCOLORS primary key (SETNAME, COLOR, LEADER);

/*==============================================================*/
/* Index: ONEPIECEDECKCOLORS_PK                                 */
/*==============================================================*/
create unique index ONEPIECEDECKCOLORS_PK on ONEPIECEDECKCOLORS (
SETNAME,
COLOR,
LEADER
);

/*==============================================================*/
/* Index: FK_COLOR_ONEPIECEDECK_FK                              */
/*==============================================================*/
create  index FK_COLOR_ONEPIECEDECK_FK on ONEPIECEDECKCOLORS (
COLOR
);

/*==============================================================*/
/* Index: FK_ONEPIECEDECK_COLOR_FK                              */
/*==============================================================*/
create  index FK_ONEPIECEDECK_COLOR_FK on ONEPIECEDECKCOLORS (
LEADER,
SETNAME
);

/*==============================================================*/
/* Table: ONEPIECEDECK_TYPINGS                                  */
/*==============================================================*/
create table ONEPIECEDECK_TYPINGS (
   TYPING               VARCHAR(25)          not null,
   SETNAME              VARCHAR(10)          not null,
   LEADER               VARCHAR(25)          not null
);

alter table ONEPIECEDECK_TYPINGS
   add constraint PK_ONEPIECEDECK_TYPINGS primary key (SETNAME, TYPING, LEADER);

/*==============================================================*/
/* Index: ONEPIECEDECK_TYPINGS_PK                               */
/*==============================================================*/
create unique index ONEPIECEDECK_TYPINGS_PK on ONEPIECEDECK_TYPINGS (
SETNAME,
TYPING,
LEADER
);

/*==============================================================*/
/* Index: FK_TYPING_ONEPIECEDECK_FK                             */
/*==============================================================*/
create  index FK_TYPING_ONEPIECEDECK_FK on ONEPIECEDECK_TYPINGS (
TYPING
);

/*==============================================================*/
/* Index: FK_ONEPIECEDECK_TYPING_FK                             */
/*==============================================================*/
create  index FK_ONEPIECEDECK_TYPING_FK on ONEPIECEDECK_TYPINGS (
LEADER,
SETNAME
);

/*==============================================================*/
/* Table: SET                                                   */
/*==============================================================*/
create table SET (
   SETNAME              VARCHAR(10)          not null
);

alter table SET
   add constraint PK_SET primary key (SETNAME);

/*==============================================================*/
/* Index: SET_PK                                                */
/*==============================================================*/
create unique index SET_PK on SET (
SETNAME
);

/*==============================================================*/
/* Table: STATUS                                                */
/*==============================================================*/
create table STATUS (
   STATUS               VARCHAR(25)          not null
);

alter table STATUS
   add constraint PK_STATUS primary key (STATUS);

/*==============================================================*/
/* Index: STATUS_PK                                             */
/*==============================================================*/
create unique index STATUS_PK on STATUS (
STATUS
);

/*==============================================================*/
/* Table: TYPING                                                */
/*==============================================================*/
create table TYPING (
   TYPING               VARCHAR(25)          not null
);

alter table TYPING
   add constraint PK_TYPING primary key (TYPING);

/*==============================================================*/
/* Index: TYPING_PK                                             */
/*==============================================================*/
create unique index TYPING_PK on TYPING (
TYPING
);

alter table ONEPIECEDECK
   add constraint FK_ONEPIECE_FK_ONEPIE_SET foreign key (SET)
      references SET (SETNAME)
      on delete restrict on update restrict;

alter table ONEPIECEDECK
   add constraint FK_ONEPIECE_FK_ONEPIE_STATUS foreign key (STATUS)
      references STATUS (STATUS)
      on delete restrict on update restrict;

alter table ONEPIECEDECKCOLORS
   add constraint FK_ONEPIECE_FK_COLOR__COLOR foreign key (COLOR)
      references COLOR (COLOR)
      on delete restrict on update restrict;

alter table ONEPIECEDECKCOLORS
   add constraint FK_ONEPIECE_FK_ONEPIE_ONEPIECE foreign key (LEADER, SETNAME)
      references ONEPIECEDECK (LEADER, SET)
      on delete restrict on update restrict;

alter table ONEPIECEDECK_TYPINGS
   add constraint FK_ONEPIECE_FK_ONEPIE_ONEPIECE foreign key (LEADER, SETNAME)
      references ONEPIECEDECK (LEADER, SET)
      on delete restrict on update restrict;

alter table ONEPIECEDECK_TYPINGS
   add constraint FK_ONEPIECE_FK_TYPING_TYPING foreign key (TYPING)
      references TYPING (TYPING)
      on delete restrict on update restrict;

