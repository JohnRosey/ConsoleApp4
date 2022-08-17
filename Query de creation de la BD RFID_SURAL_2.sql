
--░█████╗░██████╗░███████╗░█████╗░████████╗██╗░█████╗░███╗░░██╗  ██████╗░███████╗░██████╗
--██╔══██╗██╔══██╗██╔════╝██╔══██╗╚══██╔══╝██║██╔══██╗████╗░██║  ██╔══██╗██╔════╝██╔════╝
--██║░░╚═╝██████╔╝█████╗░░███████║░░░██║░░░██║██║░░██║██╔██╗██║  ██║░░██║█████╗░░╚█████╗░
--██║░░██╗██╔══██╗██╔══╝░░██╔══██║░░░██║░░░██║██║░░██║██║╚████║  ██║░░██║██╔══╝░░░╚═══██╗
--╚█████╔╝██║░░██║███████╗██║░░██║░░░██║░░░██║╚█████╔╝██║░╚███║  ██████╔╝███████╗██████╔╝
--░╚════╝░╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝░░░╚═╝░░░╚═╝░╚════╝░╚═╝░░╚══╝  ╚═════╝░╚══════╝╚═════╝░

--████████╗░█████╗░██████╗░██╗░░░░░███████╗░██████╗  ██████╗░███████╗
--╚══██╔══╝██╔══██╗██╔══██╗██║░░░░░██╔════╝██╔════╝  ██╔══██╗██╔════╝
--░░░██║░░░███████║██████╦╝██║░░░░░█████╗░░╚█████╗░  ██║░░██║█████╗░░
--░░░██║░░░██╔══██║██╔══██╗██║░░░░░██╔══╝░░░╚═══██╗  ██║░░██║██╔══╝░░
--░░░██║░░░██║░░██║██████╦╝███████╗███████╗██████╔╝  ██████╔╝███████╗
--░░░╚═╝░░░╚═╝░░╚═╝╚═════╝░╚══════╝╚══════╝╚═════╝░  ╚═════╝░╚══════╝

--██████╗░███████╗██╗██████╗░  ░██████╗██╗░░░██╗██████╗░░█████╗░██╗░░░░░  ██████╗░
--██╔══██╗██╔════╝██║██╔══██╗  ██╔════╝██║░░░██║██╔══██╗██╔══██╗██║░░░░░  ╚════██╗
--██████╔╝█████╗░░██║██║░░██║  ╚█████╗░██║░░░██║██████╔╝███████║██║░░░░░  ░░███╔═╝
--██╔══██╗██╔══╝░░██║██║░░██║  ░╚═══██╗██║░░░██║██╔══██╗██╔══██║██║░░░░░  ██╔══╝░░
--██║░░██║██║░░░░░██║██████╔╝  ██████╔╝╚██████╔╝██║░░██║██║░░██║███████╗  ███████╗
--╚═╝░░╚═╝╚═╝░░░░░╚═╝╚═════╝░  ╚═════╝░░╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝  ╚══════╝




SELECT D.[detection_id]
      ,D.[reader_uwb_id]
      ,D.[tag_id]
      ,D.[tag_temperature]
      ,D.[distance]
      ,D.[tag_motion]
      ,D.[insert_timestamp]
	  ,A.Reader_uwb_id
	  ,E.Emplacement
	  ,E.Fonction
  FROM [ABI-MES-SQL-CL1.APM.ALCOA.COM].[RFID_SURAL].[dbo].[noovelia_kencee_detection] as D
   INNER JOIN  [ABI-MES-QA.APM.ALCOA.COM].[RFID_SURAL_2].[dbo].[noovelia_kencee_antenne]
 as A ON A.Reader_uwb_id=D.reader_uwb_id and A.Etat='ACTIF' 
 INNER JOIN  [ABI-MES-QA.APM.ALCOA.COM].[RFID_SURAL_2].[dbo].[noovelia_kencee_Emplacement] as E
 ON A.Emplacement=E.Emplacement and E.Fonction ='Suivi de lopération de la pince à croute lors des changements danodes'




















USE [RFID_SURAL_2]
GO

