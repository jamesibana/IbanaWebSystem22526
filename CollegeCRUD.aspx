<%@ Page Title="" Language="C#" MasterPageFile="~/MySite.Master" AutoEventWireup="true" CodeBehind="CollegeCRUD.aspx.cs" Inherits="IbanaWebSystem22526.CollegeCRUD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="collegeID" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:BoundField DataField="collegeID" HeaderText="collegeID" InsertVisible="False" ReadOnly="True" SortExpression="collegeID" Visible="False" />
            <asp:BoundField DataField="Code" HeaderText="Code" SortExpression="Code" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:CheckBoxField DataField="Deleted" HeaderText="Deleted" SortExpression="Deleted" Visible="False" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT * FROM [tblCollege]" InsertCommand="INSERT INTO tblCollege(Code, Description, Deleted) VALUES (?, ?, ?)">
        <InsertParameters>
            <asp:ControlParameter ControlID="txtCode" Name="?" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtDescription" Name="?" PropertyName="Text" />
            <asp:Parameter DefaultValue="0" Name="?" />
        </InsertParameters>
    </asp:SqlDataSource>

    <asp:LinkButton ID="lbtnAddNewRecord" runat="server" OnClick="lbtnAddNewRecord_Click">Add New Record</asp:LinkButton>

    <asp:Panel ID="pnlAddNewRecord" runat="server" Visible="false">
        <asp:Label ID="Label1" runat="server" Text="Code"></asp:Label>
        <asp:TextBox ID="txtCode" runat="server" CssClass="form-control"></asp:TextBox>

        <asp:Label ID="Label2" runat="server" Text="Description"></asp:Label>
        <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control"></asp:TextBox>
        <br />

        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
    </asp:Panel>




</asp:Content>
