<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style>
        .gallery-page {
            padding: 25px;
            text-align: center;
        }

        .gallery-page h2 {
            margin-bottom: 25px;
            font-size: 32px;
            color: #1f2937;
        }

        .gallery-grid {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 18px;
            max-width: 900px;
            margin: 0 auto;
        }

        .gallery-grid img {
            width: 220px;
            height: 150px;
            object-fit: cover;
            border: 2px solid #333;
            border-radius: 8px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="gallery-page">
        <h2>gallery</h2>

        <div class="gallery-grid">
            <img src="Image/כדורגל.jpg" alt="כדורגל" />
            <img src="Image/ליגת%20האלופות.jpg" alt="ליגת האלופות" />
            <img src="Image/מונדיאל.jpg" alt="מונדיאל" />
            <img src="Image/כדורזהב.jpg" alt="כדור הזהב" />
            <img src="Image/ליגתעל.jpg" alt="ליגת העל" />
            <img src="Image/כדור.jpg" alt="כדור" />
        </div>
    </div>
</asp:Content>