/****** Object:  Table [dbo].[noovelia_kencee_antenne]   //
// Script Date: 7/27/2022 11:19:14 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER TABLE [dbo].[noovelia_kencee_antenne]
(
	
	[Etat] [varchar](50)NOT NULL,
	[Raison] [varchar](50) NULL,
	[RFID_reader] [varchar](50) NOT NULL,
	[Reader_name] [varchar](50) NOT NULL,
	[Date_De_Mise_A_jour] [datetime]NOT NULL,
)

USE [RFID_SURAL_2]
GO

/****** Object:  Table [dbo].[noovelia_kencee_balise]    Script Date: 7/27/2022 11:28:59 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[noovelia_kencee_balise]
(
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Tag_id] [varchar](50) NULL,
	[RFID_tag] [varchar](50) NULL,
	[Etat] [varchar](50) NULL,
	[Tag_name] [varchar](50) NOT NULL,
	[Raison] [varchar](50) NULL,
	[Date_De_Mise_A_jour] [datetime]NOT NULL,
)


USE [RFID_SURAL_2]
GO


USE [RFID_SURAL_2]
GO

/****** Object:  Table [dbo].[noovelia_kencee_emplacement]    Script Date: 7/27/2022 11:34:10 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[noovelia_kencee_emplacement]
(
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Emplacement_ID] [varchar](255) NULL,
	[Position_X] [varchar](50) NULL,
	[Position_Y] [varchar](50) NULL,
	[Nom_Emplacement] [varchar](50) NOT NULL,
	[Fonction] [varchar](512) NULL,
	[Emplacement] [varchar](512) NULL
) ON [PRIMARY]
GO


USE [RFID_SURAL_2]
GO

/****** Object:  Table [dbo].[noovelia_kencee_equipment]    Script Date: 7/27/2022 11:43:52 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[noovelia_kencee_equipment]
(
	[Numero_De_Serie] [varchar](50) NOT NULL,
	[Etat] [varchar](50) NOT NULL,
	[Fonction] [varchar](50) NOT NULL,
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](50) NOT NULL,

)

USE [RFID_SURAL_2]
GO

/****** Object:  Table [dbo].[noovelia_kencee_antenne_emplacement]    Script Date: 7/27/2022 3:02:18 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[noovelia_kencee_antenne_emplacement]
(
	[Reader_uwb_id] [varchar](50) NOT NULL,
	[Nom_Emplacement] [varchar](50) NOT NULL,
	[Reader_name] [varchar](50) NOT NULL,
	[Fonction] [varchar](50) NOT NULL,
	[ID] [bigint] NOT NULL,
	[Date_De_Mise_A_jour] [datetime] NOT NULL DEFAULT getDate()
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[noovelia_kencee_anode_distance]
(
	[numero_anode] [varchar](50) NOT NULL,
	[min] FLOAT NOT NULL,
	[max] FLOAT NOT NULL,
	[nomi] FLOAT NOT NULL,
	[insert_timestamp][datetime] NOT NULL DEFAULT getDate(),

)



--██╗░░░░░███████╗░██████╗  ██╗░░░██╗██╗░░░██╗███████╗░██████╗
--██║░░░░░██╔════╝██╔════╝  ██║░░░██║██║░░░██║██╔════╝██╔════╝
--██║░░░░░█████╗░░╚█████╗░  ╚██╗░██╔╝██║░░░██║█████╗░░╚█████╗░
--██║░░░░░██╔══╝░░░╚═══██╗  ░╚████╔╝░██║░░░██║██╔══╝░░░╚═══██╗
--███████╗███████╗██████╔╝  ░░╚██╔╝░░╚██████╔╝███████╗██████╔╝
--╚══════╝╚══════╝╚═════╝░  ░░░╚═╝░░░░╚═════╝░╚══════╝╚═════╝░RELATIONS ENTRE LES DIFFERENTES ENTITES



USE [RFID_SURAL_2]
GO

/****** Object:  View [dbo].[v_kencee_detection_date_de_début_de_quart]    Script Date: 7/27/2022 3:23:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_kencee_detection_date_de_début_de_quart]
AS
	SELECT detection_id, reader_uwb_id, tag_id, tag_temperature, distance, tag_motion, insert_timestamp, CASE WHEN (DATEPART(HH, insert_timestamp) > 19) THEN DATEADD(Hour, 20, CAST(CONVERT(DATE, 
                         insert_timestamp) AS datetime)) WHEN (DATEPART(HH, insert_timestamp) < 8) THEN DATEADD(Hour, - 4, CAST(CONVERT(DATE, insert_timestamp) AS datetime)) ELSE DATEADD(Hour, 8, CAST(CONVERT(DATE, 
                         insert_timestamp) AS datetime)) END AS Date_Debut_Poste
	FROM dbo.kencee_detection
GO



CREATE VIEW v_kencee_detection_distance_benne
AS
	SELECT p.distance , p.insert_timestamp, p.detection_id,  
, FORMAT (insert_timestamp, 'yyyy-MM-dd') as date
	, FORMAT (insert_timestamp, 'hh:mm:ss') as time

	FROM [dbo].[v_kencee_detection_distance_min_max] as p
	WHERE distance BETWEEN 	'3.9' and	'5.2'

CREATE VIEW v_kencee_detection_distance_8__9
AS
	SELECT p.distance , p.insert_timestamp, p.detection_id,  
, FORMAT (insert_timestamp, 'yyyy-MM-dd') as date
	, FORMAT (insert_timestamp, 'hh:mm:s s') as time

	FROM [dbo].[v_kencee_detection_distance_min_max] as p
	WHERE distance BETWEEN 	'7.893' and	'8.4'


--░█████╗░██╗░░░░░░██████╗░░█████╗░
--██╔══██╗██║░░░░░██╔════╝░██╔══██╗
--███████║██║░░░░░██║░░██╗░██║░░██║
--██╔══██║██║░░░░░██║░░╚██╗██║░░██║
--██║░░██║███████╗╚██████╔╝╚█████╔╝
--╚═╝░░╚═╝╚══════╝░╚═════╝░░╚════╝░




-- Pour Lundi 
DECLARE @DateTimeVariable DATETIME
SET @DateTimeVariable = GETDATE()



SELECT D.[detection_id]
      ,D.[reader_uwb_id]
      ,D.[tag_id]
      ,D.[tag_temperature]
      ,D.[distance]
      ,D.[insert_timestamp]
     ,E.Nom_Emplacement



FROM [ABI-MES-SQL-CL1.APM.ALCOA.COM].[RFID_SURAL].[dbo].[noovelia_kencee_detection] as D
   INNER JOIN  [ABI-MES-QA.APM.ALCOA.COM].[RFID_SURAL_2].[dbo].[noovelia_kencee_antenne]
as A ON A.Reader_uwb_id=D.reader_uwb_id  
    INNER JOIN [ABI-MES-QA.APM.ALCOA.COM].[RFID_SURAL_2].[dbo].[noovelia_kencee_antenne_emplacement] as E 
on E.Nom_Emplacement=E.Nom_Emplacement
WHERE D.insert_timestamp < @DateTimeVariable and D.distance BETWEEN  1.88 and 15.82
ORDER BY D.detection_id Asc  
USE [RFID_SURAL_2]
GO
--fin pour Lundi 



/****** Object:  View [dbo].[v_anode_dectection]    Script Date: 7/27/2022 3:24:32 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_anode_dectection]
AS
	SELECT p.detection_id
      , p.[tag_temperature]
      , p.[distance]
	  , p.insert_timestamp
	  , c.[numero_anode]
	 , c.minimal, c.maximal
	FROM kencee_detection AS p /* LEFT TABLE*/
		JOIN noovelia_kencee_anode_distance  AS c /* RIGHT TABLE*/
		ON
 p.distance BETWEEN c.minimal and c.maximal
