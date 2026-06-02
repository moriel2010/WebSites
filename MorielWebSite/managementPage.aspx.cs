using System;
using System.Data;

public partial class managementPage : System.Web.UI.Page
{
    public string st = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        // 1. בדיקת הגנה: מאפשר רק למנהל לצפות בדף (אבטחת מידע)
        if (Session["userRole"] == null || Session["userRole"].ToString() != "admin")
        {
            Response.Redirect("entryPage.aspx");
            return;
        }

        // 2. שאילתת בסיס דינמית - שולפת את כל המשתמשים כברירת מחדל
        string sql = "SELECT * FROM mSong WHERE 1=1";

        // אם המנהל לחץ על כפתור הסינון, נוסיף את התנאים באופן חכם
        if (Page.IsPostBack)
        {
            string name = Request.Form["firstname"] != null ? Request.Form["firstname"].Trim() : "";
            string fav_singer = Request.Form["check2"] != null ? Request.Form["check2"].Trim() : "";

            // חיפוש חלקי (LIKE) לפי שם המשתמש (firstname) בטבלה
            if (!string.IsNullOrEmpty(name))
            {
                sql += " AND name LIKE N'%" + name + "%'";
            }

            // סינון/חיפוש לפי עמודת הזמר האהוב (check2) בטבלה
            if (!string.IsNullOrEmpty(fav_singer))
            {
                sql += " AND fav_singer LIKE N'%" + fav_singer + "%'";
            }
        }

        // הרצת השאילתה הסופית מול מסד הנתונים
        DataTable dt = MyAdoHelper.ExecuteDataTable(sql);

        if (dt == null || dt.Rows.Count == 0)
        {
            st = "<h3 style='color:#ff3333;'>אין משתמשים התואמים לסינון המבוקש בטבלת mSong.</h3>";
        }
        else
        {
            // 3. בניית טבלת משתמשים דינמית ומעוצבת
            st += "<table border='1' style='color:white; background-color:rgba(0,0,0,0.7); width:90%; text-align:center; border-collapse:collapse; direction:rtl;'>";

            // שורת כותרות הטבלה (סגול)
            st += "<tr style='background-color:purple; font-weight:bold; height:35px;'>";
            for (int j = 0; j < dt.Columns.Count; j++)
            {
                st += "<td style='padding:5px;'>" + dt.Columns[j].ColumnName + "</td>";
            }
            st += "</tr>";

            // הדפסת שורות הנתונים של הגולשים הרשומים
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                st += "<tr style='height:30px;'>";
                for (int k = 0; k < dt.Columns.Count; k++)
                {
                    st += "<td style='padding:5px;'>" + dt.Rows[i][k] + "</td>";
                }
                st += "</tr>";
            }

            st += "</table>";
        }
    }
}