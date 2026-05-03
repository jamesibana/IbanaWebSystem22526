<%@ Page Title="Student Info CRUD" Language="C#" MasterPageFile="~/MySite.Master" AutoEventWireup="true" CodeBehind="StudentInfoCRUD.aspx.cs" Inherits="IbanaWebSystem22526.StudentInfoCRUD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- GREEN NEUMORPHIC CRUD CSS -->
    <style>
        /* The Disguised LinkButton */
        .neo-link-btn {
            background-color: #e3efe8;
            color: #238551 !important; /* Emerald Green */
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            text-decoration: none;
            padding: 0.8rem 1.8rem;
            border-radius: 50px;
            display: inline-block;
            box-shadow: 8px 8px 15px #c2d0c8, -8px -8px 15px #ffffff;
            transition: all 0.2s ease;
            border: none;
        }

        .neo-link-btn:hover {
            color: #1a3324 !important;
            box-shadow: inset 5px 5px 10px #c2d0c8, inset -5px -5px 10px #ffffff;
            transform: scale(0.98);
        }

        /* GridView Table Styling */
        .neo-gridview {
            background-color: #e3efe8 !important;
            border-radius: 1.5rem;
            box-shadow: 15px 15px 30px #c2d0c8, -15px -15px 30px #ffffff;
            margin-bottom: 2rem;
            margin-top: 1rem;
            border-collapse: separate;
            border-spacing: 0;
            overflow: hidden; 
            width: 100%;
        }

        .neo-gridview > tbody > tr > td, 
        .neo-gridview > tbody > tr > th,
        .neo-gridview > thead > tr > th {
            background-color: transparent !important; 
            color: #5c7465;
            vertical-align: middle;
            padding: 1.5rem !important; 
            border-bottom: 1px solid rgba(194, 208, 200, 0.4);
        }

        .neo-gridview > thead > tr > th {
            color: #1a3324;
            font-weight: 700;
            border-bottom: 2px solid #c2d0c8;
        }

        /* Sunken Textboxes & Dropdowns for the Form */
        .neo-form-control {
            background-color: #e3efe8 !important;
            border: none !important;
            box-shadow: inset 6px 6px 12px #c2d0c8, inset -6px -6px 12px #ffffff !important;
            color: #1a3324 !important;
            border-radius: 15px !important; 
            padding: 0.8rem 1.2rem !important;
            margin-bottom: 1.5rem;
        }

        .neo-form-label {
            color: #5c7465;
            font-weight: 600;
            margin-bottom: 0.5rem;
            margin-left: 0.5rem;
        }

        /* Custom Radio Button Styling */
        .neo-radio-group {
            margin-bottom: 1.5rem;
            padding-left: 0.5rem;
        }
        
        .neo-radio-group input[type="radio"] {
            accent-color: #238551; /* Turns the radio dot green */
            transform: scale(1.2);
            cursor: pointer;
            margin-right: 0.5rem;
        }

        .neo-radio-group label {
            color: #1a3324;
            font-weight: 500;
            margin-right: 2rem;
            cursor: pointer;
        }

        /* Action Buttons */
        .neo-btn-action {
            background-color: #e3efe8;
            border: none;
            border-radius: 50px;
            font-weight: bold;
            padding: 0.5rem 1.2rem;
            box-shadow: 5px 5px 10px #c2d0c8, -5px -5px 10px #ffffff;
            transition: all 0.2s ease;
            margin-right: 0.5rem;
        }
        .neo-btn-action:hover {
            box-shadow: inset 3px 3px 6px #c2d0c8, inset -3px -3px 6px #ffffff;
            transform: scale(0.95);
        }
        
        .text-edit { color: #238551; }    
        .text-delete { color: #d9534f; }  
        .text-cancel { color: #5c7465; }  
        
        /* The Card Container for the Edit Panel */
        .neo-edit-card {
            background-color: #e3efe8;
            border-radius: 1.5rem;
            box-shadow: 15px 15px 30px #c2d0c8, -15px -15px 30px #ffffff;
            padding: 2.5rem;
            margin-bottom: 2rem;
            margin-top: 1rem;
            max-width: 600px;
        }

        /* Alert Message Badge */
        .neo-alert-success {
            display: inline-block;
            background-color: #238551; 
            color: #ffffff !important; 
            padding: 0.6rem 1.5rem;
            border-radius: 50px; 
            font-weight: 600;
            letter-spacing: 0.5px;
            margin-bottom: 1rem;
            box-shadow: 5px 5px 15px rgba(35, 133, 81, 0.3), inset 2px 2px 5px rgba(255, 255, 255, 0.2);
        }

        .neo-alert-success:empty {
            display: none !important;
        }
    </style>

    <!-- Header -->
    <div class="mt-4 mb-3" style="padding-left: 1rem;">
        <h3 style="color: #1a3324; font-weight: 800; letter-spacing: -1px;">Student Info CRUD</h3>
    </div>

    <!-- ==========================================
         THE DATA GRIDVIEW 
         ========================================== -->
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="index,Sex" DataSourceID="StudentInfo" CssClass="table table-borderless neo-gridview" GridLines="None" OnRowDeleted="GridView1_RowDeleted" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:TemplateField HeaderText="No.">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="index" HeaderText="index" InsertVisible="False" ReadOnly="True" SortExpression="index" Visible="False" />
            <asp:BoundField DataField="StudentID" HeaderText="Student ID" SortExpression="StudentID" />
            <asp:BoundField DataField="Firstname" HeaderText="First Name" SortExpression="Firstname" />
            <asp:BoundField DataField="Middlename" HeaderText="Middle Name" SortExpression="Middlename" />
            <asp:BoundField DataField="Lastname" HeaderText="Last Name" SortExpression="Lastname" />
            <asp:BoundField DataField="Bday" HeaderText="Birthday" SortExpression="Bday" DataFormatString="{0:MMM dd, yyyy}" />
            <asp:BoundField DataField="Sex" HeaderText="Sex" SortExpression="Sex" />
            <asp:BoundField DataField="ProgramID" HeaderText="Program ID" SortExpression="ProgramID" />
            <asp:BoundField DataField="YearLevel" HeaderText="Year Level" SortExpression="YearLevel" />
            <asp:CheckBoxField DataField="Deleted" HeaderText="Deleted" SortExpression="Deleted" Visible="False" />
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="neo-btn-action text-edit" CommandName="Select" OnClick="btnEdit_Click" />
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="neo-btn-action text-delete" CommandName="Delete"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="BdayRaw" Visible="False">
                <ItemTemplate>
                    <asp:Label ID="lblBdayRaw" runat="server" Text='<%# Eval("Bday") != null ? ((DateTime) Eval("Bday")).ToString("yyyy-MM-dd") : ""%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>


    <!-- ==========================================
         BOTTOM ACTION AREA
         ========================================== -->
    <div class="mt-4 mb-4" style="padding-left: 1rem;">
        
        <!-- 1. The Session Label -->
        <asp:Label ID="lblStudName" runat="server" Text="Label" Font-Bold="true" ForeColor="#5c7465" style="display: block; margin-bottom: 1rem;"></asp:Label>
        
        <!-- 2. The Alert Message -->
        <asp:Label ID="lblMessage" runat="server" CssClass="neo-alert-success"></asp:Label>
        
        <!-- 3. The Add Record Button -->
        <div style="margin-top: 0.5rem;">
            <asp:LinkButton ID="lbtnAddNewRecord" runat="server" CssClass="neo-link-btn" OnClick="lbtnAddNewRecord_Click">
                + Add New Record
            </asp:LinkButton>
        </div>

    </div>

    <!-- DATA SOURCES -->
    <asp:SqlDataSource ID="StudentInfo" runat="server" ConnectionString="<%$ ConnectionStrings:StudentInfo %>" ProviderName="<%$ ConnectionStrings:StudentInfo.ProviderName %>" SelectCommand="SELECT [index], StudentID, Firstname, Middlename, Lastname, Bday, Sex, ProgramID, YearLevel, Deleted FROM tblStudentInfo WHERE (Deleted = 0)" DeleteCommand="UPDATE tblStudentInfo SET Deleted = ? WHERE ([index] = ?)" InsertCommand="INSERT INTO tblStudentInfo(StudentID, Firstname, Middlename, Lastname, Bday, Sex, ProgramID, YearLevel, Deleted) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)" OnInserted="StudentInfo_Inserted" OnUpdated="StudentInfo_Updated" UpdateCommand="UPDATE tblStudentInfo SET StudentID = ?, Firstname = ?, Middlename = ?, Lastname = ?, Bday = ?, Sex = ?, ProgramID = ?, YearLevel = ? WHERE ([index] = ?)">
        <DeleteParameters>
            <asp:Parameter DefaultValue="1" Name="?" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="txtStudentID" Name="?" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtFirstName" Name="?" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtMiddleName" Name="?" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtLastName" Name="?" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtBday" Name="?" PropertyName="Text" />
            <asp:Parameter Name="Sex" DefaultValue="" />
            <asp:ControlParameter ControlID="DropDownList1" Name="?" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="ddlYearLevel" Name="?" PropertyName="SelectedValue" />
            <asp:Parameter DefaultValue="0" Name="?" />
        </InsertParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="txtStudentID" Name="?" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtFirstName" Name="?" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtMiddleName" Name="?" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtLastName" Name="?" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtBday" Name="?" PropertyName="Text" />
            <asp:Parameter Name="Sex" />
            <asp:ControlParameter ControlID="DropDownList1" Name="?" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="ddlYearLevel" Name="?" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="GridView1" Name="index" PropertyName="SelectedValue" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="ProgramStud" runat="server" ConnectionString="<%$ ConnectionStrings:ProgramSTUDENT %>" ProviderName="<%$ ConnectionStrings:ProgramSTUDENT.ProviderName %>" SelectCommand="SELECT ProgramID, Description FROM tblProgram WHERE (Deleted = 0)"></asp:SqlDataSource>


    <!-- ==========================================
         THE ADD/EDIT RECORD PANEL
         ========================================== -->
    <asp:Panel ID="pnlAddNewRecord" runat="server" Visible="false">
        <div class="neo-edit-card">
            <h4 style="color: #1a3324; font-weight: bold; margin-bottom: 1.5rem;">Student Details</h4>
            
            <div class="row">
                <!-- Column 1 -->
                <div class="col-md-6">
                    <asp:Label ID="Label1" runat="server" Text="Student ID" CssClass="neo-form-label"></asp:Label>
                    <asp:TextBox ID="txtStudentID" runat="server" CssClass="form-control neo-form-control"></asp:TextBox>

                    <asp:Label ID="Label2" runat="server" Text="First Name" CssClass="neo-form-label"></asp:Label>
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control neo-form-control"></asp:TextBox>

                    <asp:Label ID="Label3" runat="server" Text="Middle Name" CssClass="neo-form-label"></asp:Label>
                    <asp:TextBox ID="txtMiddleName" runat="server" CssClass="form-control neo-form-control"></asp:TextBox>

                    <asp:Label ID="Label4" runat="server" Text="Last Name" CssClass="neo-form-label"></asp:Label>
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control neo-form-control"></asp:TextBox>
                </div>

                <!-- Column 2 -->
                <div class="col-md-6">
                    <asp:Label ID="Label5" runat="server" Text="Birthday" CssClass="neo-form-label"></asp:Label>
                    <asp:TextBox ID="txtBday" runat="server" TextMode="Date" CssClass="form-control neo-form-control"></asp:TextBox>

                    <asp:Label ID="Label6" runat="server" Text="Sex" CssClass="neo-form-label"></asp:Label>
                    <div class="neo-radio-group d-flex align-items-center mt-2">
                        <asp:RadioButton ID="rbtnMale" runat="server" GroupName="Sex" Text="Male" />
                        <asp:RadioButton ID="rbtnFemale" runat="server" GroupName="Sex" Text="Female" />
                    </div>

                    <asp:Label ID="Label7" runat="server" Text="Program" CssClass="neo-form-label mt-2"></asp:Label>
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control neo-form-control" DataSourceID="ProgramStud" DataTextField="Description" DataValueField="ProgramID"></asp:DropDownList>

                    <asp:Label ID="Label8" runat="server" Text="Year Level" CssClass="neo-form-label"></asp:Label>
                    <asp:DropDownList ID="ddlYearLevel" runat="server" CssClass="form-control neo-form-control">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            
            <div class="mt-4 pt-2 text-end">
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="neo-btn-action text-edit" OnClick="btnSave_Click" />
                <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="neo-btn-action text-edit" OnClick="btnUpdate_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="neo-btn-action text-cancel" OnClick="btnCancel_Click" />
            </div>
        </div>
    </asp:Panel>

</asp:Content>