<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="entryPage.aspx.cs" Inherits="entryPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <script language="javascript">
        function checkAll() {
            // איפוס הודעות השגיאה של כל השדות לפני בדיקה חדשה
            document.getElementById("passErr").innerHTML = "";
            document.getElementById("emErr").innerHTML = "";
          

            let result = true;

            // הרצת הבדיקות לכל שדה. אם אחת מהן נכשלת, משנים את התוצאה ל-false
            if (checkEmail() == false) result = false;
            if (checkPassword() == false) result = false; // הוספתי קריאה גם לבדיקת הסיסמה שכתבת

            return result; // אם יחזור false, הטופס לא יישלח לשרת
        }

        // פונקציה לבדיקת תקינות השם הפרטי
        function checkEmail() {
            let email = document.getElementById("email").value;
            // בדיקה האם השדה ריק
            if (email == "") {
                document.getElementById("emErr").innerHTML = "אימייל לא יכול להיות ריק ";
                return false;
            }
            return true;
        }

        // פונקציה לבדיקת תקינות מספר הטלפון
        function checkPassword() {
            let password = document.getElementById("password").value;
            // בדיקה האם השדה ריק
            if (password == "") {
                document.getElementById("passErr").innerHTML = "סיסמה לא יכולה להיות ריק";
                return false;
            }
            return true;
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form name="formPage" method="post" runat="server" onsubmit="return checkLogin();">
        
        <h2>entry</h2>
        
        אימייל: <input type="text" name="email" id="email" placeholder="example">
        <br />
        
        סיסמה: <input type="password" name="password" id="password" placeholder="example">
        <br />
       
        <input id="Submit1" type="submit" value="שלח" />
    </form>
   
    <div style="color: red; font-weight: bold; margin-top: 15px;">
        <%=stResult %>
    </div>
    
    <br/>
    <br/>
</asp:Content>