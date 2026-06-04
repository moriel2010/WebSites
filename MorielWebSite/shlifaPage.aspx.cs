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

        // שאילתת בסיס חכמה עם תנאי שתמיד נכון, כדי להוסיף עליו תנאים בהמשך
        string sql = "SELECT * FROM moriel WHERE 1=1";

        // אם המשתמש לחץ על כפתור החיפוש (PostBack), נשלוף את מה שהוא הקליד ונסנן
        if (IsPostBack)
        {
            string artistName = Request.Form["artistName"] != null ? Request.Form["artistName"].Trim() : "";

            // אם המשתמש רשם שם אומן - נוסיף סינון עם LIKE
            if (!string.IsNullOrEmpty(artistName))
            {
                sql += " AND artistName LIKE N'%" + artistName + "%'";
            }
        }

        // הרצת השאילתה (תרוץ תמיד - בטעינה ראשונה תביא הכל, בחיפוש תביא מסונן)
        DataTable dt = MyAdoHelper.ExecuteDataTable(sql);

        // בדיקה אם חזרו שורות מהדאטה-בייס
        if (dt == null || dt.Rows.Count == 0)
        {
            st = "<h3 style='color: #d4af37;'>לא נמצאו נתונים התואמים לחיפוש שלך בטבלה.</h3>";
        }
        else
        {
            // בניית הטבלה המעוצבת ב-HTML דינמי
            st = "<table border='1' style='color: white; background-color: rgba(0,0,0,0.6); width: 95%; text-align: center; border-collapse: collapse; font-size: 18px; margin: auto;'>";

            // שורת כותרות קבועה ויפה
            st += "<tr style='background-color: #4a148c; color: #d4af37; font-weight: bold; height: 40px;'>";
            st += "<td>גיל</td>";
            st += "<td>שם אומן</td>";
            st += "<td>עיר מוצא</td>";
            st += "<td>עוקבים ברשתות</td>";
            st += "<td>פרסים ותארים</td>";
            st += "<td>אלבומים שיצאו</td>";
            st += "<td>השיר הכי מצליח</td>";
            st += "<td>צפייה בקליפ</td>";
            st += "<td>מידע נוסף</td>";
            st += "</tr>";

            // לולאה שרצה על כל השורות שחזרו מהדאטה-בייס ומציגה אותן
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string currentSong = dt.Rows[i]["best_song"].ToString();
                string currentArtist = dt.Rows[i]["artistName"].ToString();

                st += "<tr style='height: 45px;'>";
                st += "<td>" + dt.Rows[i]["age"] + "</td>";
                st += "<td>" + currentArtist + "</td>";
                st += "<td>" + dt.Rows[i]["city"] + "</td>";
                st += "<td>" + dt.Rows[i]["followers"] + "</td>";
                st += "<td>" + dt.Rows[i]["awards"] + "</td>";
                st += "<td>" + dt.Rows[i]["Albums"] + "</td>";
                st += "<td>" + currentSong + "</td>";

                // קישור דינמי שמחפש ישירות ביוטיוב ופותח בלשונית חדשה
                string youtubeUrl = "https://www.youtube.com/results?search_query=" + HttpUtility.UrlEncode(currentArtist + " " + currentSong);
                st += "<td><a href='" + youtubeUrl + "' target='_blank' style='color: #ff0000; font-weight: bold; text-decoration: none;'>📺 צפה ב-YouTube</a></td>";

                st += "<td>" + dt.Rows[i]["bio"] + "</td>";
                st += "</tr>";
            }

            st += "</table>";
        }
    }
}