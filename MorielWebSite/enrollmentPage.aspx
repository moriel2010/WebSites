<%@ Page Title="" Language= "C#"  MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="enrollmentPage.aspx.cs" Inherits="enrollmentPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <script language="javascript">

        // פונקציית הבדיקה הראשית - מופעלת בעת שליחת הטופס
        function checkAll() {
            // איפוס הודעות השגיאה של כל השדות לפני בדיקה חדשה
            document.getElementById("fnErr2").innerHTML = "";
            document.getElementById("emErr2").innerHTML = "";
            document.getElementById("phErr2").innerHTML = "";
            document.getElementById("passErr2").innerHTML = "";

            let result = true;

            // הרצת הבדיקות לכל שדה. אם אחת מהן נכשלת, משנים את התוצאה ל-false
            if (checkFirstName() == false) result = false;
            if (checkPhone() == false) result = false;
            if (checkEmail() == false) result = false;
            if (checkPassword() == false) result = false; // הוספתי קריאה גם לבדיקת הסיסמה שכתבת

            return result; // אם יחזור false, הטופס לא יישלח לשרת
        }

        // פונקציה לבדיקת תקינות השם הפרטי
        function checkFirstName() {
            let firstname = document.getElementById("firstname").value;
            // בדיקה האם השדה ריק
            if (firstname == "") {
                document.getElementById("fnErr2").innerHTML = "שם פרטי לא יכול להיות ריק";
                return false;
            }
            return true;
        }

        // פונקציה לבדיקת תקינות מספר הטלפון
        function checkPhone() {
            let phone = document.getElementById("phone").value;
            // בדיקה האם השדה ריק
            if (phone == "") {
                document.getElementById("phErr2").innerHTML = "טלפון לא יכול להיות ריק";
                return false;
            }
            return true;
        }

        // פונקציה לבדיקת תקינות כתובת האימייל
        function checkEmail() {
            let email = document.getElementById("email").value;
            // בדיקה האם השדה ריק
            if (email == "") {
                document.getElementById("emErr2").innerHTML = "אימייל לא יכול להיות ריק";
                return false;
            }
            // בדיקת תקינות אימייל - נוכחות @ ונקודה
            if (email.indexOf('@') == -1 || email.indexOf('.') == -1) {
                document.getElementById("emErr2").innerHTML = "אימייל אינו תקין (חובה לכלול @ ונקודה)";
                return false;
            }
            return true;
        }

        // פונקציה לבדיקת תקינות הסיסמה (אורך מינימלי)
        function checkPassword() {
            let password = document.getElementById("password").value;
            // בדיקה האם השדה ריק
            if (password == "") {
                document.getElementById("passErr2").innerHTML = "סיסמה לא יכול להיות ריק";
                return false;
            }
            // בדיקה שהסיסמה מכילה לפחות 4 תווים
            if (password.length < 4) {
                document.getElementById("passErr2").innerHTML = "הסיסמה חייבת להיות באורך של 4 תווים לפחות";
                return false;
            }
            return true;
        }
    </script>
</asp:Content>  

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>enrollment</h2>
    
    <form name="formPage" method="post" runat="server" onsubmit="return checkAll();">
        
        שם פרטי: <input type="text" name="firstname" id="firstname" placeholder="example">
                <span id="fnErr2" style="color: red;"></span>
        <br />

        טלפון: <input type="tel" name="phone" id="phone" placeholder="example">
                <span id="phErr2" style="color: red;"></span>
        <br />

        אימייל: <input type="text" name="email" id="email" placeholder="example">
                <span id="emErr2" style="color: red;"></span>
        <br />
        סיסמה: <input type="password" name="password" id="password" placeholder="example">
                <span id="passErr2" style="color: red;"></span>
        <br />
        זמר אהוב: 
        <br />
        עדן בן זקן<input type="checkbox" name="check2"  value="עדן בן זקן" id="check_1"><br />
        עומר אדם <input type="checkbox" name="check2" value="עומר אדם" id="check_2"><br />
        אייל גולן<input type="checkbox" name="check2" value="אייל גולן"  id="check_3"><br />
        פאר טסי: <input type="checkbox" name="check2" value="פאר טסי" id="check_4">
         <br />
        שיר אהוב עליך: 
        <br />
        רציתי<input type="radio" name="radio1"  value= " רציתי" id="radio_1"><br />
        שני משוגעים<input type="radio" name="radio1"  value= "שני משוגעים " id="radio_2"><br />
        תבואי היום<input type="radio" name="radio1"  value= "תבואי היום "  id="radio_3"><br />
        דרך השלום<input type="radio"  name= "radio1" value="דרך השלום" id="radio_4"><br />
        
        תשובה פתוחה:
        <textarea rows="5" cols="20" name="textarea1" id="textarea1" placeholder="הכנס מלל חופשי"></textarea>
        <br />
        
        <select name="age" id="age">
            <option value="0">בחר גיל</option>
            <option value="15">15</option>
            <option value="16">16</option>
            <option value="17">17</option>      
        </select>
        <br />
        
        <input id="Submit1" type="submit" value="שלח" />
    </form>

    <div style="color: red; font-weight: bold; margin-top: 15px; font-size: 16px;">
        <%= strResult %>
    </div>

    <br />
    <%=name %> <br/>  <%= phone %> <br/>  <%=email %> <br/>   <%=password %> <br/>    <%= fav_singer %> <br/>  <%= fav_song %> <br />
    <%= open_answer %> <br/>  <%=age %> <br /> <%=s %>
</asp:Content>