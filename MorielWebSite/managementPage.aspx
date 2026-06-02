<%@ Page Title="" Language="C#"  MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="managementPage.aspx.cs" Inherits="managementPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center style="color: white; padding: 20px;">
        <h1>דף מנהל</h1>
        
        <p style="color: #ccc; max-width: 600px;">
           
        </p>
        
        <form name="formPage" method="post" runat="server">
            <h3>מערכת איתור וסינון משתמשים רשומים:</h3>
            
            הכנס שם פרטי לחיפוש:
            <input type="text" name="firstname" id="firstname" placeholder="הכנס שם...">
            <br /><br />
         
            סנן לפי זמר אהוב: 
            <br />
            <input type="checkbox" name="check2" value="עומר אדם" id="radio_1"> עומר אדם<br />
            <input type="checkbox" name="check2" value="אייל גולן" id="radio_2"> אייל גולן<br />
            <input type="checkbox" name="check2" value="עדן בן זקן" id="radio_3"> עדן בן זקן<br />
            <input type="checkbox" name="check2" value="פאר טסי" id="radio_4"> פאר טסי<br />
            <br />
            
            <input id="Submit1" type="submit" value="בצע סינון משתמשים" style="padding: 7px 20px; cursor:pointer; font-weight:bold;" />
        </form>

        <br /><br />
        <%= st %>
    </center>
</asp:Content>