<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="StudentManagement.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />

    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }

        .auto-style2 {
            height: 26px;
            width: 392px;
        }

        .auto-style3 {
            width: 392px;
        }

        .auto-style4 {
            height: 26px;
            width: 329px;
        }

        .auto-style5 {
            width: 329px;
        }

        .auto-style8 {
            margin-left: 348px;
        }
        .auto-style9 {
            margin-left: 106px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div>
            <table style="width: 100%; margin-top: 50px;margin-left: 30px; margin-right: 30px">
                <tr>
                    <td class="auto-style2">ID:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="id" runat="server" Width="332px"></asp:TextBox>
                    </td>
                    <td class="auto-style1"></td>

                </tr>
                <tr>
                    <td class="auto-style3">StudentName:</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="studentname" runat="server" Width="331px"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">DOB:</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="dob" runat="server" Width="332px"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">Gender:</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="gender" runat="server" Width="331px"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                    <tr>
                        <td class="auto-style3">Email:</td>
                        <td class="auto-style5">
                            <asp:TextBox ID="email" runat="server" Width="332px"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </tr>
            </table>
            <asp:HiddenField ID="HiddenField1" runat="server" />
        </div>
        <div style="margin-top: 20px; justify-content: center; align-content: space-between">
            <asp:Button ID="Button1" runat="server" Text="Add" CssClass="auto-style8" class="btn btn-primary" Width="150px" OnClick="AddStudent"/> &nbsp;
            <asp:Button ID="Button4" runat="server" Text="Update" CssClass="auto-style7" Width="150px" OnClick="Update"/>&nbsp;
             <asp:Button ID="Button2" runat="server" Text="Retreive" CssClass="auto-style7" Width="150px" OnClick="RetreiveData" />&nbsp;
            <asp:Button ID="Button3" runat="server" Text="Delete" CssClass="auto-style7" Width="150px" OnClick="Delete" />
        </div>

        <div class="" style="margin-top: 40px;">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="auto-style9" Height="48px" Width="522px">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="StudentName" HeaderText="StudentName" SortExpression="StudentName" />
                    <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Student]"></asp:SqlDataSource>
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>


    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>


    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</body>

</html>
