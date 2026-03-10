<%@ Page Title="" Language="C#" MasterPageFile="~/MySite.Master" AutoEventWireup="true" CodeBehind="CollegeCRUD.aspx.cs" Inherits="IbanaWebSystem22526.CollegeCRUD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="collegeID" DataSourceID="SqlDataSource2" class="table table-hover" OnRowDeleted="GridView1_RowDeleted" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
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
                    &nbsp;<asp:Button ID="btnEdit" runat="server" CommandName="Select" Text="Edit" class="btn btn-outline-primary" OnClick="btnEdit_Click" />
                    &nbsp;<asp:Button ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" class="btn btn-danger" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>" ProviderName="<%$ ConnectionStrings:ConnectionString3.ProviderName %>" SelectCommand="SELECT * FROM [tblCollege]" OnInserted="SqlDataSource2_Inserted" OnUpdated="SqlDataSource2_Updated">
    </asp:SqlDataSource>

    <asp:Label ID="lblMessage" runat="server" Text="" class="form-control btn btn-success"></asp:Label>
    <br />

    <asp:LinkButton ID="lbtnAddNewRecord" runat="server" OnClick="lbtnAddNewRecord_Click">Add New Record</asp:LinkButton>

    <asp:Panel ID="pnlAddNewRecord" runat="server" Visible="false">
        <asp:Label ID="Label1" runat="server" Text="Code"></asp:Label>
        <asp:TextBox ID="txtCode" runat="server" CssClass="form-control"></asp:TextBox>

        <asp:Label ID="Label2" runat="server" Text="Description"></asp:Label>
        <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control"></asp:TextBox>
        <br />

        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" class="btn btn-primary"/>
        <asp:Button ID="btnUpdate" runat="server" Text="Update" class="btn btn-primary" OnClick="btnUpdate_Click" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn btn-secondary" OnClick="btnCancel_Click"/>
    </asp:Panel>




</asp:Content>
