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
                <td><asp:RequiredFieldValidator ID="user_name_validator" runat="server" ControlToValidate="tb_user" ErrorMessage="User Name Required" ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><asp:TextBox ID="tb_pass" TextMode="Password" runat="server"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="password_validator" runat="server" ControlToValidate="tb_pass" ErrorMessage="Password Required" ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>
        </table>
        <br />
        <br />
        <asp:Button ID="btn_login" runat="server" OnClick="btn_login_Click" Text="Login" />
        <br />
        <br />
        <asp:Button ID="btn_register" runat="server" OnClick="btn_register_Click" Text="Register" />
    </form>
</body>
</html>
