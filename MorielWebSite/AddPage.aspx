<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="AddPage.aspx.cs" Inherits="AddPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <script type="text/javascript">
        function checkAll() {
            // איפוס הודעות שגיאה קודמות
            document.getElementById("ageErr").innerHTML = "";
            document.getElementById("cityErr").innerHTML = "";
            document.getElementById("followersErr").innerHTML = "";
            document.getElementById("awardsErr").innerHTML = "";
            document.getElementById("albumsErr").innerHTML = "";
            document.getElementById("songErr").innerHTML = "";

            let isOK = true;

            let age = document.getElementById("age").value;
            let city = document.getElementById("city").value;
            let followers = document.getElementById("followers").value;
            let awards = document.getElementById("awards").value;
            let albums = document.getElementById("Albums").value;
            let bestSong = document.getElementById("best_song").value;

            // בדיקת גיל (חיובי ומספר)
            if (age === "" || Number(age) <= 0) {
                document.getElementById("ageErr").innerHTML = "יש להזין גיל תקין חיובי";
                isOK = false;
            }
            // בדיקת עיר
            if (city.trim() === "") {
                document.getElementById("cityErr").innerHTML = "שדה עיר הוא חובה";
                isOK = false;
            }
            // בדיקת עוקבים
            if (followers.trim() === "") {
                document.getElementById("followersErr").innerHTML = "שדה עוקבים הוא חובה";
                isOK = false;
            }
            // בדיקת פרסים (מספר לא שלילי)
            if (awards === "" || Number(awards) < 0) {
                document.getElementById("awardsErr").innerHTML = "יש להזין מספר פרסים תקין";
                isOK = false;
            }
            // בדיקת אלבומים
            if (albums.trim() === "") {
                document.getElementById("albumsErr").innerHTML = "שדה אלבומים הוא חובה";
                isOK = false;
            }
            // בדיקת השיר הכי טוב
            if (bestSong.trim() === "") {
                document.getElementById("songErr").innerHTML = "שדה שיר הוא חובה";
                isOK = false;
            }

            return isOK;
        }
    </script>
    <style>
        .error-msg { color: red; font-size: 14px; font-weight: bold; padding-right: 10px; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="page-container" style="direction: rtl; text-align: right;">
        
        <h2 style="color: white; margin-bottom: 20px;">הוספת פריט</h2>
        
        <form name="AddPage" method="post" runat="server" onsubmit="return checkAll();">
            
            <table class="form-table" style="width: 100%; max-width: 500px;">
                <tr style="color: white;">
                    <td>גיל:</td>
                    <td><input type="number" name="age" id="age" placeholder="example"></td>
                    <td><span id="ageErr" class="error-msg"></span></td>
                </tr>
                <tr style="color: white;">
                    <td>עיר:</td>
                    <td><input type="text" name="city" id="city" placeholder="example"></td>
                    <td><span id="cityErr" class="error-msg"></span></td>
                </tr>
                <tr style="color: white;">
                    <td>עוקבים:</td>
                    <td><input type="text" name="followers" id="followers" placeholder="example"></td>
                    <td><span id="followersErr" class="error-msg"></span></td>
                </tr>
                <tr style="color: white;">
                    <td>פרסים:</td>
                    <td><input type="number" name="awards" id="awards" placeholder="example"></td>
                    <td><span id="awardsErr" class="error-msg"></span></td>
                </tr>
                <tr style="color: white;">
                    <td>אלבומים:</td>
                    <td><input type="text" name="Albums" id="Albums" placeholder="example"></td>
                    <td><span id="albumsErr" class="error-msg"></span></td>
                </tr>
                <tr style="color: white;">
                    <td>השיר הכי טוב:</td>
                    <td><input type="text" name="best_song" id="best_song" placeholder="example"></td>
                    <td><span id="songErr" class="error-msg"></span></td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align: center; padding-top: 20px;">
                        <input id="Submit1" type="submit" value="שלח" style="padding: 8px 25px; cursor: pointer;" />
                    </td>
                </tr>
            </table>

        </form>
    </div>
</asp:Content>
