<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="form.aspx.cs" Inherits="form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>  
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>form</h2>
  <form name="formPage" method="post" runat="server">
      שם פרטי: <input type="text" name="firstname" id="firstname" placeholder="example">
      <br />
       טלפון: <input type="tel" name="phone" id="phone" placeholder="example">
      <br />
      מקצועות אהובים: 
      <br />
      הנדסת תוכנה<input type="checkbox" name="check2" value="הת" id="check_1"><br />
      מתמטיקה: <input type="checkbox" name="check2" value="מתמטיקה" id="check_2"><br />
      מדעי המחשב<input type="checkbox" name="check2" value="מדמח"  id="check_3"><br />
      ספורט: <input type="checkbox" name="check2" value="ספורט" id="check_4">
       <br />
      בעל חיים אהוב: 
      <br />
      כלב<input type="radio" name="radio1"  value="כלב" id="radio_1"><br />
      חתול<input type="radio" name="radio1" value="חתול" id="radio_2"><br />
      סוס<input type="radio" name="radio1" value="סוס"  id="radio_3"><br />
      ארנב<input type="radio" name="radio1" value="ארנב" id="radio_4"><br />
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
    <br />
    <br
  <%=phone %>
    <br />
    <br />
  <%= fav_professions %>
    <br />
    <br />
  <%= fav_animal %>
    <br />
    <br />
  <%= age %>
</asp:Content>

