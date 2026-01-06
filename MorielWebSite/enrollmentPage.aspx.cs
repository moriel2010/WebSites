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
    public string fav_player;
    public string prime_team;
    public string phone;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        { 
        name = "name:" + Request.Form["firstname"];
         phone = "phone:" + Request.Form["phone"];
        fav_player = "fav_player:" + Request.Form["check2"];
        prime_team = "prime_team:" + Request.Form["radio1"];
         age = "age:" + Request.Form["age"];
        }
    }
}