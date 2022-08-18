using System;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using static System.Console;
using static System.Convert;

namespace ConsoleApp4
{
    internal class Program
    {
        private static void Main(string[] args)
        {
            var datetime = DateTime.Now.ToString("yyyyMMddHHmmss");
            var LogFolder = @"C:\Log\";
            try
            {
                WriteLine("Generation en cours du document csv");

                //Declare Variables and provide values
                var FileNamePart = "Detection"; //Datetime will be added to it
                var DestinationFolderWriter = @"O:\Temporaire\Olivier Fortin\Fichier ecriture csv";
                var DestinationFolderReader = @"O:\Temporaire\Olivier Fortin\Fichier lecture csv";

                var FileDelimiter = ";"; //You can provide comma or pipe or whatever you like
                var FileExtension = ".csv"; //Provide the extension you like such as .txt or .csv


                //Create Connection to SQL Server in which you like to load files


                var SQLConnection = new SqlConnection();
                SQLConnection.ConnectionString =
                    @"Data Source = ABI-SMT-SQL-CL1.apm.alcoa.com; Database =SMART DFRM ;Integrated Security=SSPI";

                var query = @"SELECT   ( detection_id  ) ,
      D.[reader_uwb_id]
      ,D.[tag_id]
,D.tag_temperature
      ,D.[distance],Emplacement
      ,D.[insert_timestamp]   
  
  FROM [ABI-MES-SQL-CL1.APM.ALCOA.COM].[RFID_SURAL].[dbo].[noovelia_kencee_detection] as D
  
INNER JOIN [ABI-MES-QA.APM.ALCOA.COM].[RFID_SURAL_2].dbo.noovelia_kencee_antenne as A
ON A.Reader_uwb_id=D.reader_uwb_id 

INNER JOIN [ABI-MES-QA.APM.ALCOA.COM].[RFID_SURAL_2].dbo.noovelia_kencee_balise as B
ON B.Fonction='PINCE À CROUTE' and A.fonction='PINCE À CROUTE' WHERE [insert_timestamp]>='2022-05-31'
and B.Nom_Emplacement=A.Nom_Emplacement    
ORDER BY Emplacement ,detection_id desc";



                var query2 = @" 
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
  WHERE (D.[insert_timestamp] >= @yesterday +'08:00:00.000' and  D.[insert_timestamp]<@today +'08:00:00.000')  and (D.distance BETWEEN  1.88 and 15.82 ) 
ORDER BY D.detection_id Asc  ";

                var cmd = new SqlCommand(query, SQLConnection);
                SQLConnection.Open();
                var d_table = new DataTable();
                d_table.Load(cmd.ExecuteReader());
                WriteLine(d_table);
                SQLConnection.Close();

                //Prepare the file path 

                var FileFullPath =
                    $"{DestinationFolderWriter}\\{FileNamePart + "_" + "BRUTE"}_{datetime}{FileExtension}";

                StreamWriter sw = null;
                sw = new StreamWriter(FileFullPath, false);

                //// Write the Header Row to File
                var ColumnCount = d_table.Columns.Count;
                for (var ic = 0; ic < ColumnCount; ic++)
                {
                    sw.Write(d_table.Columns[ic]);
                    if (ic < ColumnCount - 1) sw.Write(FileDelimiter);
                }

                WriteLine("50%");
                sw.Write(sw.NewLine);

                //// Write All Rows to the File
                foreach (DataRow dr in d_table.Rows)
                {
                    for (var ir = 0; ir < ColumnCount; ir++)
                    {
                        if (!IsDBNull(dr[ir])) sw.Write(dr[ir].ToString());
                        if (ir < ColumnCount - 1) sw.Write(FileDelimiter);
                    }

                    sw.Write(sw.NewLine);
                }

                WriteLine("100%");
                WriteLine("ALGO EN COURS");

                sw.Close();
                string[][] BD; // importer de la BD
                string[][] cp; // tableau final
                int[][] bd; // ligne trier pour 5 point consecutif et nombre de point consecutif
                int[] ligne; // tableau des lignes en 7m et 15m
                int[][] CP; // tableau des coups de pince

                var k = 0;
                var m = 0;
                var n = 0;
                double? tempo = 0.0; // variable temporaire pour etape 4

                double[][] numero_anodes =
                {
                    new[] { 8, 9, 7.893 },
                    new[] { 7, 10, 8.954 },
                    new[] { 6, 11, 10.515 },
                    new[] { 5, 12, 11.076 },
                    new[] { 4, 13, 12.137 },
                    new[] { 3, 14, 13.198 },
                    new[] { 2, 15, 14.259 },
                    new[] { 1, 16, 15.32 }
                };

                WriteLine(k);

                /* etape 1
                 * etape 2
                 *
                 *
                 *
                 *
                 *
                 */

                var x = 0;
                string st;
                string[] mots = null;
                int size = 0;
                //https://github.com/Nebrosed/ABI1/blob/ef5b82968537c1d85728f105f441b8840e3fd16a/PC/DETECTION_DATA_ANODES2.txt
                //https://github.com/Nebrosed/ABI1/blob/main/PC/DETECTION_DATA_ANODES2.txt
                ///workspace/ABI1/PC/DETECTION_DATA_ANODES2.txt
                //PC/DETECTION_DATA_ANODES2.txt


                using (var br = new StreamReader(FileFullPath))
                    // using (StreamReader br = new StreamReader(@"A:\ABI1\PC\detection.csv"))

                {
                    while (!ReferenceEquals(st = br.ReadLine(), null)) size += 1;
                }

                WriteLine("Le nombre de lignes est de : " + size);
                
                WriteLine("Separation des colones en cours avec des ';'");
                BD = Algo.RectangularArrays.RectangularStringArray(size, 8); // tableau du nombre d'elements +1
                ligne = new int[size];

                using (var br = new StreamReader(FileFullPath))
                {
                    while (!ReferenceEquals(st = br.ReadLine(), null))
                    {
                        mots = st.Split(';');
                        for (int i = 0; i < 6; i++) BD[x][i] = mots[i];

                        x += 1;
                        BD[x - 1][6] = x.ToString();
                    }
                }


                //Console.Write(BD[8478][8]);
                m = 0;
                for (int i = 1; i < size; i++)
                {
                    var extremite1 = double.Parse(BD[i][4], CultureInfo.InvariantCulture);
                    var extremite2 = double.Parse(BD[i][4], CultureInfo.InvariantCulture);
                    if ((extremite1 > 7.393) & (extremite2 < 15.82))
                    {
                        ligne[m] = i;
                        m += 1;
                    }
                }


                bd = Algo.RectangularArrays.RectangularIntArray(m, 8);
                cp = Algo.RectangularArrays.RectangularStringArray(bd.Length, 8);
                WriteLine("La longeur est de : "+bd.Length);


                k = 0; // variable pour placer la ligne dans le tableau bd
                n = 0; // variable du nombre de point consecutif
                tempo = 0.0;

                tempo = double.Parse(BD[ligne[0]][4], CultureInfo.InvariantCulture);


                n = 0;

                for (int i = 1;
                     i < bd.Length;
                     i++)
                    if ((double.Parse(BD[ligne[i]][4], CultureInfo.InvariantCulture) - 0.4 < tempo.Value) &
                        (double.Parse(BD[ligne[i]][4], CultureInfo.InvariantCulture) + 0.4 > tempo.Value) &
                        (ligne[i] == ligne[i - 1] + 1))
                    {
                        n += 1;
                        tempo = double.Parse(BD[ligne[i]][4], CultureInfo.InvariantCulture);
                    }
                    else
                    {
                        if (n > 4)
                        {
                            bd[k][0] = ligne[i - 1];
                            bd[k][1] = n;

                            k++;
                            tempo = double.Parse(BD[ligne[i]][4], CultureInfo.InvariantCulture);
                            n = 1;
                        }

                        tempo = double.Parse(BD[ligne[i]][4], CultureInfo.InvariantCulture);
                        n = 1;
                    }

                //JAVA TO C# CONVERTER NOTE: The following call to the 'RectangularArrays' helper class reproduces the rectangular array initialization that is automatic in Java:
                //ORIGINAL LINE: CP = new int[k][2];
                CP = Algo.RectangularArrays.RectangularIntArray(k, 2);

                /*
                 *
                 *
                 *
                 * etape 5
                 *
                 */

                n = 1; // variable du nombre de point consecutif
                k = 0;

                for (int j = 0; j < CP.Length; j++)
                for (int i = 0; i <= 10; i++)
                    if ((double.Parse(BD[bd[j][0] + i][4], CultureInfo.InvariantCulture) > 3.8) &
                        (double.Parse(BD[bd[j][0] + i][4], CultureInfo.InvariantCulture) < 5.2))
                    {
                        n += 1;
                        if (n > 1)
                        {
                            CP[k][0] = bd[j][0];
                            CP[k][1] = bd[j][1];
                            k += 1;
                            i = 10;
                        }
                    }
                    else
                    {
                        n = 1;
                    }

                /*
                 *
                 *
                 *
                 *
                 * etape 6
                 *
                 */

                //FileWriter fw = new FileWriter("PC/DETECTION_DATA_ANODES2.txt");
                WriteLine("Comptage du nombre de coup de pinces");
                var fileName =
                    $"{DestinationFolderReader}\\{FileNamePart + "_" + "TRAITER"}_{datetime}{FileExtension}"; //string encoding = "UTF-8";
                TextWriter writer = new StreamWriter(fileName);
                //  var entete= string.Format("{0};{1};{2};{3};{4};{5};{6}",numero_anodes,scope_time,time)
                writer.Write("numero_anode;emplacement;temps_passer;timestamp;numero_de_ligne\n");

                // writer.Write(writer.NewLine);
                for (int j = 0; j < k; j++)
                    //WriteLine(BD[CP[j][0] - 1][4]);
                    //WriteLine(" - ");
                    //WriteLine(j);
                    //WriteLine(k);
                for (int i = 0; i < 8; i++)
                    if ((double.Parse(BD[CP[j][0] - 1][4], CultureInfo.InvariantCulture) >
                         numero_anodes[i][2] - 0.5305) &
                        (double.Parse(BD[CP[j][0] - 1][4], CultureInfo.InvariantCulture) <=
                         numero_anodes[i][2] + 0.5305))
                    {
                        cp[j][0] = numero_anodes[i][0].ToString(CultureInfo.InvariantCulture); // numero de l<anode

                        //System.out.print(j);
                        //System.out.print(" - ");
                        writer.Write(cp[j][0] + " --- " + numero_anodes[i][1]);
                        writer.Write(";");
 cp[j][1] = BD[ToInt32(Convert.ToString(CP[j][0].ToString())) - 1][5];//Emplacement 
                        writer.Write(cp[j][1]);
                        writer.Write(";");

                        cp[j][2] = (CP[j][1] * 5).ToString(); // nombre de temps passer a l<anode
                        writer.Write(cp[j][2] + "sec");
                        writer.Write(";");

                       

                        cp[j][3] = BD[ToInt32(Convert.ToString(CP[j][0].ToString()))][6];//Timestamp
                        writer.Write(cp[j][3]);
                        writer.Write(";");

                        cp[j][4] = (CP[j][0],
                            CultureInfo.InvariantCulture).ToString(); //numero de la ligne
                        writer.Write(cp[j][4]);
                        writer.WriteLine(";");
                        i = 8;
                    }

                writer.Close();

                WriteLine(k);
                //File.Delete(FileFullPath);
            }


            catch (Exception exception)
            {
                WriteLine(exception);
            }

            WriteLine("Fini");
            ReadLine();
        }
    }
}
