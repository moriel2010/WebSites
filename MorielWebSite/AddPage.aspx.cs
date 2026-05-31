using System;
using System.Web.UI;

public partial class AddPage : System.Web.UI.Page
{
    public string age;
    public string city;
    public string followers;
    public string awards;
    public string Albums;
    public string best_song;


    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            age = Request.Form["age"];
            city = Request.Form["city"];
            followers = Request.Form["followers"];
            awards = Request.Form["awards"];
            Albums = Request.Form["Albums"];
            best_song = Request.Form["best_song"];



            string sqlInsert =
                "INSERT INTO morielAdd " +
                "(age, city, followers, awards, Albums, best_song) VALUES (" +
                age + "," +
                "N'" + city + "'," +       
                "N'" + followers + "'," +
                awards + "," +
                "N'" + Albums + "'," +
                "N'" + best_song + "'" +  
                ")";

            MyAdoHelper.DoQuery(sqlInsert);
        }
    }
}
