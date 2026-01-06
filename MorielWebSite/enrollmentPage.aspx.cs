using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class enrollmentPage : System.Web.UI.Page
{
    public string name;
    public string age;
    public string fav_team;
    public string message;
    public string phone;
    protected void Page_Load(object sender, EventArgs e)
    {
        name = "name" + Request.Form["text"];
        age = "age" + Request.Form["age"];
        fav_team = "fav_team" + Request.Form["radio"];
        message = "message" + Request.Form["message"];
        phone = "phone" + Request.Form["phone"];



    }
}