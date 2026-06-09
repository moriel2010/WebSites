<%@ Page Title="הרשמה" Language= "C#"  MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="enrollmentPage.aspx.cs" Inherits="enrollmentPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        /* מסגרת חיצונית ראשית לטופס ההרשמה */
        .registration-box {
            max-width: 500px;
            margin: 40px auto;
            padding: 30px;
            background-color: white;
            border: 2px solid darkslategrey; /* מסגרת כהה ויפה */
            border-radius: 12px; /* פינות מעוגלות למסגרת */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            direction: rtl; /* יישור לימין עבור עברית */
            text-align: right;
        }

        /* כותרת הטופס */
        .registration-box h2 {
            text-align: center;
            color: midnightblue;
            margin-top: 0;
            margin-bottom: 25px;
            font-size: 26px;
            padding-bottom: 10px;
            border-bottom: 3px solid darkblue; /* קו תחתון כחול מתחת לכותרת */
        }

        /* סגנון לשורות הטופס */
        .form-row {
            margin-bottom: 20px;
        }

        /* סגנון לטקסט של הכותרות (שם, טלפון וכו') */
        .form-row label {
            display: block;
            font-weight: bold;
            margin-bottom:  5px;
            color: darkslategrey;
            font-size: 15px;
        }

        /* עיצוב תיבות הטקסט, האימייל והסיסמה */
        .input-field {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid silver;
            border-radius: 6px;
            box-sizing: border-box;
            font-size: 15px;
            background-color: White;
            transition: all 0.3s ease;
        }

        /* אפקט בזמן לחיצה על שדה קלט */
        .input-field:focus {
            border-color: dodgerblue;
            outline: none;
            box-shadow: 0 0 8px rgba(52, 152, 219, 0.4);
            background-color: white;
        }

        /* הודעות שגיאה אדומות ובולטות */
        .err-text {
            color: tomato;
            font-size: 13px;
            display: block;
            margin-top: 5px;
            font-weight: bold;
        }

        /* מסגרת פנימית מיוחדת לקבוצות הבחירה (רדיו וצ'קבוקס) */
        .selection-box {
            border: 1px dashed silver;
            padding: 15px;
            border-radius: 8px;
            background-color: White;
            margin-bottom: 20px;
        }

        .selection-box-title {
            font-weight: bold;
            color: midnightblue;
            margin-bottom: 10px;
            display: block;
            border-bottom: 1px solid silver;
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
            background-color: limegreen; /* צבע ירוק מזמין */
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
            background-color: forestgreen; /* ירוק כהה יותר במעבר עכבר */
        }

        /* תיבת תצוגת נתונים מהשרת (דיבאג) */
        .debug-panel {
            margin-top: 25px;
            padding: 15px;
            background-color: aliceblue;
            border-right: 5px solid white;
            border-radius: 4px;
            font-size: 14px;
            line-height: 1.6;
        }
    </style>

    <script language="javascript">
        function checkAll() {
            // איפוס כל הודעות השגיאה לפני בדיקה חדשה
            document.getElementById("fnErr2").innerHTML = "";
            document.getElementById("emErr2").innerHTML = "";
            document.getElementById("phErr2").innerHTML = "";
            document.getElementById("passErr2").innerHTML = "";
            document.getElementById("singerErr").innerHTML = "";
            document.getElementById("songErr").innerHTML = "";
            document.getElementById("textErr").innerHTML = "";
            document.getElementById("ageErr").innerHTML = "";

            let result = true;

            // הרצת הבדיקות ואיוש משתנה ה-result
            if (checkFirstName() == false) result = false;
            if (checkPhone() == false) result = false;
            if (checkEmail() == false) result = false;
            if (checkPassword() == false) result = false;
            if (checkSinger() == false) result = false;
            if (checkSong() == false) result = false;
            if (checkComments() == false) result = false;
            if (checkAge() == false) result = false;

            return result;
        }

        function checkFirstName() {
            let firstname = document.getElementById("firstname").value.trim();
            if (firstname == "") {
                document.getElementById("fnErr2").innerHTML = "שם פרטי לא יכול להיות ריק";
                return false;
            }
            
            return true;
        }

        function checkPhone() {
            let phone = document.getElementById("phone").value.trim();
            if (phone == "") {
                document.getElementById("phErr2").innerHTML = "טלפון לא יכול להיות ריק";
                return false;
            }
            // בדיקה שזה מכיל רק ספרות ומקפים, ובאורך הגיוני (למשל בין 9 ל-11 תווים)
            
            return true;
        }

        function checkEmail() {
            let email = document.getElementById("email").value.trim();
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
                document.getElementById("passErr2").innerHTML = "סיסמה לא יכולה להיות ריקה";
                return false;
            }
            if (password.length < 4) {
                document.getElementById("passErr2").innerHTML = "הסיסמה חייבת להיות באורך של 4 תווים לפחות";
                return false;
            }
            return true;
        }

        // בדיקה שנבחר זמר אחד לפחות (Checkbox)
        function checkSinger() {
            let checkboxes = document.getElementsByName("check2");
            let checked = false;
            for (let i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].checked) {
                    checked = true;
                    break;
                }
            }
            if (!checked) {
                document.getElementById("singerErr").innerHTML = "חובה לבחור לפחות זמר אחד";
                return false;
            }
            return true;
        }

        // בדיקה שנבחר שיר (Radio Button)
        function checkSong() {
            let radios = document.getElementsByName("radio1");
            let checked = false;
            for (let i = 0; i < radios.length; i++) {
                if (radios[i].checked) {
                    checked = true;
                    break;
                }
            }
            if (!checked) {
                document.getElementById("songErr").innerHTML = "חובה לבחור שיר אהוב אחד";
                return false;
            }
            return true;
        }

        // בדיקה לתיבת המלל החופשי
        function checkComments() {
            let textarea = document.getElementById("textarea1").value.trim();
            if (textarea == "") {
                document.getElementById("textErr").innerHTML = "נא לכתוב תגובה או מלל חופשי";
                return false;
            }
            return true;
        }

        // בדיקה שנבחר גיל תקין מהרשימה (Select)
        function checkAge() {
            let ageSelect = document.getElementById("age").value;
            if (ageSelect == "0") {
                document.getElementById("ageErr").innerHTML = "חובה לבחור גיל מהרשימה";
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
                <label for="password">סיסמת גישה:</label>
                <input type="password" name="password" id="password" class="input-field" placeholder="מינימום 4 תווים...">
                <span id="passErr2" class="err-text"></span>
            </div>

            <div class="selection-box">
                <span class="selection-box-title">מי הזמר האהוב עליך?</span>
                <label class="option-label"><input type="checkbox" name="check2" value="עדן בן זקן" id="check_1"> עדן בן זקן</label>
                <label class="option-label"><input type="checkbox" name="check2" value="עומר אדם" id="check_2"> עומר אדם</label>
                <label class="option-label"><input type="checkbox" name="check2" value="אייל גולן" id="check_3"> אייל גולן</label>
                <label class="option-label"><input type="checkbox" name="check2" value="פאר טסי" id="check_4"> פאר טסי</label>
                <span id="singerErr" class="err-text"></span>
            </div>

            <div class="selection-box">
                <span class="selection-box-title">מה השיר האהוב עליך?</span>
                <label class="option-label"><input type="radio" name="radio1" value="רציתי" id="radio_1"> רציתי</label>
                <label class="option-label"><input type="radio" name="radio1" value="שני משוגעים" id="radio_2"> שני משוגעים</label>
                <label class="option-label"><input type="radio" name="radio1" value="תבואי היום" id="radio_3"> תבואי היום</label>
                <label class="option-label"><input type="radio" name="radio1" value="דרך השלום" id="radio_4"> דרך השלום</label>
                <span id="songErr" class="err-text"></span>
            </div>
            
            <div class="form-row">
                <label for="textarea1">טקסט חופשי ותגובות:</label>
                <textarea rows="4" class="input-field" name="textarea1" id="textarea1" placeholder="כתוב לנו משהו..."></textarea>
                <span id="textErr" class="err-text"></span>
            </div>
            
            <div class="form-row">
                <label for="age">מה הגיל שלך?</label>
                <select name="age" id="age" class="input-field">
                    <option value="0">אנא בחר גיל מהרשימה</option>
                    <option value="0 - 15">0 - 15</option>
                    <option value="16 - 50">16 - 50</option>
                    <option value="50+">50+</option>      
                </select>
                <span id="ageErr" class="err-text"></span>
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