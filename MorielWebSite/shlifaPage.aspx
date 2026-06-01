<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="shlifaPage.aspx.cs" Inherits="shlifaPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>שליפה</h2>
<form name="formPage" method="post" runat="server">
    עיר:
    <input type="text" name="city" id="city" placeholder="שם העיר" />
    <br />
    השיר הכי טוב:
    <input type="text" name="best_song" id="best_song" placeholder="שם השיר הכי טוב" />
    <br />
    <input id="Submit1" type="submit" value="שלוף" />
</form>
<br />
<%= st %>
</asp:Content>


    
