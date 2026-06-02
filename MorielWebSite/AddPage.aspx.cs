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
        // הגנה: רק משתמש רשום או מנהל יכולים להוסיף פריטים
        if (Session["userRole"] == null || Session["userRole"].ToString() == "guest")
        {
            Response.Redirect("entryPage.aspx");
            return;
        }

        if (IsPostBack)
        {
            age = !string.IsNullOrEmpty(Request.Form["age"]) ? Request.Form["age"] : "0";
            city = Request.Form["city"] != null ? Request.Form["city"].Trim() : "";
            followers = Request.Form["followers"] != null ? Request.Form["followers"].Trim() : "";
            awards = !string.IsNullOrEmpty(Request.Form["awards"]) ? Request.Form["awards"] : "0";
            Albums = Request.Form["Albums"] != null ? Request.Form["Albums"].Trim() : "";
            best_song = Request.Form["best_song"] != null ? Request.Form["best_song"].Trim() : "";

            string sqlInsert =
                "INSERT INTO morielAdd (age, city, followers, awards, Albums, best_song) VALUES (" +
                age + ", " +
                "N'" + city + "', " +
                "N'" + followers + "', " +
                awards + ", " +
                "N'" + Albums + "', " +
                "N'" + best_song + "'" +
                ")";

            MyAdoHelper.DoQuery(sqlInsert);

            // אחרי הוספה מוצלחת - נעביר אותו ישירות לדף השליפה לראות את זה!
            Response.Redirect("shlifaPage.aspx");
        }
    }
}