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
    public string fav_team;
    public string email;
    public string password;
    public string open_answer;
    public string phone;
    public string s;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        { 

            string name = Request.Form["firstname"];
            string phone = Request.Form["phone"];
            string fav_player = Request.Form["check2"];
            string fav_team = Request.Form["fav_team"];
            string email = Request.Form["email"];
            string password = Request.Form["password"];
            string open_answer = Request.Form["open_answer"];
            string age = Request.Form["age"];

            string str =
    "INSERT INTO tUsers VALUES (" +
       "N'" + name + "'," +
       "N'" + phone + "'," +
       "N'" + fav_player + "'," +
        "N'" + fav_team + "'," +
        "N'" + email + "'," +
        "N'" + password + "'," +
        "N'" + open_answer + "'," +
        "N'" + age + "'" +
        ")";

            MyAdoHelper.DoQuery("MyDB.mdf", str);
            
            s = "נרשמת בהצלחה!";
        }
    }
}