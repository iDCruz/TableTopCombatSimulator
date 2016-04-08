<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Fight.aspx.cs" Inherits="Fight" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h2> Fight Simulator Page </h2>
    <form id="form1" runat="server">
    <div>
    
    </div>
&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="Creature_Select" DataTextField="creature_name" DataValueField="creature_name" AppendDataBoundItems="True">
            <asp:ListItem>Select Creature</asp:ListItem>
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp; VS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="Creature_Select" DataTextField="creature_name" DataValueField="creature_name" AppendDataBoundItems="True">
            <asp:ListItem>Select Creature</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Fight" />
        <asp:SqlDataSource ID="Creature_Select" runat="server" ConnectionString="<%$ ConnectionStrings:TableTop_DB %>" SelectCommand="SELECT [creature_name] FROM [Creatures]"></asp:SqlDataSource>
        <br />
    </form>
</body>
</html>
