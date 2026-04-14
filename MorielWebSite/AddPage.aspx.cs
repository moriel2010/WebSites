using System;
using System.Web.UI;

public partial class AddPage : System.Web.UI.Page
{
    public string age;
    public string goals;
    public string league;
    public string Goldballs;
    public string team;
    public string number;


    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            age = Request.Form["age"];
            goals = Request.Form["goals"];
            league = Request.Form["league"];
            Goldballs = Request.Form["Goldballs"];
            team = Request.Form["team"];
            number = Request.Form["number"];



            string sqlInsert =
                "INSERT INTO morielBall " +
                "(age, goals, league, GoldBall, team, number) VALUES (" +
                age + "," +
                goals + "," +
                "N'" + league + "'," +
                Goldballs + "," +
                "N'" + team + "'" +
                    "," + number +
                ")";

            MyAdoHelper.DoQuery(sqlInsert);
        }
    }
}
