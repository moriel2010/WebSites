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
                Response.Redirect("managementPage.aspx");

            }
            else {


            string sqlSelect =
                "SELECT * FROM tUsers " +
                "WHERE email = N'" + email + "' " +
                "AND password = N'" + password + "'";

            bool userExists = MyAdoHelper.IsExist(sqlSelect);

            if (userExists)
            {
                    Response.Redirect("HomePage.aspx");
                   
            }
            else
            {
                    stResult = "משתמש רשום";
                }
            }
        }
    }
}
