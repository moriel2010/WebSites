using System;
using System.Web;
using System.Web.UI;
using System.Data;

public partial class entryPage : System.Web.UI.Page
{
    public string stResult = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            // שליפת הנתונים מהטופס וניקוי רווחים מהקצוות
            string email = Request.Form["email"] != null ? Request.Form["email"].Trim() : "";
            string password = Request.Form["password"] != null ? Request.Form["password"].Trim() : "";

            // 1. בדיקה ראשונה: האם זה מנהל המערכת?
            if (email.ToLower() == "mondihash@gmail.com" && password == "moriel")
            {
                Session["userRole"] = "admin";
                Session["userName"] = "מנהל מוריאל";
                Response.Redirect("managementPage.aspx");
            }
            else
            {
                // 2. בדיקה שנייה: חיפוש המשתמש בטבלת המשתמשים הרגילים tUsers
                string sql = "SELECT * FROM mSong WHERE email = N'" + email + "' AND password = N'" + password + "'";
                DataTable dt = MyAdoHelper.ExecuteDataTable(sql);

                if (dt != null && dt.Rows.Count > 0)
                {
                    Session["userRole"] = "registered";
                    // לוקח את השם מהעמודה הראשונה בטבלה (אינדקס 0)
                    Session["userName"] = dt.Rows[0][0].ToString();

                    Response.Redirect("HomePage.aspx");
                }
                else
                {
                    // אם לא נמצא מנהל ולא משתמש רגיל
                    stResult = "אימייל או סיסמה שגויים.";
                }
            }
        }
    }
}