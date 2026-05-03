<%@ Page Title="Home" Language="C#" MasterPageFile="~/MySite.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="IbanaWebSystem22526.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <!-- CSS -->
    <style>
        /* Green Theme */
        .text-muted {
            color: #5c7465 !important;
            font-weight: 500; 
        }
        .text-dark {
            color: #1a3324 !important;
        }
        .text-primary {
            color: #238551 !important;
        }

        /* Background effect */
        body {
            background-color: #e3efe8; 
            background-image: radial-gradient(#c2d0c8 1px, transparent 1px);
            background-size: 20px 20px;
            background-attachment: fixed; 
        }

        /* Title CSS */
        .hero-section {
            min-height: 75vh; 
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #e3efe8, #f5fbf7);
            border-radius: 2rem;
            box-shadow: inset 10px 10px 20px #c2d0c8, inset -10px -10px 20px #ffffff;
            margin-top: 2rem;
            margin-bottom: 5rem;
            padding: 3rem;
        }

        /* Details CSS */
        .neo-card-interactive {
            transition: all 0.3s ease;
            border-radius: 1.5rem;
            background-color: #e3efe8;
            border: none;
            box-shadow: 8px 8px 15px #c2d0c8, -8px -8px 15px #ffffff;
        }
        .neo-card-interactive:hover {
            box-shadow: inset 5px 5px 10px #c2d0c8, inset -5px -5px 10px #ffffff !important;
            transform: scale(0.98);
        }

        .neo-inset-box {
            background-color: #e3efe8;
            border-radius: 1.5rem;
            box-shadow: inset 8px 8px 15px #c2d0c8, inset -8px -8px 15px #ffffff;
            padding: 3rem;
        }
    </style>

    <!-- Title -->
    <div class="hero-section text-center">
        <h1 class="fw-bold text-primary mb-3" style="font-size: 5rem; letter-spacing: -2px;">Portfolio</h1>
        <h2 class="text-muted" style="font-size: 2rem;">Web Systems and Technologies</h2>
    </div>


    <!-- Web App Details -->
    <div class="container mb-5 pb-5">
        <div class="text-center mb-5">
            <h2 class="fw-bold text-dark">System Architecture</h2>
            <p class="text-muted lead">An overview of the core features powering this application.</p>
        </div>

        <div class="row g-4">
            <!-- Card 1: Security -->
            <div class="col-md-4">
                <div class="card neo-card-interactive p-4 h-100">
                    <div class="card-body">
                        <h4 class="card-title text-primary fw-bold mb-4">Secured Authentication</h4>
                        <ul class="text-muted" style="line-height: 2;">
                            <li>Requires log in and active session to gain access to pages.</li>
                            <li>Passwords are securely hashed.</li>
                            <li>Automatic session logout and destruction after inactivity.</li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Card 2: Database -->
            <div class="col-md-4">
                <div class="card neo-card-interactive p-4 h-100">
                    <div class="card-body">
                        <h4 class="card-title text-primary fw-bold mb-4">Database Connection</h4>
                        <ul class="text-muted" style="line-height: 2;">
                            <li>Connected directly to an MS Access internal database.</li>
                            <li>Perform seamless CRUD operations.</li>
                            <li>Database table display in secure forms.</li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Card 3: User Interface -->
            <div class="col-md-4">
                <div class="card neo-card-interactive p-4 h-100">
                    <div class="card-body">
                        <h4 class="card-title text-primary fw-bold mb-4">Responsive UI Design</h4>
                        <ul class="text-muted" style="line-height: 2;">
                            <li>Fully responsive layout powered by the Bootstrap framework.</li>
                            <li>Custom Neumorphic (soft UI) interactive elements using Bootswatch.</li>
                            <li>Using MySite.Master for navbar and global elements</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- Credits and other info -->
    <div class="row g-4 mb-5 pb-5">
        
        <!-- Student -->
        <div class="col-md-6">
            <div class="neo-inset-box text-center h-100">
                <h6 class="text-primary fw-bold text-uppercase tracking-wide mb-3">Developer</h6>
                <h2 class="fw-bold text-dark mb-3">James Carl Ibana</h2>
                <p class="text-muted mb-0" style="font-size: 1.1rem;">
                    BS in Information Technology<br />
                    Sophomore<br />
                    2nd Semester S.Y. 2025-2026
                </p>
            </div>
        </div>

        <!-- Instructor -->
        <div class="col-md-6">
            <div class="neo-inset-box text-center h-100">
                <h6 class="text-primary fw-bold text-uppercase tracking-wide mb-3">Instructor</h6>
                <h2 class="fw-bold text-dark mb-3">Jerome Refran</h2>
                <p class="text-muted mb-0" style="font-size: 1.1rem;">
                    GpE, MIT, DIT (Cand.)
                </p>
            </div>
        </div>

    </div>

</asp:Content>