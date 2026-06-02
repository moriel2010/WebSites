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
        // הגנה: רק משתמש רשום או מנהל יכולים לצפות בדף השליפה. אורח נזרק החוצה
        if (Session["userRole"] == null || Session["userRole"].ToString() == "guest")
        {
            Response.Redirect("entryPage.aspx");
            return;
        }

        if (IsPostBack)
        {
            string city = Request.Form["city"] != null ? Request.Form["city"].Trim() : "";
            string best_song = Request.Form["best_song"] != null ? Request.Form["best_song"].Trim() : "";

            // שאילתת בסיס חכמה עם תנאי שתמיד נכון, כדי להוסיף עליו תנאים בהמשך
            string sql = "SELECT * FROM morielAdd WHERE 1=1";

            // אם המשתמש רשם עיר - נוסיף סינון של עיר עם LIKE (חיפוש חלקי)
            if (!string.IsNullOrEmpty(city))
            {
                sql += " AND city LIKE N'%" + city + "%'";
            }

            // אם המשתמש רשם שיר - נוסיף סינון של שיר
            if (!string.IsNullOrEmpty(best_song))
            {
                sql += " AND best_song LIKE N'%" + best_song + "%'";
            }

            // הפעלת השאילתה מול מסד הנתונים
            DataTable dt = MyAdoHelper.ExecuteDataTable(sql);

            // בדיקה אם חזרו שורות מהדאטה-בייס
            if (dt == null || dt.Rows.Count == 0)
            {
                st = "<h3 style='color: #d4af37;'>לא נמצאו נתונים התואמים לחיפוש שלך בטבלה.</h3>";
            }
            else
            {
                // בניית הטבלה המעוצבת ב-HTML דינמי
                st += "<table border='1' style='color: white; background-color: rgba(0,0,0,0.6); width: 85%; text-align: center; border-collapse: collapse; font-size: 18px;'>";

                // שורת כותרות קבועה ויפה
                st += "<tr style='background-color: #4a148c; color: #d4af37; font-weight: bold; height: 40px;'>";
                st += "<td>גיל</td>";
                st += "<td>עיר מוצא</td>";
                st += "<td>עוקבים ברשתות</td>";
                st += "<td>פרסים ותארים</td>";
                st += "<td>אלבומים שיצאו</td>";
                st += "<td>השיר הכי מצליח</td>";
                st += "</tr>";

                // לולאה שרצה על כל השורות שחזרו מהדאטה-בייס ומציגה אותן
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    st += "<tr style='height: 35px;'>";
                    st += "<td>" + dt.Rows[i]["age"] + "</td>";
                    st += "<td>" + dt.Rows[i]["city"] + "</td>";
                    st += "<td>" + dt.Rows[i]["followers"] + "</td>";
                    st += "<td>" + dt.Rows[i]["awards"] + "</td>";
                    st += "<td>" + dt.Rows[i]["Albums"] + "</td>";
                    st += "<td>" + dt.Rows[i]["best_song"] + "</td>";
                    st += "</tr>";
                }

                st += "</table>";
            }
        }
    }
}