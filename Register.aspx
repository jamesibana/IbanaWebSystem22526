<%@ Page Title="" Language="C#" MasterPageFile="~/MySite.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="IbanaWebSystem22526.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Label ID="Label3" runat="server" Text="Student Index: "></asp:Label>
    <asp:TextBox ID="txtStudentIndex" runat="server"></asp:TextBox>
    <br />

    <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
    <asp:TextBox ID="txtUN" runat="server"></asp:TextBox>
    <br />

    <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
    <asp:TextBox ID="txtPW" runat="server"></asp:TextBox>
    <br />

    <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
    <br />

    <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
    <br />

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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:StudentInfo %>" ProviderName="<%$ ConnectionStrings:StudentInfo.ProviderName %>" SelectCommand="SELECT [index] FROM tblStudentInfo WHERE ([index] = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtStudentIndex" Name="?" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentInfo %>" InsertCommand="INSERT INTO tblUNPW(studIndex, UN, PW) VALUES (?, ?, ?)" ProviderName="<%$ ConnectionStrings:StudentInfo.ProviderName %>" SelectCommand="SELECT studIndex FROM tblUNPW WHERE (studIndex = ?)">
        <InsertParameters>
            <asp:ControlParameter ControlID="txtStudentIndex" Name="?" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtUN" Name="?" PropertyName="Text" />
            <asp:Parameter DefaultValue="" Name="HashedPW" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtStudentIndex" Name="?" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