/*order by p.insert_timestamp*/


GO
/*REQUETTE POUR RECUPER LES DONNEES APRES TRIAGE POUR L'ALGORITHME   */
DECLARE @DateTimeVariable DATETIME
SET @DateTimeVariable = GETDATE()



SELECT D.[detection_id]
      ,D.[reader_uwb_id]
      ,D.[tag_id]
      ,D.[tag_temperature]
      ,D.[distance]
      ,D.[insert_timestamp]
      ,A.Reader_uwb_id



FROM [ABI-MES-SQL-CL1.APM.ALCOA.COM].[RFID_SURAL].[dbo].[noovelia_kencee_detection] as D
   INNER JOIN  [ABI-MES-QA.APM.ALCOA.COM].[RFID_SURAL_2].[dbo].[noovelia_kencee_antenne]
as A ON A.Reader_uwb_id=D.reader_uwb_id  
/*RAJOUTER DES  JOINTURES POUR LE STATUT DES ANTENNES ACTIF */
/*RAJOUTER DES JOINTURES POUR CHAQUE PARAMETRE EN PLUS CAR NOUS AVONS BALISES QUI A UNE LOCATION ET LES EQUIPEMENTS AUSSI */



WHERE D.insert_timestamp < @DateTimeVariable and D.distance BETWEEN  1.88 and 15.82
ORDER BY D.detection_id Asc

/*REQUETTE QUI PERMET DE CHERCHER DANS LA BD POUR TROUVER LES ENREGISTREMENTS DE 8H HIER A AUJOURD'HUI 8H*/

DECLARE @yesterday DATETIME
    = DATEADD(DAY, -1, CAST(GETDATE() AS DATE));

DECLARE @today DATETIME = CAST(GETDATE() AS DATE);


SELECT D.[detection_id]
      ,D.[reader_uwb_id]
      ,D.[tag_id]
      ,D.[tag_temperature]
      ,D.[distance]
      ,D.[insert_timestamp]
	 


FROM [ABI-MES-SQL-CL1.APM.ALCOA.COM].[RFID_SURAL].[dbo].[noovelia_kencee_detection] as D
 /*RAJOUTER DES  JOINTURES POUR LE STATUT DES ANTENNES ACTIF */
/*RAJOUTER DES JOINTURES POUR CHAQUE PARAMETRE EN PLUS CAR NOUS AVONS BALISES QUI A UNE LOCATION ET LES EQUIPEMENTS AUSSI */  
WHERE (D.[insert_timestamp] >= @yesterday+'08:00:00.000' and  D.[insert_timestamp]<@today+'08:00:00.000')  and (D.distance BETWEEN  1.88 and 15.82 ) 
ORDER BY D.detection_id Asc  




/*REQUETTE QUI CONTIENT UNE INJECTION EN PYTHON */
SELECT D.[detection_id]
      ,D.[reader_uwb_id]
      ,D.[tag_id]
      ,D.[tag_temperature]
      ,D.[distance]
      ,D.[insert_timestamp]
	  ,A.Reader_uwb_id
	 
	

  FROM [ABI-MES-SQL-CL1.APM.ALCOA.COM].[RFID_SURAL].[dbo].[noovelia_kencee_detection] as D
   INNER JOIN  [ABI-MES-QA.APM.ALCOA.COM].[RFID_SURAL_2].[dbo].[noovelia_kencee_antenne]
 as A ON A.Reader_uwb_id=D.reader_uwb_id  
 INNER JOIN 

 WHERE insert_timestamp <'"""+str(datetime.now().date())+"""'   and D.distance BETWEEN  1.88 and 15.82
 ORDER BY detection_id Asc 


USE [RFID_SURAL_2]
GO

