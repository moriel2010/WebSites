using System;
using System.Web;
using System.Web.UI;

public partial class entryPage : System.Web.UI.Page
{
    public string stResult = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            string email = Request.Form["email"];
            string password = Request.Form["password"];

            if(email == "mondihash@gmail.com" && password == "morih2010")
            {
                Session["nihol"] = "ok";
                Session["userName"] = "מנהל מוריאל";

                Response.Redirect("managementPage.aspx");


            }
            else {


            string sql =
                "SELECT * FROM tUsers " +
                "WHERE email = N'" + email + "' " +
                "AND password = N'" + password + "'";

                System.Data.DataTable dt = MyAdoHelper.ExecuteDataTable(sql);

                if (dt.Rows.Count == 0)
                {
                    stResult = "אין נתונים";
                }
                else
                {
                    Session["user"] = "ok";
                    stResult = " אורח";
                    Session["userName"] = dt.Rows[0]["name"];
                    Session["userName"] = "אורח";
                }

                bool isExists = MyAdoHelper.IsExist(sql);

            if (isExists)
            {
                    Session["userName"] = "משתמש רשום";
                    Response.Redirect("HomePage.aspx");

                    stResult = " רשום";
                    

                }
                else
            {
                    stResult = " אורח";
                    Session["userName"] = "אורח";
                    
                }
            }
        }
    }
}
