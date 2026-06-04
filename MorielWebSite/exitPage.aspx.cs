using System;
using System.Web;
using System.Web.UI;

public partial class exitPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // ניקוי מוחלט של ה-Session הנוכחי
        Session.Abandon();
        Session.Clear();

        // העברה אוטומטית של המשתמש לדף הבית או לדף הכניסה
        Response.Redirect("HomePage.aspx");
    }
}