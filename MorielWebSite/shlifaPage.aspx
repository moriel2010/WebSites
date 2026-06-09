<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="shlifaPage.aspx.cs" Inherits="shlifaPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style>
        .shlifa-container {
            direction: rtl; 
            text-align: center; 
            color: black; 
            padding: 20px;
        }
        .search-box {
            /* השתמשתי ב-Gray (אפור) עם תוספת קטנה כדי לדמות שקיפות */
            background-color: darkgray; 
            padding: 20px;
            border-radius: 10px;
            display: inline-block;
            margin-bottom: 20px;
            border: 1px solid gold; /* שונה מ-#d4af37 */
        }
        .search-box input[type="text"] {
            padding: 5px;
            margin: 5px;
            border-radius: 5px;
            border: 1px solid silver; /* שונה מ-#ccc */
        }
        .btn-submit {
            padding: 6px 20px; 
            background-color: darkpurple; /* שונה מ-#4a148c (אפשר גם indigo או purple) */ 
            color: black; 
            border: 1px solid gold; /* שונה מ-#d4af37 */ 
            border-radius: 5px; 
            cursor: pointer;
            font-weight: bold;
        }
        .btn-submit:hover {
            background-color: gold; /* שונה מ-#d4af37 */
            color: black;
        }
        /* עיצוב קטן לקישורי היוטיוב בטבלה */
        .shlifa-container table a:hover {
            text-decoration: underline !important;
            color: crimson; /* שונה מ-#ff4d4d (אדום חזק, אפשר גם פשוט red) */ !important;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="shlifa-container">
        <h2>מערכת שליפה וסינון פריטים</h2>
        <br />

        <div class="search-box">
            <form name="formPage" method="post" runat="server">
                שם האומן:
                <input type="text" name="artistName" id="artistName" placeholder="הכנס שם אומן..." />
                
                <input id="Submit1" type="submit" value="שלוף נתונים" class="btn-submit" />
            </form>
        </div>

        <br />
        <center>
            <div style="overflow-x:auto;">
                <%= st %>
            </div>
        </center>
    </div>
</asp:Content>