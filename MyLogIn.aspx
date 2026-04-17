<%@ Page Title="" Language="C#" MasterPageFile="~/MySite.Master" AutoEventWireup="true" CodeBehind="MyLogIn.aspx.cs" Inherits="IbanaWebSystem22526.MyLogIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
    <asp:TextBox ID="txtUN" runat="server"></asp:TextBox> <br />

    <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
    <asp:TextBox ID="txtPW" runat="server"></asp:TextBox> <br />

    <asp:Button ID="btnLogIn" runat="server" Text="Log In" OnClick="btnLogIn_Click" />

    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="studIndex" HeaderText="studIndex" SortExpression="studIndex" />
            <asp:BoundField DataField="Firstname" HeaderText="Firstname" SortExpression="Firstname" />
            <asp:BoundField DataField="Lastname" HeaderText="Lastname" SortExpression="Lastname" />
            <asp:BoundField DataField="studIndex" HeaderText="studIndex" SortExpression="studIndex" />
            <asp:BoundField DataField="Code" HeaderText="Code" SortExpression="Code" />
            <asp:BoundField DataField="YearLevel" HeaderText="YearLevel" SortExpression="YearLevel" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentInfo %>" ProviderName="<%$ ConnectionStrings:StudentInfo.ProviderName %>" SelectCommand="SELECT A.ID, A.studIndex, B.Firstname, B.Lastname, B.YearLevel, C.Code FROM ((tblUNPW A INNER JOIN tblStudentInfo B ON A.studIndex = B.[index]) INNER JOIN tblProgram C ON B.ProgramID = C.ProgramID) WHERE (A.UN = ?) AND (A.PW = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtUN" Name="?" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtPW" Name="?" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
