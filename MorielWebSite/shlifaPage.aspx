<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="shlifaPage.aspx.cs" Inherits="shlifaPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style>
        .shlifa-container {
            direction: rtl; 
            text-align: center; 
            color: white; 
            padding: 20px;
        }
        .search-box {
            background-color: rgba(0, 0, 0, 0.4);
            padding: 20px;
            border-radius: 10px;
            display: inline-block;
            margin-bottom: 20px;
            border: 1px solid #d4af37;
        }
        .search-box input[type="text"] {
            padding: 5px;
            margin: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        .btn-submit {
            padding: 6px 20px; 
            background-color: #4a148c; 
            color: white; 
            border: 1px solid #d4af37; 
            border-radius: 5px; 
            cursor: pointer;
            font-weight: bold;
        }
        .btn-submit:hover {
            background-color: #d4af37;
            color: black;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="shlifa-container">
        <h2>מערכת שליפה וסינון פריטים </h2>
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
            <%= st %>
        </center>
    </div>
</asp:Content>
