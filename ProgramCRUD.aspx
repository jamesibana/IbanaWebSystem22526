<%@ Page Title="" Language="C#" MasterPageFile="~/MySite.Master" AutoEventWireup="true" CodeBehind="ProgramCRUD.aspx.cs" Inherits="IbanaWebSystem22526.ProgramCRUD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ProgramID,CollegeID" DataSourceID="Program" class="table table-hover" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDeleted="GridView1_RowDeleted">
        <Columns>
            <asp:TemplateField HeaderText="No.">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Code" HeaderText="Code" SortExpression="Code" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:CheckBoxField DataField="Deleted" HeaderText="Deleted" SortExpression="Deleted" Visible="False" />
            <asp:BoundField DataField="CollegeID" HeaderText="CollegeID" SortExpression="CollegeID" />
            <asp:TemplateField HeaderText="Action" ShowHeader="False">
                <ItemTemplate>
                    &nbsp;<asp:Button ID="btnEdit" runat="server" CommandName="Select" Text="Edit" class="btn btn-outline-primary" OnClick="btnEdit_Click" />
                    &nbsp;<asp:Button ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" class="btn btn-danger" />
                </ItemTemplate>

            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="Program" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString5 %>" ProviderName="<%$ ConnectionStrings:ConnectionString5.ProviderName %>" SelectCommand="SELECT ProgramID, Code, Description, CollegeID, Deleted FROM tblProgram WHERE (Deleted = 0)" OnInserted="Program_Inserted" DeleteCommand="UPDATE tblProgram SET Deleted = ? WHERE (ProgramID = ?)" InsertCommand="INSERT INTO tblProgram(Code, Description, CollegeID, Deleted) VALUES (?, ?, ?, ?)" OnUpdated="Program_Updated" UpdateCommand="UPDATE tblProgram SET Code = ?, Description = ?, CollegeID = ? WHERE (ProgramID = ?)">
        <DeleteParameters>
            <asp:Parameter Name="Deleted" DefaultValue="1" />
            <asp:Parameter Name="ProgramID" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="txtCode" Name="Code" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtName" Name="Description" PropertyName="Text" />
            <asp:ControlParameter ControlID="DropDownList1" Name="CollegeID" PropertyName="SelectedValue" />
            <asp:Parameter Name="Deleted" DefaultValue="0" />
        </InsertParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="txtCode" Name="Code" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtName" Name="Description" PropertyName="Text" />
            <asp:ControlParameter ControlID="DropDownList1" Name="CollegeID" PropertyName="SelectedValue" />
            <asp:Parameter Name="ProgramID" />
        </UpdateParameters>
    </asp:SqlDataSource>
    

    <asp:Label ID="lblMessage" runat="server" Text="" class="form-control btn btn-success"></asp:Label>
    <br />

    <asp:LinkButton ID="lbtnAddNewRecord" runat="server" OnClick="lbtnAddNewRecord_Click">Add New Record</asp:LinkButton>

    <asp:Panel ID="pnlAddNewRecord" runat="server" Visible="false">
        <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
        <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>

        <asp:Label ID="Label2" runat="server" Text="Code"></asp:Label>
        <asp:TextBox ID="txtCode" runat="server" CssClass="form-control"></asp:TextBox>

        <asp:Label ID="Label3" runat="server" Text="College:"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" DataSourceID="College" DataTextField="Description" DataValueField="CollegeID"></asp:DropDownList>
        <asp:SqlDataSource ID="College" runat="server" ConnectionString="<%$ ConnectionStrings:College %>" ProviderName="<%$ ConnectionStrings:College.ProviderName %>" SelectCommand="SELECT CollegeID, Description FROM tblCollege WHERE (Deleted = 0)"></asp:SqlDataSource>
        <br />

        <asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-primary" OnClick="btnSave_Click"/>
        <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="btnUpdate_Click" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn btn-secondary" OnClick="btnCancel_Click"/>
    </asp:Panel>

</asp:Content>
