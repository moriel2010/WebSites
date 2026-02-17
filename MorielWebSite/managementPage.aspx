<%@ Page Title="" Language="C#" 
    MasterPageFile="~/MasterPage1.master"
    AutoEventWireup="true"
    CodeFile="managementPage.aspx.cs"
    Inherits="managementPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        <h1>חיפוש</h1>
         <form name="formPage" method="post" runat="server">
     שם פרטי: <input type="text" name="firstname" id="firstname" placeholder="example">
     <br />
     
      <br />
     הקבוצה האהובה עליך: 
     <br />
     ברצלונה<input type="radio" name="radio1"  value= " ברצלונה" id="radio_1"><br />
     ריאל מדריד<input type="radio" name="radio1"  value= "ריאל מדריד " id="radio_2"><br />
     ארסנל<input type="radio" name="radio1"  value= "ארסנל "  id="radio_3"><br />
     מנצ'סטר סיטי<input type="radio"  name= "radio1" value="2012" id="radio_4"><br />
     תשובה פתוחה:
    
     <br />
     <input id="Submit1" type="submit" value="שלח" />
 </form>

        <br />
        <%= st %>
    </center>

</asp:Content>
