<%@ Page Title="Log In" Language="C#" MasterPageFile="~/MySite.Master" AutoEventWireup="true" CodeBehind="MyLogIn.aspx.cs" Inherits="IbanaWebSystem22526.MyLogIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <!-- CSS -->
    <style>

        body {
            background-color: #e3efe8;
            background-image: radial-gradient(#c2d0c8 1px, transparent 1px);
            background-size: 20px 20px;
            background-attachment: fixed; 
        }

        .neo-form-card {
            background-color: #e3efe8;
            border-radius: 2rem;
            box-shadow: 15px 15px 30px #c2d0c8, -15px -15px 30px #ffffff;
            padding: 3rem;
            max-width: 450px; 
            margin: 4rem auto; 
        }

        .form-control {
            background-color: #e3efe8 !important;
            border: none !important;
            box-shadow: inset 6px 6px 12px #c2d0c8, inset -6px -6px 12px #ffffff !important;
            color: #1a3324 !important;
            border-radius: 50px !important; 
            padding: 0.8rem 1.5rem !important;
        }

        .form-control:focus {
            box-shadow: inset 8px 8px 15px #b0c0b7, inset -8px -8px 15px #ffffff !important;
        }

        .form-label {
            color: #5c7465;
            font-weight: 600;
            margin-bottom: 0.5rem;
            margin-left: 1rem; 
        }

        /* Buttons */
        .btn-neo {
            background-color: #e3efe8;
            color: #238551;
            border: none;
            box-shadow: 8px 8px 15px #c2d0c8, -8px -8px 15px #ffffff;
            border-radius: 50px;
            font-weight: bold;
            padding: 0.8rem;
            transition: all 0.2s ease;
        }

        .btn-neo:hover {
            color: #238551;
            box-shadow: inset 5px 5px 10px #c2d0c8, inset -5px -5px 10px #ffffff;
            transform: scale(0.98);
        }
    </style>

    <div class="container">
        <div class="neo-form-card">
            
            <div class="text-center mb-4">
                <h2 class="fw-bold" style="color: #238551; letter-spacing: -1px;">Log In</h2>
                <p style="color: #5c7465;">Log in to access secure pages.</p>
            </div>

            <!-- Username Input -->
            <div class="mb-4">
                <asp:Label ID="Label1" runat="server" Text="Username" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtUN" runat="server" CssClass="form-control" placeholder="Enter username"></asp:TextBox>
            </div>

            <!-- Password Input -->
            <div class="mb-4">
                <asp:Label ID="Label2" runat="server" Text="Password" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtPW" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter password"></asp:TextBox>
            </div>

            <!-- Submit Button -->
            <div class="d-grid gap-2 mt-5">
                <asp:Button ID="btnLogIn" runat="server" Text="Log In" OnClick="btnLogIn_Click" CssClass="btn btn-neo" />
            </div>

            <!-- Message -->
            <div class="text-center mt-3">
                <asp:Label ID="lblMessage" runat="server" Text="" Font-Bold="true" ForeColor="#d9534f"></asp:Label>
            </div>

        </div>
    </div>

    <!-- Data -->
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" Visible="False">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="studIndex" HeaderText="studIndex" SortExpression="studIndex" />
            <asp:BoundField DataField="Firstname" HeaderText="Firstname" SortExpression="Firstname" />
            <asp:BoundField DataField="Lastname" HeaderText="Lastname" SortExpression="Lastname" />
            <asp:BoundField DataField="Code" HeaderText="Code" SortExpression="Code" />
            <asp:BoundField DataField="YearLevel" HeaderText="YearLevel" SortExpression="YearLevel" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentInfo %>" ProviderName="<%$ ConnectionStrings:StudentInfo.ProviderName %>" SelectCommand="SELECT A.ID, A.studIndex, B.Firstname, B.Lastname, B.YearLevel, C.Code FROM ((tblUNPW A INNER JOIN tblStudentInfo B ON A.studIndex = B.[index]) INNER JOIN tblProgram C ON B.ProgramID = C.ProgramID) WHERE (A.UN = ?) AND (A.PW = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtUN" Name="?" PropertyName="Text" />
            <asp:Parameter Name="?" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>