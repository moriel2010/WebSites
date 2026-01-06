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
    public string fav_professions;
    public string fav_animal;
    public string phone;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            name = "name:" + Request.Form["firstname"];
            phone = "phone:" + Request.Form["phone"];
            fav_professions = "fav_professions:" + Request.Form["check2"];
            fav_animal = "fav_animal:" + Request.Form["radio1"];
            age = "age:" + Request.Form["age"];
        }
    }
}