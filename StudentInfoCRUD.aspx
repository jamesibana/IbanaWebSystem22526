<%@ Page Title="" Language="C#" MasterPageFile="~/MySite.Master" AutoEventWireup="true" CodeBehind="StudentInfoCRUD.aspx.cs" Inherits="IbanaWebSystem22526.StudentInfoCRUD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="index,Sex" DataSourceID="StudentInfo" class="table table-hover" OnRowDeleted="GridView1_RowDeleted" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:TemplateField HeaderText="No.">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="index" HeaderText="index" InsertVisible="False" ReadOnly="True" SortExpression="index" Visible="False" />
            <asp:BoundField DataField="StudentID" HeaderText="StudentID" SortExpression="StudentID" />
            <asp:BoundField DataField="Firstname" HeaderText="Firstname" SortExpression="Firstname" />
            <asp:BoundField DataField="Middlename" HeaderText="Middlename" SortExpression="Middlename" />
            <asp:BoundField DataField="Lastname" HeaderText="Lastname" SortExpression="Lastname" />
            <asp:BoundField DataField="Bday" HeaderText="Bday" SortExpression="Bday" DataFormatString="{0:MMM dd, yyyy}" />
            <asp:BoundField DataField="Sex" HeaderText="Sex" SortExpression="Sex" />
            <asp:BoundField DataField="ProgramID" HeaderText="ProgramID" SortExpression="ProgramID" />
            <asp:BoundField DataField="YearLevel" HeaderText="YearLevel" SortExpression="YearLevel" />
            <asp:CheckBoxField DataField="Deleted" HeaderText="Deleted" SortExpression="Deleted" Visible="False" />
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:Button ID="btnEdit" runat="server" Text="Edit" class="btn btn-outline-primary" CommandName="Select" OnClick="btnEdit_Click" />
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger" CommandName="Delete" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="BdayRaw" Visible="False">
                <ItemTemplate>
                    <asp:Label ID="lblBdayRaw" runat="server" Text='<%# Eval("Bday") != null ? ((DateTime) Eval("Bday")).ToString("yyyy-MM-dd") : ""%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

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

    <asp:Label ID="lblMessage" runat="server" Text="" CssClass="form-control btn btn-success"></asp:Label>
    <br />

    <asp:LinkButton ID="lbtnAddNewRecord" runat="server" OnClick="lbtnAddNewRecord_Click">Add New Record</asp:LinkButton>

    <asp:Panel ID="pnlAddNewRecord" runat="server" Visible="false">
        <asp:Label ID="Label1" runat="server" Text="Student ID"></asp:Label>
        <asp:TextBox ID="txtStudentID" runat="server" CssClass="form-control"></asp:TextBox>


        <asp:Label ID="Label2" runat="server" Text="First Name"></asp:Label>
        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>

        <asp:Label ID="Label3" runat="server" Text="Middle Name"></asp:Label>
        <asp:TextBox ID="txtMiddleName" runat="server" CssClass="form-control"></asp:TextBox>

        <asp:Label ID="Label4" runat="server" Text="Last Name"></asp:Label>
        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>

        <asp:Label ID="Label5" runat="server" Text="Birthday"></asp:Label>
        <asp:TextBox ID="txtBday" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>

        <asp:Label ID="Label6" runat="server" Text="Sex"></asp:Label>
        <br />
        <asp:RadioButton ID="rbtnMale" runat="server" GroupName="Sex" Text="Male" />
        <asp:RadioButton ID="rbtnFemale" runat="server" GroupName="Sex" Text="Female" />
        <br />

        <asp:Label ID="Label7" runat="server" Text="Program"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" DataSourceID="ProgramStud" DataTextField="Description" DataValueField="ProgramID"></asp:DropDownList>
        <asp:SqlDataSource ID="ProgramStud" runat="server" ConnectionString="<%$ ConnectionStrings:ProgramSTUDENT %>" ProviderName="<%$ ConnectionStrings:ProgramSTUDENT.ProviderName %>" SelectCommand="SELECT ProgramID, Description FROM tblProgram WHERE (Deleted = 0)"></asp:SqlDataSource>

        <asp:Label ID="Label8" runat="server" Text="Year Level"></asp:Label>
        <asp:DropDownList ID="ddlYearLevel" runat="server" CssClass="form-control">
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
        </asp:DropDownList>
        <br />

        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnSave_Click" />
        <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="btnUpdate_Click" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary" OnClick="btnCancel_Click" />
    </asp:Panel>

</asp:Content>


