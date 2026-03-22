using System;
using System.Web.UI;

public partial class enrollmentPage : System.Web.UI.Page
{
    public string strResult = "";
    public string s = "";

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
            goals = Request.Form["goal"];
            league = Request.Form["text"];
            Goldballs = Request.Form["ball"];
            team = Request.Form["team"];
           

            string sqlSelect =
                "INSERT INTO MorielFootball (age, goals, league, Goldballs, team) VALUES (" + 
                 age + "'," +
                 goals + "'," +
                 "N'" + league + "," +
                Goldballs + "," +
                "N'" + team +
                ")";

            bool userExists = MyAdoHelper.IsExist(sqlSelect);

           
    }
}