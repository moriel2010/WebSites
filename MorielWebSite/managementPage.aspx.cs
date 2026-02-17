using System;
using System.Data;

public partial class managementPage : System.Web.UI.Page
{
    public string st = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
        {

            string name = Request.Form["firstname"];
            string fav_team = Request.Form["radio1"];
            

            string sql = "SELECT * FROM tUsers WHERE " +
                         "name = N'" + name + "' AND " +
                         "fav_team = N'" + fav_team + "'";
            //sql = "SELECT * FROM tUsers";

            DataTable dt = MyAdoHelper.ExecuteDataTable(sql);

            if (dt.Rows.Count == 0)
            {
                st = "אין נתונים";
            }
            else
            {
                st += "<table border='1'>";
                st += "<tr>";
                st += "<td>שם פרטי</td>";
                st += "<td>טלפון</td>";
                st += "<td>שחקן אהוב</td>";
                st += "<td>קבוצה אהובה</td>";
                st += "<td>תשובה פתוחה</td>";
                st += "<td>אימייל</td>";
                st += "<td>סיסמה</td>";
                st += "<td>גיל</td>";


                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    st += "<tr>";

                    for (int k = 0; k < dt.Columns.Count; k++)
                    {
                        st += "<td>" + dt.Rows[i][k] + "</td>";
                    }

                    st += "</tr>";
                }

                st += "</table>";
            }
        }
    }
}