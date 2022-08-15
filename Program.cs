using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using static ConsoleApp4.Algo;

namespace ConsoleApp4
{
    internal class Program
    { public static void  FolderProperty(){
            string datetime = DateTime.Now.ToString("yyyyMMddHHmmss");
            string FileNamePart = "Dectection_Brute";//Datetime will be added to it
            string DestinationFolder = @"C:\Log\";

            string FileDelimiter = ";"; //You can provide comma or pipe or whatever you like
            string FileExtension = ".csv"; //Provide the extension you like such as .txt or .csv

            string FileFullPath = $"{DestinationFolder}\\{FileNamePart}_{datetime}{FileExtension}";


        }
        static void Main(string[] args)
        {
            string datetime = DateTime.Now.ToString("yyyyMMddHHmmss");
            string LogFolder = @"C:\Log\";
            try
            {
                Console.WriteLine("Generation en cours du document csv");

                //Declare Variables and provide values
                string FileNamePart = "Dectection_Brute";//Datetime will be added to it
                string DestinationFolder = @"C:\Log\";

                string FileDelimiter = ";"; //You can provide comma or pipe or whatever you like
                string FileExtension = ".csv"; //Provide the extension you like such as .txt or .csv


                //Create Connection to SQL Server in which you like to load files
                SqlConnection SQLConnection = new SqlConnection();
                SQLConnection.ConnectionString = @"Data Source = ABI-SMT-SQL-CL1.apm.alcoa.com; Database =SMART DFRM ;Integrated Security=SSPI";

                //Read data from table or view to data table
                //               string query = @" SELECT D.[detection_id],D.[reader_uwb_id]
                //     ,D.[tag_id]
                //     ,D.[tag_temperature]
                //     ,D.[distance]
                //     ,D.[tag_motion]
                //     ,D.[insert_timestamp]
                //  , FORMAT(D.insert_timestamp, 'yyyy-MM-dd') as date
                //, FORMAT(D.insert_timestamp, 'hh:mm:s s') as time
                //  ,A.Reader_uwb_id
                //  ,E.Emplacement
                //  ,E.Fonction

                // FROM[ABI-MES-SQL-CL1.APM.ALCOA.COM].[RFID_SURAL].[dbo].[noovelia_kencee_detection] as D
                //  INNER JOIN[ABI-MES-QA.APM.ALCOA.COM].[RFID_SURAL_2].[dbo].[noovelia_kencee_antenne]
                //as A ON A.Reader_uwb_id = D.reader_uwb_id and A.Etat = 'ACTIF'
                //INNER JOIN[ABI-MES-QA.APM.ALCOA.COM].[RFID_SURAL_2].[dbo].[noovelia_kencee_Emplacement] as E
                //ON A.Emplacement = E.Emplacement and E.Fonction = 'Suivi de lopération de la pince à croute lors des changements danodes'
                // WHERE insert_timestamp >= '08:00:00'
                //ORDER BY detection_id Asc";
                string query = @" 
           SELECT 
D.[detection_id],
 D.[reader_uwb_id]
      ,D.[tag_id]
      ,D.[tag_temperature]
      ,D.[distance]
      ,D.[tag_motion]
      ,D.[insert_timestamp]

  FROM[ABI-MES-SQL-CL1.APM.ALCOA.COM].[RFID_SURAL].[dbo].[noovelia_kencee_detection] as D
  WHERE D.distance BETWEEN 1.88 and 15.82 and insert_timestamp >'2021-12-31'
 ORDER BY detection_id Asc";
                string query2 = @" 
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
  WHERE (D.[insert_timestamp] >= '2022-07-13 08:00:00.000' and  D.[insert_timestamp]<'2022-07-14 08:00:00.000')  and (D.distance BETWEEN  1.88 and 15.82 ) 
ORDER BY D.detection_id Asc  ";

                SqlCommand cmd = new SqlCommand(query2, SQLConnection);
                SQLConnection.Open();
                DataTable d_table = new DataTable();
                d_table.Load(cmd.ExecuteReader());
                Console.WriteLine(d_table);
                SQLConnection.Close();

                //Prepare the file path 

                string FileFullPath = $"{DestinationFolder}\\{FileNamePart}_{datetime}{FileExtension}";

                StreamWriter sw = null;
                sw = new StreamWriter(FileFullPath, false);

                // Write the Header Row to File
                int ColumnCount = d_table.Columns.Count;
                for (int ic = 0; ic < ColumnCount; ic++)
                {
                    sw.Write(d_table.Columns[ic]);
                    if (ic < ColumnCount - 1)
                    {
                        sw.Write(FileDelimiter);
                    }
                }
                Console.WriteLine("50%");
                sw.Write(sw.NewLine);

                // Write All Rows to the File
                foreach (DataRow dr in d_table.Rows)
                {
                    for (int ir = 0; ir < ColumnCount; ir++)
                    {
                        if (!Convert.IsDBNull(dr[ir]))
                        {
                            sw.Write(dr[ir].ToString());
                        }
                        if (ir < ColumnCount - 1)
                        {
                            sw.Write(FileDelimiter);
                        }
                    }
                    sw.Write(sw.NewLine);

                }
                Console.WriteLine("100%");
                Console.WriteLine("ALGO EN COURS");
                
                sw.Close();
                string[][] BD; // importer de la BD
                string[][] cp; // tableau final
                int[][] bd; // ligne trier pour 5 point consecutif et nombre de point consecutif
                int[] ligne; // tableau des lignes en 7m et 15m
                int[][] CP; // tableau des coups de pince

                int k = 0;
                int m = 0;
                int n = 0;
                double? tempo = 0.0; // variable temporaire pour etape 4

                double[][] numero_anodes = new double[][]
                {
                new double[] {8, 9, 7.893},
                new double[] {7, 10, 8.954},
                new double[] {6, 11, 10.515},
                new double[] {5, 12, 11.076},
                new double[] {4, 13, 12.137},
                new double[] {3, 14, 13.198},
                new double[] {2, 15, 14.259},
                new double[] {1, 16, 15.32}
                };

                //System.out.println(k);

                /* etape 1
                 * etape 2
                 *
                 *
                 *
                 *
                 *
                 */

                int x = 0;
                string st;
                string[] mots = null;
                int size = 0;
                //https://github.com/Nebrosed/ABI1/blob/ef5b82968537c1d85728f105f441b8840e3fd16a/PC/DETECTION_DATA_ANODES2.txt
                //https://github.com/Nebrosed/ABI1/blob/main/PC/DETECTION_DATA_ANODES2.txt
                ///workspace/ABI1/PC/DETECTION_DATA_ANODES2.txt
                //PC/DETECTION_DATA_ANODES2.txt
               


                using (StreamReader br = new StreamReader($"{DestinationFolder}\\{FileNamePart}_{datetime}{FileExtension}"))
                {
                    while (!string.ReferenceEquals((st = br.ReadLine()), null))
                    {
                        size = size + 1;
                    }
                }

                Console.WriteLine(size);
                //JAVA TO C# CONVERTER NOTE: The following call to the 'RectangularArrays' helper class reproduces the rectangular array initialization that is automatic in Java:
                //ORIGINAL LINE: BD = new string[(size)][8]; // tableau
                BD = RectangularArrays.RectangularStringArray((size), 8); // tableau
                ligne = new int[(size)];

                using (StreamReader br = new StreamReader($"{DestinationFolder}\\{FileNamePart}_{datetime}{FileExtension}"))
                {
                    while (!string.ReferenceEquals((st = br.ReadLine()), null))
                    {
                        mots = st.Split(';');
                        for (int i = 0; i < 6; i++)
                        {
                            BD[x][i] = mots[i];
                        }

                        x = x + 1;
                        BD[x - 1][6] = x.ToString();
                    }
                }

                Console.WriteLine(BD[8478][4]);
                Console.WriteLine(BD[1][4]);
                Console.WriteLine(BD[2][4]);
                m = 0;
                for (int i = 1; i < size; i++)
                {
                    double extremite1 = Convert.ToDouble(BD[i][4]);
                    double extremite2 = Convert.ToDouble(BD[i][4]);
                    if (BD != null && (extremite1 > 7.393) & extremite2 < 15.82)
                    {
                        ligne[m] = i;
                        //Console.WriteLine(ligne[m]);
                        m = m + 1;
                    }

                    //Console.WriteLine(m);
                }






                bd = new int[(m)][];
                bd = RectangularArrays.RectangularIntArray((m), 8);
                cp = new string[bd.Length][];
                cp = RectangularArrays.RectangularStringArray(bd.Length, 8);
                Console.WriteLine(bd.Length);






                k = 0; // variable pour placer la ligne dans le tableau bd
                n = 0; // variable du nombre de point consecutif
                tempo = 0.0;

                tempo = Convert.ToDouble(BD[ligne[0]][4]);

                Console.WriteLine(ligne[0]);
                Console.WriteLine(" - ");
                Console.WriteLine(tempo);

                n = 0;

                for (int i = 1;
                     i < bd.Length;
                     i++)
                {
                    if ((Convert.ToDouble(BD[ligne[i]][4]) - 0.4) < tempo.Value &
                        (Convert.ToDouble(BD[ligne[i]][4]) + 0.4) > tempo.Value & ligne[i] == ligne[i - 1] + 1)
                    {
                        n = n + 1;
                        tempo = Convert.ToDouble(BD[ligne[i]][4]);
                        //Console.WriteLine(ligne[i]-1);
                        //Console.WriteLine(" - ");
                        //Console.WriteLine(BD[ligne[i]-1][4]);
                        //Console.WriteLine(" - ");
                        //Console.WriteLine(ligne[i]);
                        //Console.WriteLine(" - ");
                        //Console.WriteLine(tempo);
                    }
                    else
                    {
                        if (n > 4)
                        {
                            bd[k][0] = ligne[i - 1];
                            bd[k][1] = n;
                            //System.out.print(bd[k][0]);
                            //System.out.print(" - ");
                            //System.out.print(bd[k][1]);
                            //System.out.print(" - ");
                            //System.out.println(k);
                            k = k + 1;
                            tempo = Convert.ToDouble(BD[ligne[i]][4]);
                            n = 1;
                        }

                        tempo = Convert.ToDouble(BD[ligne[i]][4]);
                        n = 1;
                    }
                }

                //JAVA TO C# CONVERTER NOTE: The following call to the 'RectangularArrays' helper class reproduces the rectangular array initialization that is automatic in Java:
                //ORIGINAL LINE: CP = new int[k][2];
                CP = RectangularArrays.RectangularIntArray(k, 2);

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
                {
                    for (int i = 0; i < 10; i++)
                    {
                        if ((Convert.ToDouble(BD[bd[j][0] + i][4]) > 3.8) & (Convert.ToDouble(BD[bd[j][0] + i][4]) < 5.2))
                        {
                            n = n + 1;
                            if (n > 1)
                            {
                                CP[k][0] = bd[j][0];
                                CP[k][1] = bd[j][1];
                                k = k + 1;
                                i = 10;
                                //System.out.print(BD[bd[j][0]][4]);
                                //System.out.print(" - ");
                                //System.out.print(CP[k - 1][0]);
                                //System.out.print(" - ");
                                //System.out.print(CP[k - 1][1]);
                                //System.out.print(" - ");
                                //System.out.println(k - 1);
                            }
                        }
                        else
                        {
                            n = 1;
                        }
                    }
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

                string fileName = $"{DestinationFolder}\\{FileNamePart + "final"}_{datetime}{FileExtension}";
                //string encoding = "UTF-8";
                StreamWriter writer = new StreamWriter(fileName);
                //  var entete= string.Format("{0};{1};{2};{3};{4};{5};{6}",numero_anodes,scope_time,time)
                writer.WriteLine("anode_number;scope_time;line_number");


                for (int j = 0; j < k; j++)
                {
                    //System.out.print(BD[CP[j][0] - 1][4]);
                    //System.out.print(" - ");
                    //System.out.println(j);

                    for (int i = 0; i < 8; i++)
                    {
                        if ((Convert.ToDouble(BD[CP[j][0] - 1][4]) > numero_anodes[i][2] - 0.5305) &
                            (Convert.ToDouble(BD[CP[j][0] - 1][4]) <= numero_anodes[i][2] + 0.5305))
                        {
                            cp[j][0] = numero_anodes[i][0].ToString(); // numero de l<anode
                                                                       //System.out.print(j);
                                                                       //System.out.print(" - ");
                            writer.WriteLine(cp[j][0] + " --- " + numero_anodes[i][1]);
                            //writer.WriteLine(";");
                            /*cp[j][1] = BD[CP[j][0] - 1][5].ToString(); // nom de la location
                            writer.WriteLine(cp[j][1]);
                            writer.WriteLine(";");*/
                            cp[j][2] = (CP[j][1] * 5).ToString(); // nombre de temps passer a l<anode
                            writer.WriteLine(cp[j][2] + "sec");
                            cp[j][4] = CP[j][0].ToString(); //numero de la ligne
                            writer.WriteLine(cp[j][4]);




                        }
                    }
                }
            }


            
            
            catch (Exception exception)
            {

                Console.WriteLine(exception);



            }
            
            Console.ReadLine();
           

        }

    }
}

