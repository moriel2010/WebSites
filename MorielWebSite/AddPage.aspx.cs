using System;
using System.Web.UI;

public partial class enrollmentPage : System.Web.UI.Page
{
    public string age;
    public string goals;
    public string league;
    public string Goldballs;
    public string team;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            age = Request.Form["age"];
            goals = Request.Form["goals"];
            league = Request.Form["league"];
            Goldballs = Request.Form["Goldballs"];
            team = Request.Form["team"];

            string sqlInsert =
                "INSERT INTO MorielFootball " +
                "(age, goals, league, Goldballs, team) VALUES (" +
                age + "," +
                goals + "," +
                "N'" + league + "'," +
                Goldballs + "," +
                "N'" + team + "'" +
                ")";

            MyAdoHelper.DoQuery(sqlInsert);
        }
    }
}
