using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register1 : System.Web.UI.Page
{
    public string str;
    protected void Page_Load(object sender, EventArgs e)
    {

        str = "<table border = '1'>";
        for (int i = 1; i < 11; i++)
        {
            str = str + "<tr>";
            for (int j = 1; j < 11; j++)
            {
                str = str + "<td>";
                str = str + i * j;
                str = str + "</td>";
            }
            str = str + "</tr>";
        }
        str = str + "</table>";
    }
}