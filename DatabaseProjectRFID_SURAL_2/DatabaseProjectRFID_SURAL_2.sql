CREATE TABLE [dbo].[noovelia_kencee_antenne_emplacement] (
    [Reader_uwb_id]       VARCHAR (50) NOT NULL,
    [Nom_Emplacement]     VARCHAR (50) NOT NULL,
    [Reader_name]         VARCHAR (50) NOT NULL,
    [Fonction]            VARCHAR (50) NOT NULL,
    [ID]                  BIGINT       NOT NULL,
    [Date_De_Mise_A_jour] DATETIME     DEFAULT (getdate()) NOT NULL
);


GO

CREATE TABLE [dbo].[noovelia_kencee_anode_distance] (
    [numero_anode]     VARCHAR (50) NOT NULL,
    [min]              FLOAT (53)   NOT NULL,
    [max]              FLOAT (53)   NOT NULL,
    [nomi]             FLOAT (53)   NOT NULL,
    [insert_timestamp] DATETIME     DEFAULT (getdate()) NOT NULL
);


GO

CREATE TABLE [dbo].[noovelia_kencee_antenne] (
    [Etat]                VARCHAR (50) NOT NULL,
    [Raison]              VARCHAR (50) NULL,
    [RFID_reader]         VARCHAR (50) NOT NULL,
    [Reader_name]         VARCHAR (50) NOT NULL,
    [Date_De_Mise_A_jour] DATETIME     NOT NULL,
    [Reader_uwb_id]       VARCHAR (50) NULL,
    [ID]                  VARCHAR (50) NULL,
    [Emplacement]         VARCHAR (50) NULL
);


GO

CREATE TABLE [dbo].[noovelia_kencee_emplacement] (
    [Location_ID]     VARCHAR (50)  NOT NULL,
    [Emplacement_ID]  VARCHAR (255) NULL,
    [Position_X]      VARCHAR (50)  NULL,
    [Position_Y]      VARCHAR (50)  NULL,
    [Nom_Emplacement] VARCHAR (50)  NOT NULL,
    [Fonction]        VARCHAR (512) NULL,
    [Emplacement]     VARCHAR (512) NULL
);


GO

CREATE TABLE [dbo].[noovelia_kencee_balise] (
    [ID]                  BIGINT       IDENTITY (1, 1) NOT NULL,
    [Tag_id]              VARCHAR (50) NULL,
    [RFID_tag]            VARCHAR (50) NULL,
    [Etat]                VARCHAR (50) NULL,
    [Tag_name]            VARCHAR (50) NOT NULL,
    [Raison]              VARCHAR (50) NULL,
    [Date_De_Mise_A_jour] DATETIME     NOT NULL
);


GO

CREATE TABLE [dbo].[noovelia_kencee_equipment] (
    [Numero_De_Serie] VARCHAR (50) NOT NULL,
    [Etat]            VARCHAR (50) NOT NULL,
    [Fonction]        VARCHAR (50) NOT NULL,
    [row_id]          BIGINT       IDENTITY (1, 1) NOT NULL,
    [Nom]             VARCHAR (50) NOT NULL,
    [tag_id]          VARCHAR (50) NULL
);


GO

