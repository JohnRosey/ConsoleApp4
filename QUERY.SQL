
SELECT   ( detection_id  ) ,
      D.[reader_uwb_id]
      ,D.[tag_id]
,D.tag_temperature
      ,D.[distance],A.Nom_Emplacement
      ,D.[insert_timestamp]   
  
  FROM [ABI-MES-SQL-CL1.APM.ALCOA.COM].[RFID_SURAL].[dbo].[noovelia_kencee_detection] as D
  
INNER JOIN [ABI-MES-QA.APM.ALCOA.COM].[RFID_SURAL_2].dbo.noovelia_kencee_antenne as A
ON A.Reader_uwb_id=D.reader_uwb_id 

INNER JOIN [ABI-MES-QA.APM.ALCOA.COM].[RFID_SURAL_2].dbo.noovelia_kencee_balise as B
ON B.Fonction='PINCE À CROUTE' and A.fonction='PINCE À CROUTE' WHERE [insert_timestamp]>='2022-05-31' and A.Etat='ACTIF'
and B.Nom_Emplacement=A.Nom_Emplacement    
ORDER BY Emplacement ,detection_id asc
