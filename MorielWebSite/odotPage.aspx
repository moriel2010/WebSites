<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="odotPage.aspx.cs" Inherits="odotPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style>
        .odot-page {
            direction: rtl;
            padding: 30px;
        }
        .odot-content {
            display: flex;
            flex-direction: row;
            align-items: flex-start;
            justify-content: flex-start;
            gap: 20px;
            max-width: 1100px;
            margin: 0  ;
            text-align: right;
        }
        .odot-text {
            max-width: 750px;
            font-size: 24px;
            line-height: 1.7;
            margin: 0;
        }
        .odot-grid img {
            width: 320px;
            max-width: 100%;
            height: auto;

        }
        @media (max-width: 800px) {
            .odot-content {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="odot-page">
        
        <div class="odot-content">
            
            <p class="odot-text">
                שמי מוריאל ואני תלמיד בכיתה י בן 15.5 שלומד בתיכון כצנלסון שבכפר סבא נולדתי בכפר סבא ויש לי אחת בשם יומי בכיתה ח בבר לב ויש לי כלבה בשם יוקי מגזע מלטז ולמדתי בחטיבת אילן רמון ויסודי סורקיס תמיד הייתי ילד שמתעניין בכל מיני דברים אם הייתי רואה משהו שלא הכרתי לפני הייתי יש רוצה לדעת מה זה ואיך זה קורה וזה למה גם בחרתי הנדסת תוכנה כי זה מגמה שחושבים שם ומבינים כל מיני דברים מסקרנים בנוסף לך החלום שלי זה להצליח בחיים והמגמה הזאת תוכל לפתוח לי הרבה דלתות בחיים עד לפני שנה הייתי שחקן כדורסל אהבתי את זה מאוד הייתי מתאמן ארבעה פעמים בשבוע התחלתי מגיל צעיר ופרשתי בגלל שהבנתי שאני מעדיף להשקיע במקצוע שאני רוצה לעסוק בו בעתיד ומקצוע שיכול להוביל אותי להצליח ולהרוויח כסף בחיים וזה לא שכדורסל לא עזר לי אבל הבנתי ששחקן כדורסל אני לא ארצה להיות אבל עדיין בשעות הפנאי אני משחק כדורסל עם חברים בחרתי באתר הזה מיכייון שאני תמיד רוצה לדעת מידע על זמרים ותמיד חשבתי איך זה יכול לעזור לאנשים ולי שיש תר מרוכז שתמיד יכול להתעדכן במידע על זמרים ובנוסף לכך זה גם נותן קישורים להמלצות של אנשים על שירים טובים והשירים הכי מצליחים של אותו זמר
            </p>

            <div class="odot-grid">
                <img src="Image/מוריאל.jpg" />
            </div>
            
        </div> </div>
</asp:Content>

