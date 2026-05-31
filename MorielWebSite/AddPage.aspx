<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="AddPage.aspx.cs" Inherits="AddPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <script type="text/javascript">
        function checkAll() {
            // קליטת הערכים מכל השדות
            let age = document.getElementById("age").value;
            let city = document.getElementById("city").value;
            let followers = document.getElementById("followers").value;
            let awards = document.getElementById("awards").value;
            let albums = document.getElementById("Albums").value;
            let bestSong = document.getElementById("best_song").value;

            // בדיקה ששום שדה לא ריק
            if (age === "" || city === "" || followers === "" || awards === "" || albums === "" || bestSong === "") {
                alert("חובה למלא את כל השדות לפני השליחה!");
                return false; // עוצר את שליחת הטופס לשרת
            }

            return true; // מאשר את השליחה אם הכל תקין
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="page-container">
        
        <h2 style="color: white; margin-bottom: 20px;">הוספת פריט</h2>
        
        <form name="AddPage" method="post" runat="server" onsubmit="return checkAll();">
            
            <table class="form-table">
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
