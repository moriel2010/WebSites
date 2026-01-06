using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class form : System.Web.UI.Page
{
    public string name;
    public string age;
    public string fav_team;
    public string message;
    public string phone;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            name = "name" + Request.Form["firstname"];
            phone = "phone" + Request.Form["phone"];
            fav_team = "fav_team" + Request.Form["radio"];
            message = "message" + Request.Form["message"];
            phone = "phone" + Request.Form["phone"];
            age = "age" + Request.Form["age"];
        }
    }
}