<%@ Page Title="הרשמה" Language= "C#"  MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="enrollmentPage.aspx.cs" Inherits="enrollmentPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        /* מסגרת חיצונית ראשית לטופס ההרשמה */
        .registration-box {
            max-width: 500px;
            margin: 40px auto;
            padding: 30px;
            background-color: #ffffff;
            border: 2px solid #34495e; /* מסגרת כהה ויפה */
            border-radius: 12px; /* פינות מעוגלות למסגרת */
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15); /* צל שנותן נפח */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            direction: rtl; /* יישור לימין עבור עברית */
            text-align: right;
        }

        /* כותרת הטופס */
        .registration-box h2 {
            text-align: center;
            color: #2c3e50;
            margin-top: 0;
            margin-bottom: 25px;
            font-size: 26px;
            padding-bottom: 10px;
            border-bottom: 3px solid #3498db; /* קו תחתון כחול מתחת לכותרת */
        }

        /* סגנון לשורות הטופס */
        .form-row {
            margin-bottom: 20px;
        }

        /* סגנון לטקסט של הכותרות (שם, טלפון וכו') */
        .form-row label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #34495e;
            font-size: 15px;
        }

        /* עיצוב תיבות הטקסט, האימייל והסיסמה */
        .input-field {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
            font-size: 15px;
            background-color: #fdfdfd;
            transition: all 0.3s ease;
        }

        /* אפקט בזמן לחיצה על שדה קלט */
        .input-field:focus {
            border-color: #3498db;
            outline: none;
            box-shadow: 0 0 8px rgba(52, 152, 219, 0.4);
            background-color: #ffffff;
        }

        /* הודעות שגיאה אדומות ובולטות */
        .err-text {
            color: #e74c3c;
            font-size: 13px;
            display: block;
            margin-top: 5px;
            font-weight: bold;
        }

        /* מסגרת פנימית מיוחדת לקבוצות הבחירה (רדיו וצ'קבוקס) */
        .selection-box {
            border: 1px dashed #bdc3c7;
            padding: 15px;
            border-radius: 8px;
            background-color: #fcfcfc;
            margin-bottom: 20px;
        }

        .selection-box-title {
            font-weight: bold;
            color: #2c3e50;
            margin-bottom: 10px;
            display: block;
            border-bottom: 1px solid #ecf0f1;
            padding-bottom: 5px;
        }

        /* עיצוב שורת בחירה (טקסט + תיבה) */
        .option-label {
            display: flex;
            align-items: center;
            margin-bottom: 8px;
            cursor: pointer;
            font-size: 14px;
        }

        .option-label input {
            margin-left: 10px; /* רווח בין התיבה למילול */
            cursor: pointer;
            transform: scale(1.1); /* הגדלה קלה של התיבה לנוחות */
        }

        /* כפתור שליחה מעוצב וגדול */
        .submit-button {
            width: 100%;
            background-color: #2ecc71; /* צבע ירוק מזמין */
            color: white;
            border: none;
            padding: 14px;
            font-size: 18px;
            font-weight: bold;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.2s ease;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .submit-button:hover {
            background-color: #27ae60; /* ירוק כהה יותר במעבר עכבר */
        }

        /* תיבת תצוגת נתונים מהשרת (דיבאג) */
        .debug-panel {
            margin-top: 25px;
            padding: 15px;
            background-color: #eceff1;
            border-right: 5px solid #607d8b;
            border-radius: 4px;
            font-size: 14px;
            line-height: 1.6;
        }
    </style>

    <script language="javascript">
        function checkAll() {
            document.getElementById("fnErr2").innerHTML = "";
            document.getElementById("emErr2").innerHTML = "";
            document.getElementById("phErr2").innerHTML = "";
            document.getElementById("passErr2").innerHTML = "";

            let result = true;

            if (checkFirstName() == false) result = false;
            if (checkPhone() == false) result = false;
            if (checkEmail() == false) result = false;
            if (checkPassword() == false) result = false;

            return result;
        }

        function checkFirstName() {
            let firstname = document.getElementById("firstname").value;
            if (firstname == "") {
                document.getElementById("fnErr2").innerHTML = "שם פרטי לא יכול להיות ריק";
                return false;
            }
            return true;
        }

        function checkPhone() {
            let phone = document.getElementById("phone").value;
            if (phone == "") {
                document.getElementById("phErr2").innerHTML = "טלפון לא יכול להיות ריק";
                return false;
            }
            return true;
        }

        function checkEmail() {
            let email = document.getElementById("email").value;
            if (email == "") {
                document.getElementById("emErr2").innerHTML = "אימייל לא יכול להיות ריק";
                return false;
            }
            if (email.indexOf('@') == -1 || email.indexOf('.') == -1) {
                document.getElementById("emErr2").innerHTML = "אימייל אינו תקין (חובה לכלול @ ונקודה)";
                return false;
            }
            return true;
        }

        function checkPassword() {
            let password = document.getElementById("password").value;
            if (password == "") {
                document.getElementById("passErr2").innerHTML = "סיסמה לא יכול להיות ריק";
                return false;
            }
            if (password.length < 4) {
                document.getElementById("passErr2").innerHTML = "הסיסמה חייבת להיות באורך של 4 תווים לפחות";
                return false;
            }
            return true;
        }
    </script>
</asp:Content>  
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="registration-box">
        <h2>טופס הרשמה לאתר</h2>
        
        <form name="formPage" method="post" runat="server" onsubmit="return checkAll();">
            
            <div class="form-row">
                <label for="firstname">שם פרטי:</label>
                <input type="text" name="firstname" id="firstname" class="input-field" placeholder="הקלד שם פרטי...">
                <span id="fnErr2" class="err-text"></span>
            </div>

            <div class="form-row">
                <label for="phone">מספר טלפון:</label>
                <input type="tel" name="phone" id="phone" class="input-field" placeholder="הקלד מספר טלפון...">
                <span id="phErr2" class="err-text"></span>
            </div>

            <div class="form-row">
                <label for="email">כתובת אימייל:</label>
                <input type="text" name="email" id="email" class="input-field" placeholder="example@domain.com">
                <span id="emErr2" class="err-text"></span>
            </div>

            <div class="form-row">
                <label for="password">סיסמה גישה:</label>
                <input type="password" name="password" id="password" class="input-field" placeholder="מינימום 4 תווים...">
                <span id="passErr2" class="err-text"></span>
            </div>

            <div class="selection-box">
                <span class="selection-box-title">מי הזמר האהוב עליך?</span>
                <label class="option-label"><input type="checkbox" name="check2" value="עדן בן זקן" id="check_1"> עדן בן זקן</label>
                <label class="option-label"><input type="checkbox" name="check2" value="עומר אדם" id="check_2"> עומר אדם</label>
                <label class="option-label"><input type="checkbox" name="check2" value="אייל גולן" id="check_3"> אייל גולן</label>
                <label class="option-label"><input type="checkbox" name="check2" value="פאר טסי" id="check_4"> פאר טסי</label>
            </div>

            <div class="selection-box">
                <span class="selection-box-title">מה השיר האהוב עליך?</span>
                <label class="option-label"><input type="radio" name="radio1" value="רציתי" id="radio_1"> רציתי</label>
                <label class="option-label"><input type="radio" name="radio1" value="שני משוגעים" id="radio_2"> שני משוגעים</label>
                <label class="option-label"><input type="radio" name="radio1" value="תבואי היום" id="radio_3"> תבואי היום</label>
                <label class="option-label"><input type="radio" name="radio1" value="דרך השלום" id="radio_4"> דרך השלום</label>
            </div>
            
            <div class="form-row">
                <label for="textarea1">טקסט חופשי ותגובות:</label>
                <textarea rows="4" class="input-field" name="textarea1" id="textarea1" placeholder="כתוב לנו משהו..."></textarea>
            </div>
            
            <div class="form-row">
                <label for="age">מה הגיל שלך?</label>
                <select name="age" id="age" class="input-field">
                    <option value="0">אנא בחר גיל מהרשימה</option>
                    <option value="15">15</option>
                    <option value="16">16</option>
                    <option value="17">17</option>      
                </select>
            </div>
            
            <input id="Submit1" type="submit" value="שלח טופס הרשמה" class="submit-button" />
        </form>

        <div style="color: red; font-weight: bold; margin-top: 15px; font-size: 16px; text-align: center;">
            <%= strResult %>
        </div>

        <div class="debug-panel">
            <strong style="color: #2c3e50;">נתונים שנקלטו במערכת:</strong><br />
            שם: <span><%=name %></span><br/>
            טלפון: <span><%= phone %></span><br/>
            אימייל: <span><%=email %></span><br/>
            סיסמה: <span><%=password %></span><br/>
            זמר נבחר: <span><%= fav_singer %></span><br/>
            שיר נבחר: <span><%= fav_song %></span><br />
            מלל חופשי: <span><%= open_answer %></span><br/>
            גיל: <span><%=age %></span><br />
            סטטוס רישום: <span><%=s %></span>
        </div>
    </div>
</asp:Content>