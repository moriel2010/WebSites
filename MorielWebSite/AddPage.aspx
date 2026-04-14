<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="AddPage.aspx.cs" Inherits="AddPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>תוספת כדורגל</h2>
    <form name="formPage" method="post" runat="server">
        גיל: <input type="number" name="age" id="age" placeholder="example">
        <br />
         גולים: <input type="number" name="goals" id="goals" placeholder="example">
        <br />
         ליגה: <input type="text" name="league" id="league" placeholder="example">
        <br />
         כדורי זהב: <input type="number" name="Goldballs" id="Goldballs" placeholder="example">
        <br />
         קבוצה נוכחי: <input type="text" name="team" id="team" placeholder="example">
        <br />
        מספר נוכחי: <input type="number" name="number" id="number" placeholder="example">
        <br />
         
       
        <input id="Submit1" type="submit" value="שלח" />
    </form>

</asp:Content>

