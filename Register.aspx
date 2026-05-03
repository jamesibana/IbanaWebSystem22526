<%@ Page Title="Register" Language="C#" MasterPageFile="~/MySite.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="IbanaWebSystem22526.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- CSS -->
    <style>
        /* Parallax Background (Matches Home and Contact) */
        body {
            background-color: #e3efe8;
            background-image: radial-gradient(#c2d0c8 1px, transparent 1px);
            background-size: 20px 20px;
            background-attachment: fixed;
        }

        /* Cards */
        .neo-form-card {
            background-color: #e3efe8;
            border-radius: 2rem;
            box-shadow: 15px 15px 30px #c2d0c8, -15px -15px 30px #ffffff;
            padding: 3rem;
            max-width: 500px;
            margin: 4rem auto;
        }

        /* Green theme */
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

        /* Button CSS */
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
                <h2 class="fw-bold" style="color: #238551; letter-spacing: -1px;">Register</h2>
                <p style="color: #5c7465;">Create a new account.</p>
            </div>

            <!-- Student Number -->
            <div class="mb-4">
                <asp:Label ID="Label3" runat="server" Text="Student Number (with dashes)" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtStudentNumber" runat="server" CssClass="form-control" placeholder="e.g., 2x-1234-567"></asp:TextBox>
            </div>

            <!-- Username -->
            <div class="mb-4">
                <asp:Label ID="Label1" runat="server" Text="Username" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtUN" runat="server" CssClass="form-control" placeholder="Enter username"></asp:TextBox>
            </div>

            <!-- Password -->
            <div class="mb-4">
                <asp:Label ID="Label2" runat="server" Text="Password" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtPW" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter password"></asp:TextBox>
            </div>

            <!-- Submit -->
            <div class="d-grid gap-2 mt-5">
                <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" CssClass="btn btn-neo" />
            </div>

            <!-- Message -->
            <div class="text-center mt-3">
                <asp:Label ID="lblMessage" runat="server" Text="" Font-Bold="true" ForeColor="#d9534f"></asp:Label>
            </div>

        </div>
    </div>

    <!-- Data -->
    <asp:GridView ID="grdDuplicateCheck" runat="server" AutoGenerateColumns="False" DataKeyNames="studIndex" DataSourceID="SqlDataSource1" Visible="False">
        <Columns>
            <asp:BoundField DataField="studIndex" HeaderText="St" InsertVisible="False" ReadOnly="True" SortExpression="studIndex" />
        </Columns>
    </asp:GridView>

    <asp:GridView ID="grdValidation" runat="server" AutoGenerateColumns="False" DataKeyNames="index" DataSourceID="SqlDataSource2" Visible="False">
        <Columns>
            <asp:BoundField DataField="index" HeaderText="index" InsertVisible="False" ReadOnly="True" SortExpression="index" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:StudentInfo %>" ProviderName="<%$ ConnectionStrings:StudentInfo.ProviderName %>" SelectCommand="SELECT [index] FROM tblStudentInfo WHERE (StudentID = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtStudentNumber" Name="?" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentInfo %>" InsertCommand="INSERT INTO tblUNPW(studIndex, UN, PW) VALUES (?, ?, ?)" ProviderName="<%$ ConnectionStrings:StudentInfo.ProviderName %>" SelectCommand="SELECT studIndex FROM tblUNPW WHERE (studIndex = ?)">
        <InsertParameters>
            <asp:Parameter Name="?" />
            <asp:ControlParameter ControlID="txtUN" Name="?" PropertyName="Text" />
            <asp:Parameter DefaultValue="" Name="HashedPW" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="?" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="grdUsernameCheck" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" Visible="False">
        <Columns>
            <asp:BoundField DataField="UN" HeaderText="UN" SortExpression="UN" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:StudentInfo %>" ProviderName="<%$ ConnectionStrings:StudentInfo.ProviderName %>" SelectCommand="SELECT UN FROM tblUNPW WHERE (UN = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtUN" Name="?" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
