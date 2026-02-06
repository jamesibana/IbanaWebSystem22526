<%@ Page Title="" Language="C#" MasterPageFile="~/MySite.Master" AutoEventWireup="true" CodeBehind="Ibana.aspx.cs" Inherits="IbanaWebSystem22526.Ibana" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%--Header--%>
    <hr />
    <h1>ASP.NET</h1>
    <hr />
    <%--Body--%>
    <div class="row">
        <section class="col-md-4">
            <h3>Label/Textbox/Button</h3>
            <hr />
            <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
            <br />
            <asp:TextBox ID="txtUsername" class="form-control" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnSubmit" class="btn btn-success" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
            <br />
            <asp:Label ID="lblDisplayMsg" runat="server" Text=""></asp:Label>
        </section>
        <section class="col-md-4">
            <h3>Hyperlink</h3>
            <hr />
        </section>
        <section class="col-md-4">
            <h3>Radiobutton</h3>
            <hr />
        </section>
    </div>
</asp:Content>
