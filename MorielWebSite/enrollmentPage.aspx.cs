using System;
using System.Web.UI;

public partial class enrollmentPage : System.Web.UI.Page
{
    public string strResult = "";
    public string s = "";

    public string name;
    public string age;
    public string fav_singer;
    public string fav_song;
    public string email;
    public string password;
    public string open_answer;
    public string phone;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            name = Request.Form["firstname"];
            phone = Request.Form["phone"];
            fav_singer = Request.Form["check2"];
            fav_song = Request.Form["radio1"];
            email = Request.Form["email"];
            password = Request.Form["password"];
            open_answer = Request.Form["textarea1"];
            age = Request.Form["age"];



            // בדיקה אם המייל כבר קיים בטבלת המשתמשים
            string sqlSelect = "SELECT * FROM mSong WHERE email = N'" + email + "'";
            bool userExists = MyAdoHelper.IsExist(sqlSelect);

            if (userExists)
            {
                strResult = "מייל שהוכנס קיים במערכת, הכנס מייל חדש.";
            }
            else
            {

                // הכנסת הנתונים לטבלת המשתמשים tUsers
                string sqlInsert = "INSERT INTO mSong VALUES (" +
                    "N'" + name + "'," +
                    "N'" + phone + "'," +
                    "N'" + fav_singer + "'," +
                    "N'" + fav_song + "'," +
                    "N'" + open_answer + "'," +
                    "N'" + email + "'," +
                    "N'" + password + "'," +
                    "N'" + age + "'" +
                    ")";

                MyAdoHelper.DoQuery(sqlInsert);

                // מעבר אוטומטי לדף התחברות לאחר ההרשמה
                Response.Redirect("entryPage.aspx");
            }
        }
    }
}