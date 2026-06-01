using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class shlifaPage : System.Web.UI.Page
{
    public string st = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            string city = Request.Form["city"];
            string best_song = Request.Form["best_song"];

            string sql = "SELECT * FROM morielAdd WHERE 1=1";

            if (!string.IsNullOrEmpty(city))
            {
                sql += " AND city LIKE N'%" + city + "%'";
            }

            if (!string.IsNullOrEmpty(best_song))
            {
                sql += " AND best_song LIKE N'%" + best_song + "%'";
            }

            DataTable dt = MyAdoHelper.ExecuteDataTable(sql);

            if (dt.Rows.Count == 0)
            {
                st = "אין נתונים";
            }
            else
            {
                st += "<table border='1' style='color: white;'>";
                st += "<tr>";
                st += "<td>גיל</td>";
                st += "<td>עיר</td>";
                st += "<td>עוקבים</td>";
                st += "<td>פרסים</td>";
                st += "<td>אלבומים</td>";
                st += "<td>השיר הכי טוב</td>";
                st += "</tr>";

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