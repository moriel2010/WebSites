using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SearchPage : System.Web.UI.Page
{
    // משתנה ציבורי שיודפס ישירות בתוך ה-HTML
    public string searchResult = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        // הגנה: מונע מאורחים שלא התחברו לאתר לצפות או להשתמש בחיפוש
        if (Session["userRole"] == null || Session["userRole"].ToString() == "guest")
        {
            Response.Redirect("entryPage.aspx");
            return;
        }

        if (IsPostBack)
        {
            // קליטת הנתונים מהטופס וניקוי רווחים מיותרים
            string city = Request.Form["searchCity"] != null ? Request.Form["searchCity"].Trim() : "";
            string minAwards = Request.Form["searchMinAwards"] != null ? Request.Form["searchMinAwards"].Trim() : "";

            // בניית שאילתת SQL דינמית ומורכבת עם תנאי בסיס תמיד נכון (1=1)
            string sql = "SELECT * FROM morielAdd WHERE 1=1";

            // אם המשתמש רשם משהו בעיר - נוסיף חיפוש חלקי (LIKE) בעברית
            if (!string.IsNullOrEmpty(city))
            {
                sql += " AND city LIKE N'%" + city + "%'";
            }

            // אם המשתמש הציב רף מינימלי של פרסים - נוסיף סינון של "גדול או שווה" (>=)
            if (!string.IsNullOrEmpty(minAwards))
            {
                sql += " AND awards >= " + minAwards;
            }

            // הרצת השאילתה מול בסיס הנתונים
            DataTable dt = MyAdoHelper.ExecuteDataTable(sql);

            // בדיקה האם נמצאו תוצאות מתאימות
            if (dt == null || dt.Rows.Count == 0)
            {
                searchResult = "<h3 style='color: #d4af37;'>לא נמצאו פריטים באוסף העונים על תנאי החיפוש הללו.</h3>";
            }
            else
            {
                // בניית טבלת התוצאות ב-HTML דינמי מעוצב
                searchResult += "<table border='1' style='color: white; background-color: rgba(0,0,0,0.6); width: 85%; text-align: center; border-collapse: collapse; font-size: 18px;'>";

                // כותרת הטבלה (מותאם בול לשדות של טבלת morielAdd)
                searchResult += "<tr style='background-color: #4a148c; color: #d4af37; font-weight: bold; height: 40px;'>";
                searchResult += "<td>גיל</td>";
                searchResult += "<td>עיר מוצא</td>";
                searchResult += "<td>עוקבים</td>";
                searchResult += "<td>פרסים ותארים</td>";
                searchResult += "<td>אלבומים</td>";
                searchResult += "<td>השיר הכי טוב</td>";
                searchResult += "</tr>";

                // מעבר בלולאה על כל הרשומות שנמצאו והדפסתן בתוך שורות הטבלה
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    searchResult += "<tr style='height: 35px;'>";
                    searchResult += "<td>" + dt.Rows[i]["age"] + "</td>";
                    searchResult += "<td>" + dt.Rows[i]["city"] + "</td>";
                    searchResult += "<td>" + dt.Rows[i]["followers"] + "</td>";
                    searchResult += "<td>" + dt.Rows[i]["awards"] + "</td>";
                    searchResult += "<td>" + dt.Rows[i]["Albums"] + "</td>";
                    searchResult += "<td>" + dt.Rows[i]["best_song"] + "</td>";
                    searchResult += "</tr>";
                }

                searchResult += "</table>";
            }
        }
    }
}