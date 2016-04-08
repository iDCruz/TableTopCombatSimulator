<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
</head>
<body>
    <h1>Login Page</h1>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="error_lbl" runat="server"></asp:Label>
        <br />
    
    </div>
        <asp:TextBox ID="tb_user" runat="server"></asp:TextBox>
        User Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="user_name_validator" runat="server" ControlToValidate="tb_user" ErrorMessage="User Name Required" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:TextBox ID="tb_pass" TextMode="Password" runat="server"></asp:TextBox>
        Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="password_validator" runat="server" ControlToValidate="tb_pass" ErrorMessage="Password Required" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="btn_login" runat="server" OnClick="btn_login_Click" Text="Login" />
        <br />
        <br />
        <asp:Button ID="btn_register" runat="server" OnClick="btn_register_Click" Text="Register" />
    </form>
</body>
</html>