/****** Object:  View [dbo].[v_Antenne_Balise_Actif]    Script Date: 7/27/2022 3:51:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_Antenne_Balise_Actif]
AS
	SELECT dbo.noovelia_kencee_antenne.Etat, dbo.noovelia_kencee_antenne.Reader_uwb_id, dbo.noovelia_kencee_balise.Tag_id, dbo.noovelia_kencee_balise.Etat AS Expr1, dbo.noovelia_kencee_antenne.Reader_name,
		dbo.noovelia_kencee_balise.Tag_name
	FROM dbo.noovelia_kencee_antenne CROSS JOIN
                         dbo.noovelia_kencee_balise
	WHERE        (dbo.noovelia_kencee_antenne.Etat = 'ACTIF') AND (dbo.noovelia_kencee_balise.Etat = 'ACTIF')
GO


USE [RFID_SURAL_2]
GO

/****** Object:  View [dbo].[v_kencee_detection_distance_min_max]    Script Date: 7/27/2022 3:52:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_kencee_detection_distance_min_max]
AS
	SELECT detection_id, reader_uwb_id, tag_id, tag_temperature, distance, tag_motion, insert_timestamp, CASE WHEN (DATEPART(HH, insert_timestamp) > 19) THEN DATEADD(Hour, 20, CAST(CONVERT(DATE, 
                         insert_timestamp) AS datetime)) WHEN (DATEPART(HH, insert_timestamp) < 8) THEN DATEADD(Hour, - 4, CAST(CONVERT(DATE, insert_timestamp) AS datetime)) ELSE DATEADD(Hour, 8, CAST(CONVERT(DATE, 
                         insert_timestamp) AS datetime)) END AS Date_Debut_Poste
	FROM dbo.kencee_detection_date_de_début_de_quart
	WHERE        (distance BETWEEN 2.05 AND 16)
GO


CREATE VIEW noovelia_kencee_antenne_emplacement
AS
	SELECT

		P.[Reader_uwb_id] [varchar]
(50) NULL,
	P.[Reader_name] [varchar]
(50) NULL,
	C.[Nom_Emplacement] [varchar]
(50) NULL,
	C.[Fonction] [varchar]
(50) NULL,
	[Date_De_Mise_A_jour] [datetime] NOT NULL DEFAULT getDate
(),
	FROM dbo.noovelia_kencee_antenne AS P
	JOIN dbo.noovelia_kencee_emplacement AS C




/*██╗███╗░░██╗░██████╗███████╗██████╗░████████╗██╗░█████╗░███╗░░██╗░██████╗
//██║████╗░██║██╔════╝██╔════╝██╔══██╗╚══██╔══╝██║██╔══██╗████╗░██║██╔════╝
//██║██╔██╗██║╚█████╗░█████╗░░██████╔╝░░░██║░░░██║██║░░██║██╔██╗██║╚█████╗░
//██║██║╚████║░╚═══██╗██╔══╝░░██╔══██╗░░░██║░░░██║██║░░██║██║╚████║░╚═══██╗
//██║██║░╚███║██████╔╝███████╗██║░░██║░░░██║░░░██║╚█████╔╝██║░╚███║██████╔╝
//╚═╝╚═╝░░╚══╝╚═════╝░╚══════╝╚═╝░░╚═╝░░░╚═╝░░░╚═╝░╚════╝░╚═╝░░╚══╝╚═════╝░
*/

/* TABLE noovelia_kencee_anode_distance   */
INSERT INTO noovelia_kencee_anode_distance (numero_anode,min,nomi,max) VALUES ( '8--9', '7.393', '7.893', '8.393');
INSERT INTO noovelia_kencee_anode_distance (numero_anode,min,nomi,max) VALUES ( '7--10', '8.454', '8.954', '9.454');
INSERT INTO noovelia_kencee_anode_distance (numero_anode,min,nomi,max) VALUES ( '6--11', '9.515', '10.015', '10.515');
INSERT INTO noovelia_kencee_anode_distance (numero_anode,min,nomi,max) VALUES ( '5--12', '10.576', '11.076', '11.576');
INSERT INTO noovelia_kencee_anode_distance (numero_anode,min,nomi,max) VALUES ( '4--13', '11.637', '12.137', '12.637');
INSERT INTO noovelia_kencee_anode_distance (numero_anode,min,nomi,max) VALUES ( '3--14', '12.698', '13.198', '13.698');
INSERT INTO noovelia_kencee_anode_distance (numero_anode,min,nomi,max) VALUES ('2--15', '13.759', '14.259', '14.759');
INSERT INTO noovelia_kencee_anode_distance (numero_anode,min,nomi,max) VALUES ( '1--16', '14.82', '15.32', '15.82');
INSERT INTO noovelia_kencee_anode_distance (numero_anode,min,nomi,max) VALUES ( 'initial', '5.6', '5.65', '5.8');
INSERT INTO noovelia_kencee_anode_distance (numero_anode,min,nomi,max) VALUES ( 'benne', '3.9', '4.045', '5.2');
INSERT INTO noovelia_kencee_anode_distance (numero_anode,min,nomi,max) VALUES ( 'noname', '0', '1.88', '2');
	


/* TABLE noovelia_kencee_emplacement   */
INSERT INTO noovelia_kencee_emplacement
	(Location_ID,Position_X,Position_Y,Nom_Emplacement,Fonction,Emplacement)
