<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

        <style>
    .informion-page {
        direction: rtl;
        padding: 30px;
    }
    .informion-content {
        display: flex;
        flex-direction: row;
        align-items: flex-start;
        justify-content: flex-start;
        gap: 20px;
        max-width: 1100px;
        margin: 0  ;
        text-align: right;
    }
    .informion-text {
        max-width: 750px;
        font-size: 24px;
        line-height: 1.7;
        margin: 0;
    }
    .informion-grid img {
        width: 1000px;
        max-width: 150%;
        height: auto;

    }
    @media (max-width: 800px) {
        .informion-content {
            flex-direction: column;
            align-items: center;
        }
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                <h2> שירים+      מקלידים שם, מגלים עולם: הכל על הזמרים שלכם במקום אחד </h2>

        <div class="informion-page">
        
        <div class="informion-content">
            
            <p class="informion-text">
האתר שלי הוא על שירים בהתחלה כבר בטופס הרשמה אתה לוחץ על איזה זמר שאתה הכי יודע מעריץ או אוהב ואז שאתה מסיים אתה כותב עליו את הפרטים שאנשים רוצים לדעת בשביל שאחרים גם ידעו נגיד כמה אלבומים יש וכו וגם האתר שלי הוא גם אתר שאפשר לשמוע בו כל מיני שירים וכמו שאמרתי גם לדעת מידע על הזמר שאתה רוצה במקום לחפש כל דבר בגלל אז יש לך הכל מרוכז            </p>

            <div class="informion-grid">
                <img src="Image/nnmb.png" />
            </div>
            
        </div> </div>
</asp:Content>

