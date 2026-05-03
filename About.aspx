<%@ Page Title="About" Language="C#" MasterPageFile="~/MySite.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="IbanaWebSystem22526.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <!-- GREEN NEUMORPHIC ABOUT CSS -->
    <style>
        /* Centers the content on the page */
        .about-wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 70vh;
            padding: 2rem;
        }

        /* The Neumorphic Container */
        .neo-about-card {
            background-color: #e3efe8;
            border-radius: 2rem;
            /* Inset shadow makes it look like a carved-out plaque */
            box-shadow: inset 15px 15px 30px #c2d0c8, inset -15px -15px 30px #ffffff;
            width: 100%;
            max-width: 800px;
            padding: 4rem;
            text-align: center;
        }

        /* Title Styling */
        .about-title {
            color: #1a3324;
            font-weight: 800;
            font-size: 3rem;
            letter-spacing: -1px;
            margin-bottom: 1.5rem;
        }

        /* Divider Line */
        .about-divider {
            height: 2px;
            background-color: transparent;
            border: none;
            margin: 2rem auto;
            width: 50%;
            /* Raised shadow line */
            box-shadow: 1px 1px 3px #c2d0c8, -1px -1px 3px #ffffff;
        }

        /* Paragraph Styling */
        .about-text {
            color: #5c7465;
            font-size: 1.25rem;
            line-height: 1.8;
            font-weight: 500;
            margin-bottom: 0;
        }
    </style>

    <div class="about-wrapper">
        <div class="neo-about-card">
            
            <!-- Dynamic Title Setup -->
            <h1 class="about-title">IbanaWebSystem22526</h1>

            <hr class="about-divider" />

            <!-- The Description -->
            <p class="about-text">
                This web application is a semester-long project where features such as database access and secure authentication were added and improved. This complete web application serves as my submission for the Final Project of Web Systems and Technologies this Second Semester 2025-2026.
            </p>

        </div>
    </div>

</asp:Content>