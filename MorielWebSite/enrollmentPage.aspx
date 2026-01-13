<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="enrollmentPage.aspx.cs" Inherits="enrollmentPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>enrollment</h2>
    <form name="formPage" method="post" runat="server">
        שם פרטי: <input type="text" name="firstname" id="firstname" placeholder="example">
        <br />
         טלפון: <input type="tel" name="phone" id="phone" placeholder="example">
        <br />
        שחקן אהוב: 
        <br />
        ניימאר<input type="checkbox" name="check2"  value="ניימאר" id="check_1"><br />
        מסי: <input type="checkbox" name="check2" value="מסי" id="check_2"><br />
        רונאלדיניו<input type="checkbox" name="check2" value="רונאלדיניו"  id="check_3"><br />
        סוארס: <input type="checkbox" name="check2" value="סוארס" id="check_4">
         <br />
        התקופה הכי טובה של ברצלונה: 
        <br />
        2020<input type="radio" name="radio1" value="2020" id="radio_1"><br />
        2022<input type="radio" name="radio1" value="2022" id="radio_2"><br />
        2007<input type="radio" name="radio1" value="2007"  id="radio_3"><br />
        2012<input type="radio" name="radio1" value="2012" id="radio_4"><br />
        תשובה פתוחה:
        <textarea rows="5" cols="20" name="textarea1" id="textarea1" placeholder="הכנס מלל חופשי"></textarea>
        <br />
        <select name="age" id="age">
            <option value="0">בחר גיל</option>
            <option value="15">15</option>
            <option value="16">16</option>
            <option value="17">17</option>
        </select>
        <br />
        <input id="Submit1" type="submit" value="שלח" />
    </form>
   </hr>
    <%=name %>
    <br/>
    <br/>
    <%= phone %>
    <br/>
    <br/>
    <%= fav_player %>
    <br/>
    <br/>
    <%= prime_team %>
    <br />
    <br />
    <%= open_answer %>
    <br/>
    <br/>
      <%=age %>

</asp:Content>

