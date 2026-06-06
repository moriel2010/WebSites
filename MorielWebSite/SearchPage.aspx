<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="SearchPage.aspx.cs" Inherits="SearchPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="direction: rtl; text-align: center; color: white; padding: 20px;">
        <h2>חיפוש </h2>
        <br />
        
        <form name="searchForm" method="post" runat="server">
            <table style="margin: 0 auto; text-align: right; color: white; border-spacing: 10px;">
                <tr>
                    <td>חפש לפי עיר:</td>
                    <td><input type="text" name="searchCity" placeholder="הכנס שם עיר..." /></td>
                </tr>
                <tr>
                                        <td colspan="2" style="text-align: center; padding-top: 15px;">
                        <input type="submit" value="חפש עכשיו" style="padding: 6px 20px; cursor: pointer;" />
                    </td>
                </tr>
            </table>
        </form>

        <br /><br />
        <%= searchResult %>
    </div>
</asp:Content>