VALUES
	('Location_60001', '', '', 'OPER_MSE01-1', 'Suivi de lopération de la pince à croute lors des changements danodes', 'sur le chariot à outils de la MSE 1');
INSERT INTO noovelia_kencee_emplacement
	(Location_ID,Position_X,Position_Y,Nom_Emplacement,Fonction,Emplacement)
VALUES
	('Location_60002', '', '', 'OPER_MSE02-1', 'Suivi de lopération de la pince à croute lors des changements danodes', 'sur le chariot à outils de la MSE 2');
INSERT INTO noovelia_kencee_emplacement
	(Location_ID,Position_X,Position_Y,Nom_Emplacement,Fonction,Emplacement)
VALUES
	('Location_60003', '', '', 'OPER_MSE03-1', 'Suivi de lopération de la pince à croute lors des changements danodes', 'sur le chariot à outils de la MSE 3');
INSERT INTO noovelia_kencee_emplacement
	(Location_ID,Position_X,Position_Y,Nom_Emplacement,Fonction,Emplacement)
VALUES
	('Location_60004', '', '', 'OPER_MSE04-1', 'Suivi de lopération de la pince à croute lors des changements danodes', 'sur le chariot à outils de la MSE 4');
INSERT INTO noovelia_kencee_emplacement
	(Location_ID,Position_X,Position_Y,Nom_Emplacement,Fonction,Emplacement)
VALUES
	('Location_60005', '', '', 'OPER_MSE05-1', 'Suivi de lopération de la pince à croute lors des changements danodes', 'sur le chariot à outils de la MSE 5');
INSERT INTO noovelia_kencee_emplacement
	(Location_ID,Position_X,Position_Y,Nom_Emplacement,Fonction,Emplacement)
VALUES
	('Location_60006', '', '', 'OPER_MSE06-1', 'Suivi de lopération de la pince à croute lors des changements danodes', 'sur le chariot à outils de la MSE 6');
INSERT INTO noovelia_kencee_emplacement
	(Location_ID,Position_X,Position_Y,Nom_Emplacement,Fonction,Emplacement)
VALUES
	('Location_60007', '', '', 'OPER_MSE07-1', 'Suivi de lopération de la pince à croute lors des changements danodes', 'sur le chariot à outils de la MSE 7');
INSERT INTO noovelia_kencee_emplacement
	(Location_ID,Position_X,Position_Y,Nom_Emplacement,Fonction,Emplacement)
VALUES
	('Location_60008', '', '', 'OPER_MSE08-1', 'Suivi de lopération de la pince à croute lors des changements danodes', 'sur le chariot à outils de la MSE 8');
INSERT INTO noovelia_kencee_emplacement
	(Location_ID,Position_X,Position_Y,Nom_Emplacement,Fonction,Emplacement)
VALUES
	('Location_60009', '', '', 'OPER_MSE09-1', 'Suivi de lopération de la pince à croute lors des changements danodes', 'sur le chariot à outils de la MSE 9');
INSERT INTO noovelia_kencee_emplacement
	(Location_ID,Position_X,Position_Y,Nom_Emplacement,Fonction,Emplacement)
VALUES
	('Location_600010', '', '', 'OPER_MSE10-1', 'Suivi de lopération de la pince à croute lors des changements danodes', 'sur le chariot à outils de la MSE 10');
INSERT INTO noovelia_kencee_emplacement
	(Location_ID,Position_X,Position_Y,Nom_Emplacement,Fonction,Emplacement)
VALUES
	('Location_600011', '', '', 'OPER_MSE11-1', 'Suivi de lopération de la pince à croute lors des changements danodes', 'sur le chariot à outils de la MSE 11');
INSERT INTO noovelia_kencee_emplacement
	(Location_ID,Position_X,Position_Y,Nom_Emplacement,Fonction,Emplacement)
VALUES
	('Location_600012', '', '', 'OPER_MSE12-1', 'Suivi de lopération de la pince à croute lors des changements danodes', 'sur le chariot à outils de la MSE 12');
INSERT INTO noovelia_kencee_emplacement
	(Location_ID,Position_X,Position_Y,Nom_Emplacement,Fonction,Emplacement)
VALUES
	('Location_600013', '', '', 'OPER_MSE13-1', 'Suivi de lopération de la pince à croute lors des changements danodes', 'sur le chariot à outils de la MSE 13');
INSERT INTO noovelia_kencee_emplacement
	(Location_ID,Position_X,Position_Y,Nom_Emplacement,Fonction,Emplacement)
VALUES
	('Location_600014', '', '', 'OPER_MSE14-1', 'Suivi de lopération de la pince à croute lors des changements danodes', 'sur le chariot à outils de la MSE 14');
INSERT INTO noovelia_kencee_emplacement
	(Location_ID,Position_X,Position_Y,Nom_Emplacement,Fonction,Emplacement)
VALUES
	('Location_600015', '', '', 'OPER_MSE15-1', 'Suivi de lopération de la pince à croute lors des changements danodes', 'sur le chariot à outils de la MSE 15');
INSERT INTO noovelia_kencee_emplacement
	(Location_ID,Position_X,Position_Y,Nom_Emplacement,Fonction,Emplacement)
