<%@ Page Title="College CRUD" Language="C#" MasterPageFile="~/MySite.Master" AutoEventWireup="true" CodeBehind="CollegeCRUD.aspx.cs" Inherits="IbanaWebSystem22526.CollegeCRUD" %>

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

        /* Sunken Textboxes for the Form */
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
        <h3 style="color: #1a3324; font-weight: 800; letter-spacing: -1px;">College CRUD</h3>
    </div>

    <!-- ==========================================
         THE DATA GRIDVIEW 
         ========================================== -->
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="collegeID" DataSourceID="SqlDataSource2" CssClass="table table-borderless neo-gridview" GridLines="None" OnRowDeleted="GridView1_RowDeleted" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
        <Columns>
            <asp:TemplateField HeaderText="No.">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="collegeID" HeaderText="collegeID" InsertVisible="False" ReadOnly="True" SortExpression="collegeID" Visible="False" />
            <asp:BoundField DataField="Code" HeaderText="Code" SortExpression="Code" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:CheckBoxField DataField="Deleted" HeaderText="Deleted" SortExpression="Deleted" Visible="False" />
            <asp:TemplateField HeaderText="Action" ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="btnEdit" runat="server" CommandName="Select" Text="Edit" CssClass="neo-btn-action text-edit" OnClick="btnEdit_Click" />
                    <asp:Button ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" CssClass="neo-btn-action text-delete" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>


    <!-- ==========================================
         BOTTOM ACTION AREA (Restored Location)
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

    <!-- DATA SOURCE -->
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>" ProviderName="<%$ ConnectionStrings:ConnectionString3.ProviderName %>" SelectCommand="SELECT * FROM [tblCollege] WHERE [Deleted] = 0" OnInserted="SqlDataSource2_Inserted" OnUpdated="SqlDataSource2_Updated" DeleteCommand="UPDATE tblCollege SET Deleted = ? WHERE (collegeID = ?)" InsertCommand="INSERT INTO tblCollege(Code, Description, Deleted) VALUES (?, ?, ?)" UpdateCommand="UPDATE tblCollege SET Code = ?, Description = ? WHERE (collegeID = ?)" >
        <DeleteParameters>
            <asp:Parameter Name="?" DefaultValue="1" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="txtCode" Name="?" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtDescription" Name="?" PropertyName="Text" />
            <asp:Parameter DefaultValue="0" Name="?" />
        </InsertParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="txtCode" Name="?" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtDescription" Name="?" PropertyName="Text" />
            <asp:ControlParameter ControlID="GridView1" Name="?" PropertyName="SelectedValue" />
        </UpdateParameters>
    </asp:SqlDataSource>


    <!-- ==========================================
         THE ADD/EDIT RECORD PANEL
         ========================================== -->
    <asp:Panel ID="pnlAddNewRecord" runat="server" Visible="false">
        <div class="neo-edit-card">
            <h4 style="color: #1a3324; font-weight: bold; margin-bottom: 1.5rem;">Record Details</h4>
            
            <asp:Label ID="Label1" runat="server" Text="Code" CssClass="neo-form-label"></asp:Label>
            <asp:TextBox ID="txtCode" runat="server" CssClass="form-control neo-form-control"></asp:TextBox>

            <asp:Label ID="Label2" runat="server" Text="Description" CssClass="neo-form-label"></asp:Label>
            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control neo-form-control"></asp:TextBox>
            
            <div class="mt-4 pt-2">
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="neo-btn-action text-edit" OnClick="btnSave_Click" />
                <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="neo-btn-action text-edit" OnClick="btnUpdate_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="neo-btn-action text-cancel" OnClick="btnCancel_Click"/>
            </div>
        </div>
    </asp:Panel>

</asp:Content>