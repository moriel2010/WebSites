using System;
using System.Web;
using System.Web.UI;

public partial class MasterPage1 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = "+שירים";

        // הגנה: הגדרת אורח תתבצע רק בטעינה הראשונה של האתר, ולא בלחיצה על כפתור (PostBack)
        if (!IsPostBack)
        {
            if (Session["userRole"] == null)
            {
                Session["userRole"] = "guest";
                Session["userName"] = "אורח";
            }
        }

        // שליפת התפקיד הנוכחי מתוך ה-Session
        string role = Session["userRole"] != null ? Session["userRole"].ToString() : "guest";

        // חוקי הצגה והסתרה לפי סוג המשתמש
        if (role == "guest")
        {
            linkRegister.Visible = true;
            linkLogin.Visible = true;

            linkKefel.Visible = false;
            linkShlifa.Visible = false;
            linkAdd.Visible = false;
            linkAdmin.Visible = false;
            linkExit.Visible = false;
        }
        else if (role == "registered")
        {
            linkRegister.Visible = false;
            linkLogin.Visible = false;

            linkKefel.Visible = true;
            linkShlifa.Visible = true;
            linkAdd.Visible = true;
            linkExit.Visible = true;

            linkAdmin.Visible = false;
        }
        else if (role == "admin")
        {
            linkRegister.Visible = false;
            linkLogin.Visible = false;

            linkKefel.Visible = true;
            linkShlifa.Visible = true;
            linkAdd.Visible = true;
            linkExit.Visible = true;
            linkAdmin.Visible = true;
        }
    }
}