VALUES
	('Location_600016', '', '', 'OPER_MSE16-1', 'Suivi de lopération de la pince à croute lors des changements danodes', 'sur le chariot à outils de la MSE 16');
INSERT INTO noovelia_kencee_emplacement
	(Location_ID,Position_X,Position_Y,Nom_Emplacement,Fonction,Emplacement)
VALUES
	('Location_600017', '', '', 'OPER_MSE17-1', 'Suivi de lopération de la pince à croute lors des changements danodes', 'sur le chariot à outils de la MSE 17');
INSERT INTO noovelia_kencee_emplacement
	(Location_ID,Position_X,Position_Y,Nom_Emplacement,Fonction,Emplacement)
VALUES
	('Location_600018', '', '', 'OPER_MSE18-1', 'Suivi de lopération de la pince à croute lors des changements danodes', 'sur le chariot à outils de la MSE 18');
INSERT INTO noovelia_kencee_emplacement
	(Location_ID,Position_X,Position_Y,Nom_Emplacement,Fonction,Emplacement)
VALUES
	('Location_600019', '', '', 'OPER_MSE19-1', 'Suivi de lopération de la pince à croute lors des changements danodes', 'sur le chariot à outils de la MSE 19');
INSERT INTO noovelia_kencee_emplacement
	(Location_ID,Position_X,Position_Y,Nom_Emplacement,Fonction,Emplacement)
VALUES
	('Location_600020', '', '', 'OPER_MSE20-1', 'Suivi de lopération de la pince à croute lors des changements danodes', 'sur le chariot à outils de la MSE 20');
INSERT INTO noovelia_kencee_emplacement
	(Location_ID,Position_X,Position_Y,Nom_Emplacement,Fonction,Emplacement)
VALUES
	('Location_600021', '', '', 'OPER_MSE21-1', 'Suivi de lopération de la pince à croute lors des changements danodes', 'sur le chariot à outils de la MSE 21');
INSERT INTO noovelia_kencee_emplacement
	(Location_ID,Position_X,Position_Y,Nom_Emplacement,Fonction,Emplacement)
VALUES
	('Location_600022', '', '', 'OPER_MSE22-1', 'Suivi de lopération de la pince à croute lors des changements danodes', 'sur le chariot à outils de la MSE 22');
INSERT INTO noovelia_kencee_emplacement
	(Location_ID,Position_X,Position_Y,Nom_Emplacement,Fonction,Emplacement)
VALUES
	('Location_600023', '', '', 'OPER_MSE23-1', 'Suivi de lopération de la pince à croute lors des changements danodes', 'sur le chariot à outils de la MSE 23');
INSERT INTO noovelia_kencee_emplacement
	(Location_ID,Position_X,Position_Y,Nom_Emplacement,Fonction,Emplacement)
VALUES
	('Location_600024', '', '', 'OPER_MSE24-1', 'Suivi de lopération de la pince à croute lors des changements danodes', 'sur le chariot à outils de la MSE 24');
INSERT INTO noovelia_kencee_emplacement
	(Location_ID,Position_X,Position_Y,Nom_Emplacement,Fonction,Emplacement)
VALUES
	('Location_600025', '', '', 'OPER_MSE25-1', 'Suivi de lopération de la pince à croute lors des changements danodes', 'sur le chariot à outils de la MSE 25');
INSERT INTO noovelia_kencee_emplacement
	(Location_ID,Position_X,Position_Y,Nom_Emplacement,Fonction,Emplacement)
VALUES
	('Location_600026', '', '', 'OPER_MSE26-1', 'Suivi de lopération de la pince à croute lors des changements danodes', 'sur le chariot à outils de la MSE 26');


/* //
//TABLE noovelia_kencee_equipment   */

INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('63908', 'ACTIF', 'TRACKING', '87', 'PINCE ANODE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('63911-01', 'ACTIF', 'TRACKING', '76', 'OUTIL CLAD', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('63911-02', 'ACTIF', 'TRACKING', '77', 'OUTIL CLAD', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('63911-03', 'ACTIF', 'TRACKING', '78', 'OUTIL CLAD', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('63911-04', 'ACTIF', 'TRACKING', '79', 'OUTIL CLAD', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('63911-05', 'ACTIF', 'TRACKING', '80', 'OUTIL CLAD', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('63911-06', 'ACTIF', 'TRACKING', '81', 'OUTIL CLAD', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('63911-07', 'ACTIF', 'TRACKING', '82', 'OUTIL CLAD', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('63911-08', 'ACTIF', 'TRACKING', '83', 'OUTIL CLAD', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('63911-09', 'ACTIF', 'TRACKING', '84', 'OUTIL CLAD', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('63911-10', 'ACTIF', 'TRACKING', '85', 'OUTIL CLAD', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('63911-11', 'ACTIF', 'TRACKING', '86', 'OUTIL CLAD', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('63918', 'ACTIF', 'TRACKING', '74', 'PINCE HYDRAULIQUE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('63919', 'ACTIF', 'TRACKING', '75', 'PINCE HYDRAULIQUE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-60181', 'ACTIF', 'TRACKING', '88', 'PALONNIER DE MÉTAL 10T', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-60182', 'ACTIF', 'TRACKING', '89', 'PALONNIER DE MÉTAL 10T', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-60183', 'ACTIF', 'TRACKING', '90', 'PALONNIER DE MÉTAL 10T', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-60184', 'ACTIF', 'TRACKING', '91', 'PALONNIER DE MÉTAL 10T', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-60185', 'ACTIF', 'TRACKING', '92', 'PALONNIER DE MÉTAL 10T', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-60186', 'ACTIF', 'TRACKING', '93', 'PALONNIER DE MÉTAL 10T', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-60187', 'ACTIF', 'TRACKING', '94', 'PALONNIER DE MÉTAL 10T', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-60188', 'ACTIF', 'TRACKING', '95', 'PALONNIER DE MÉTAL 10T', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-60189', 'ACTIF', 'TRACKING', '96', 'PALONNIER DE MÉTAL 10T', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-60191', 'ACTIF', 'TRACKING', '100', 'PALONNIER DE BAIN 4T', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-60192', 'ACTIF', 'TRACKING', '101', 'PALONNIER DE BAIN 4T', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-60193', 'ACTIF', 'TRACKING', '102', 'PALONNIER DE BAIN 4T', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-60194', 'ACTIF', 'TRACKING', '103', 'PALONNIER DE BAIN 4T', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-60197', 'ACTIF', 'TRACKING', '104', 'PALONNIER DE BAIN 4T', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-60198', 'ACTIF', 'TRACKING', '105', 'PALONNIER DE BAIN 4T', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-60201', 'ACTIF', 'TRACKING', '9', 'POUTRE DE RELEVAGE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-60202', 'ACTIF', 'TRACKING', '10', 'POUTRE DE RELEVAGE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-60203', 'ACTIF', 'TRACKING', '11', 'POUTRE DE RELEVAGE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-60630', 'ACTIF', 'TRACKING', '106', 'PALONNIER DE BAIN 4T', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-60680', 'ACTIF', 'TRACKING', '97', 'PALONNIER DE MÉTAL 10T', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-60681', 'ACTIF', 'TRACKING', '98', 'PALONNIER DE MÉTAL 10T', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-60682', 'ACTIF', 'TRACKING', '99', 'PALONNIER DE MÉTAL 10T', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-63351', 'ACTIF', 'PINCE À CROUTE', '12', 'PINCE À CROUTE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-63352', 'ACTIF', 'PINCE À CROUTE', '13', 'PINCE À CROUTE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-63353', 'ACTIF', 'PINCE À CROUTE', '14', 'PINCE À CROUTE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-63354', 'ACTIF', 'PINCE À CROUTE', '15', 'PINCE À CROUTE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-63355', 'ACTIF', 'PINCE À CROUTE', '16', 'PINCE À CROUTE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-63356', 'ACTIF', 'PINCE À CROUTE', '17', 'PINCE À CROUTE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-63357', 'ACTIF', 'PINCE À CROUTE', '18', 'PINCE À CROUTE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-63358', 'ACTIF', 'PINCE À CROUTE', '19', 'PINCE À CROUTE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-63359', 'ACTIF', 'PINCE À CROUTE', '20', 'PINCE À CROUTE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-63360', 'ACTIF', 'PINCE À CROUTE', '21', 'PINCE À CROUTE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-63361', 'ACTIF', 'PINCE À CROUTE', '22', 'PINCE À CROUTE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-63362', 'ACTIF', 'PINCE À CROUTE', '23', 'PINCE À CROUTE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-63363', 'ACTIF', 'PINCE À CROUTE', '24', 'PINCE À CROUTE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-63364', 'ACTIF', 'PINCE À CROUTE', '25', 'PINCE À CROUTE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-63365', 'ACTIF', 'PINCE À CROUTE', '26', 'PINCE À CROUTE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-63366', 'ACTIF', 'PINCE À CROUTE', '27', 'PINCE À CROUTE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-63367', 'ACTIF', 'PINCE À CROUTE', '28', 'PINCE À CROUTE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-63368', 'ACTIF', 'PINCE À CROUTE', '29', 'PINCE À CROUTE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-63369', 'ACTIF', 'PINCE À CROUTE', '30', 'PINCE À CROUTE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('APLE-63370', 'ACTIF', 'PINCE À CROUTE', '31', 'PINCE À CROUTE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('GOUL-63571', 'ACTIF', 'TRACKING', '73', 'GOULOTTE  ROUE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('JAUG-63909-1', 'ACTIF', 'TRACKING', '32', 'JAUGE A ANODES', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('JAUG-63909-10', 'ACTIF', 'TRACKING', '41', 'JAUGE A ANODES', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('JAUG-63909-11', 'ACTIF', 'TRACKING', '42', 'JAUGE A ANODES', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('JAUG-63909-12', 'ACTIF', 'TRACKING', '43', 'JAUGE A ANODES', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('JAUG-63909-13', 'ACTIF', 'TRACKING', '44', 'JAUGE A ANODES', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('JAUG-63909-14', 'ACTIF', 'TRACKING', '45', 'JAUGE A ANODES', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('JAUG-63909-15', 'ACTIF', 'TRACKING', '46', 'JAUGE A ANODES', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('JAUG-63909-16', 'ACTIF', 'TRACKING', '47', 'JAUGE A ANODES', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('JAUG-63909-17', 'ACTIF', 'TRACKING', '48', 'JAUGE A ANODES', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('JAUG-63909-18', 'ACTIF', 'TRACKING', '49', 'JAUGE A ANODES', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('JAUG-63909-19', 'ACTIF', 'TRACKING', '50', 'JAUGE A ANODES', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('JAUG-63909-2', 'ACTIF', 'TRACKING', '33', 'JAUGE A ANODES', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('JAUG-63909-20', 'ACTIF', 'TRACKING', '51', 'JAUGE A ANODES', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('JAUG-63909-21', 'ACTIF', 'TRACKING', '52', 'JAUGE A ANODES', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('JAUG-63909-22', 'ACTIF', 'TRACKING', '53', 'JAUGE A ANODES', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('JAUG-63909-23', 'ACTIF', 'TRACKING', '54', 'JAUGE A ANODES', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('JAUG-63909-24', 'ACTIF', 'TRACKING', '55', 'JAUGE A ANODES', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('JAUG-63909-3', 'ACTIF', 'TRACKING', '34', 'JAUGE A ANODES', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('JAUG-63909-4', 'ACTIF', 'TRACKING', '35', 'JAUGE A ANODES', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('JAUG-63909-5', 'ACTIF', 'TRACKING', '36', 'JAUGE A ANODES', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('JAUG-63909-6', 'ACTIF', 'TRACKING', '37', 'JAUGE A ANODES', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('JAUG-63909-7', 'ACTIF', 'TRACKING', '38', 'JAUGE A ANODES', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('JAUG-63909-8', 'ACTIF', 'TRACKING', '39', 'JAUGE A ANODES', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('JAUG-63909-9', 'ACTIF', 'TRACKING', '40', 'JAUGE A ANODES', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('SUPP-63372', 'ACTIF', 'TRACKING', '72', 'RACK PINCE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('SUPP-63907', 'ACTIF', 'TRACKING', '64', 'RATELIER 2 TUYAUX', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('SUPP-63908', 'ACTIF', 'TRACKING', '65', 'RATELIER 2 TUYAUX', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('SUPP-63909', 'ACTIF', 'TRACKING', '66', 'RATELIER 2 TUYAUX', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('SUPP-63910', 'ACTIF', 'TRACKING', '67', 'RATELIER 2 TUYAUX', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('SUPP-63911', 'ACTIF', 'TRACKING', '68', 'RATELIER 2 TUYAUX', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('SUPP-63912', 'ACTIF', 'TRACKING', '69', 'RATELIER 2 TUYAUX', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('SUPP-63913', 'ACTIF', 'TRACKING', '70', 'RATELIER 2 TUYAUX', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('SUPP-63914', 'ACTIF', 'TRACKING', '71', 'RATELIER 2 TUYAUX', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('SUPP-66992', 'ACTIF', 'TRACKING', '56', 'RATELIER  8 TUYAUX', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('SUPP-66993', 'ACTIF', 'TRACKING', '57', 'RATELIER  8 TUYAUX', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('SUPP-66994', 'ACTIF', 'TRACKING', '58', 'RATELIER  8 TUYAUX', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('SUPP-66995', 'ACTIF', 'TRACKING', '59', 'RATELIER  8 TUYAUX', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('SUPP-66996', 'ACTIF', 'TRACKING', '60', 'RATELIER  8 TUYAUX', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('SUPP-66997', 'ACTIF', 'TRACKING', '61', 'RATELIER  8 TUYAUX', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('SUPP-66998', 'ACTIF', 'TRACKING', '62', 'RATELIER  8 TUYAUX', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('SUPP-66999', 'ACTIF', 'TRACKING', '63', 'RATELIER  8 TUYAUX', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('TREM-63301', 'ACTIF', 'TRACKING', '107', 'TREMIE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('TREM-63302', 'ACTIF', 'TRACKING', '108', 'TREMIE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('TREM-63303', 'ACTIF', 'TRACKING', '109', 'TREMIE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('TREM-63310', 'ACTIF', 'TRACKING', '110', 'TREMIE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('TREM-63311', 'ACTIF', 'TRACKING', '111', 'TREMIE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('TREM-63312', 'ACTIF', 'TRACKING', '112', 'TREMIE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('TREM-63313', 'ACTIF', 'TRACKING', '113', 'TREMIE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('TREM-63314', 'ACTIF', 'TRACKING', '114', 'TREMIE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('TREQ-13621', 'ACTIF', 'TRACKING', '1', 'TRANSPALETTE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('TREQ-13622', 'ACTIF', 'TRACKING', '2', 'TRANSPALETTE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('TREQ-13623', 'ACTIF', 'TRACKING', '3', 'TRANSPALETTE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('TREQ-13625', 'ACTIF', 'TRACKING', '4', 'TRANSPALETTE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('TREQ-13626', 'ACTIF', 'TRACKING', '5', 'TRANSPALETTE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('TREQ-13627', 'ACTIF', 'TRACKING', '6', 'TRANSPALETTE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('TREQ-13629', 'ACTIF', 'TRACKING', '7', 'TRANSPALETTE', 'NULL');
INSERT INTO noovelia_kencee_equipment (Numero_De_Serie,Etat,Fonction,Row_id,Nom,Tag_id) VALUES ('TREQ-13630', 'ACTIF', 'TRACKING', '8', 'TRANSPALETTE', 'NULL');