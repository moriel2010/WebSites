<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="entryPage.aspx.cs" Inherits="entryPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form name="formPage" method="post" runat="server">
    <h2>entr</h2>
         אימייל: <input type="text" name="email" id="email" placeholder="example">
        <br />
         סיסמה: <input type="password" name="password" id="password" placeholder="example">
        <br />
       
        <input id="Submit1" type="submit" value="שלח" />
    </form>
   </hr>
   

    <%=stResult %>
    <br/>
    <br/>


</asp:Content>
