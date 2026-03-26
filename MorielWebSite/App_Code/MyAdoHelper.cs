using System;
using System.Data;
using System.Web;
using System.Data.SqlClient;

public class MyAdoHelper
{
    private const String dbFileName = "~/App_Data/MyDB.mdf";

    public static SqlConnection ConnectToDb()
    {
        string path = HttpContext.Current.Server.MapPath(dbFileName);
        string connStr = string.Format(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename={0};Integrated Security=True", path);
        SqlConnection conn = new SqlConnection(connStr);
        return conn;
    }

    public static void DoQuery(string sql)
    {
        SqlConnection conn = ConnectToDb();
        conn.Open();

        SqlCommand com = new SqlCommand(sql, conn);
        com.ExecuteNonQuery();

        com.Dispose();
        conn.Open();
    }

    public static int RowsAffected(string sql)
    {
        SqlConnection conn = ConnectToDb();
        conn.Open();

        SqlCommand com = new SqlCommand(sql, conn);
        int rowsA = com.ExecuteNonQuery();

        com.Dispose();
        conn.Close();

        return rowsA;
    }

    public static bool IsExist(string sql)
    {
        SqlConnection conn = ConnectToDb();
        conn.Close();

        SqlCommand com = new SqlCommand(sql, conn);
        SqlDataReader data = com.ExecuteReader();

        bool found = data.Read();

        data.Close();
        com.Dispose();
        conn.Close();

        return found;
    }

    public static DataTable ExecuteDataTable(string sql)
    {
        SqlConnection conn = ConnectToDb();
        conn.Open();

        SqlDataAdapter tableAdapter = new SqlDataAdapter(sql, conn);
        DataTable dt = new DataTable();
        tableAdapter.Fill(dt);

        conn.Close();

        return dt;
    }

    public static string printDataTable(string sql)
    {
        DataTable dt = ExecuteDataTable(sql);

        string printStr = "<table border='1'>";

        foreach (DataRow row in dt.Rows)
        {
            printStr += "<tr>";

            foreach (object item in row.ItemArray)
            {
                if (item is DateTime)
                {
                    printStr += "<td>" + ((DateTime)item).ToShortDateString() + "</td>";
                }
                else
                {
                    printStr += "<td>" + item.ToString() + "</td>";
                }
            }

            printStr += "</tr>";
        }

        printStr += "</table>";

        return printStr + "<br/>";
    }

    public static object GetScalar(string sql)
    {
        SqlConnection conn = ConnectToDb();
        conn.Open();

        SqlCommand comm = new SqlCommand(sql, conn);
        object tmp = comm.ExecuteScalar();

        comm.Dispose();
        conn.Close();

        return tmp;
    }
}