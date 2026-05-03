<%@ Page Title="Contact" Language="C#" MasterPageFile="~/MySite.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="IbanaWebSystem22526.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <!-- GREEN NEUMORPHIC BUSINESS CARD CSS -->
    <style>
        /* Maintain the Parallax Background from Home */
        body {
            background-color: #e3efe8;
            background-image: radial-gradient(#c2d0c8 1px, transparent 1px);
            background-size: 20px 20px;
            background-attachment: fixed; 
        }

        /* Centers the card on the page */
        .business-card-wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 70vh;
            padding: 2rem;
        }

        /* The Physical Card Design */
        .neo-business-card {
            background-color: #e3efe8;
            border-radius: 1.5rem;
            /* Pushing out shadow to lift it off the background */
            box-shadow: 15px 15px 30px #c2d0c8, -15px -15px 30px #ffffff;
            width: 100%;
            max-width: 600px;
            padding: 3.5rem;
            transition: all 0.3s ease;
            position: relative; /* Allows absolute positioning if needed */
        }

        .neo-business-card:hover {
            transform: translateY(-5px);
            box-shadow: 20px 20px 40px #c2d0c8, -20px -20px 40px #ffffff;
        }

        /* THE NEW "CONTACT ME" BADGE */
        .card-badge {
            display: inline-block;
            background-color: #e3efe8;
            color: #238551;
            font-size: 0.75rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 2px;
            padding: 0.4rem 1rem;
            border-radius: 50px;
            /* Inset shadow to make it look carved into the top of the card */
            box-shadow: inset 3px 3px 6px #c2d0c8, inset -3px -3px 6px #ffffff;
            margin-bottom: 2rem;
        }

        /* Typography Styling */
        .card-name {
            color: #1a3324;
            font-weight: 800;
            font-size: 2.8rem;
            letter-spacing: -1.5px;
            margin-bottom: 0.2rem;
            line-height: 1.2;
        }

        .card-title {
            color: #238551;
            font-weight: 600;
            font-size: 1rem;
            text-transform: uppercase;
            letter-spacing: 3px;
            margin-bottom: 2rem;
        }

        /* The Carved Divider Line */
        .card-divider {
            height: 2px;
            background-color: transparent;
            border: none;
            margin: 2.5rem 0;
            box-shadow: inset 1px 1px 3px #c2d0c8, inset -1px -1px 3px #ffffff;
        }

        /* Contact Details Layout */
        .contact-details {
            display: flex;
            flex-direction: column;
            gap: 1.2rem;
        }

        .contact-item {
            display: flex;
            align-items: center;
            color: #5c7465;
            font-weight: 500;
            font-size: 1.05rem;
        }

        .contact-icon {
            color: #238551;
            width: 40px; 
            font-size: 1.2rem;
        }

        .contact-item a {
            color: #5c7465;
            text-decoration: none;
            transition: color 0.2s ease;
        }

        .contact-item a:hover {
            color: #238551;
        }
    </style>

    <div class="business-card-wrapper">
        <div class="neo-business-card">
            
            <!-- The Carved "Contact Me" Badge -->
            <div class="card-badge">Contact Me</div>
            
            <!-- Top Section: Identity -->
            <h2 class="card-name">James Carl Ibana</h2>
            <div class="card-title">BS in Information Technology</div>

            <!-- Carved Divider -->
            <hr class="card-divider" />

            <!-- Bottom Section: Details Grid -->
            <div class="contact-details">
                <div class="contact-item">
                    <span class="contact-icon">🏫</span>
                    <span>University of Perpetual Help System DALTA - Calamba</span>
                </div>
                <div class="contact-item">
                    <span class="contact-icon">📍</span>
                    <span>Calamba, Laguna 4027</span>
                </div>
                <div class="contact-item">
                    <span class="contact-icon">✉️</span>
                    <a href="mailto:jamescarl.ibana@perpetual.edu.ph">jamescarl.ibana@perpetual.edu.ph</a>
                </div>
                <div class="contact-item">
                    <span class="contact-icon">📞</span>
                    <span>+63 908 929 3709</span>
                </div>
            </div>

        </div>
    </div>

</asp:Content>