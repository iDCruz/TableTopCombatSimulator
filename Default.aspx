<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <link href="StyleSheet.css" type="text/css" rel="stylesheet" />
</head>
<body class="center">
    <h1>Login Page</h1>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="error_lbl" runat="server"></asp:Label>
        <br />
    
    </div>
        <table style="margin:0 auto"">
            <tr>
                <td>User Name:</td>
                <td><asp:TextBox ID="tb_user" runat="server"></asp:TextBox></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><asp:TextBox ID="tb_pass" TextMode="Password" runat="server"></asp:TextBox></td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <asp:RequiredFieldValidator ID="user_name_validator" runat="server" ControlToValidate="tb_user" ErrorMessage="User Name Required" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <asp:RequiredFieldValidator ID="password_validator" runat="server" ControlToValidate="tb_pass" ErrorMessage="Password Required" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="btn_login" runat="server" OnClick="btn_login_Click" Text="Login" CssClass="menub" />
        <br />
        <br />
        <asp:Button ID="btn_register" runat="server" OnClick="btn_register_Click" Text="Register" CssClass="menub" />
    </form>
    <footer>
        <br />
        <br />
        <br />
        Created by David Cruz, Gurdane Sethi, and Kevin Wagner.
    </footer>
</body>
</html>
