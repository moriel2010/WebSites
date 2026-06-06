using System;
using System.Web;
using System.Web.UI;
using System.Data;

public partial class entryPage : System.Web.UI.Page
{
    // משתנים גלובליים שה-ASPX קורא ומציג
    public string stResult = "";
    public string savedEmail = "";
    public string savedPassword = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        // בדיקה האם העמוד הגיע ב-PostBack (שליחת הטופס)
        if (IsPostBack)
        {
            // שליפת הנתונים מהשדות וניקוי רווחים מיותרים
            savedEmail = Request.Form["email"] != null ? Request.Form["email"].Trim() : "";
            savedPassword = Request.Form["password"] != null ? Request.Form["password"].Trim() : "";

            // ----- בדיקת שדות ריקים עם הודעות מותאמות אישית -----

            // מצב 1: שני השדות ריקים
            if (savedEmail == "" && savedPassword == "")
            {
                stResult = "נא להזין אימייל וסיסמה.";
                return; // עוצר את המשך הריצה
            }

            // מצב 2: רק האימייל ריק (הסיסמה נשמרת בתיבה)
            if (savedEmail == "")
            {
                stResult = "שדה אימייל הוא חובה.";
                return;
            }

            // מצב 3: רק הסיסמה ריקה (האימייל נשמר בתיבה)
            if (savedPassword == "")
            {
                stResult = "שדה סיסמה הוא חובה.";
                return;
            }

            // ----- אם הגענו לכאן, שני השדות מלאים - ממשיכים לבדיקת פרטים -----

            // 1. בדיקה ראשונה: האם זה מנהל המערכת?
            if (savedEmail.ToLower() == "mondihash@gmail.com" && savedPassword == "moriel")
            {
                Session["userRole"] = "admin";
                Session["userName"] = "מנהל מוריאל";
                Response.Redirect("managementPage.aspx");
            }
            else
            {
                // 2. בדיקה שנייה: חיפוש המשתמש בבסיס הנתונים (טבלת mSong)
                string sql = "SELECT * FROM mSong WHERE email = N'" + savedEmail + "' AND password = N'" + savedPassword + "'";

                // הרצת השאילתה דרך מחלקת העזר שלך
                DataTable dt = MyAdoHelper.ExecuteDataTable(sql);

                if (dt != null && dt.Rows.Count > 0)
                {
                    Session["userRole"] = "registered";

                    // שליפת השם מהעמודה הראשונה (אינדקס 0) בטבלה
                    Session["userName"] = dt.Rows[0][1].ToString();

                    Response.Redirect("HomePage.aspx");
                }
                else
                {
                    // אם השדות היו מלאים, אך הפרטים לא קיימים או שגויים בבסיס הנתונים
                    stResult = "אימייל או סיסמה שגויים.";
                }
            }
        }
    }
}