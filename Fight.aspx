﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Fight.aspx.cs" Inherits="Fight" %>

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
        <asp:Button ID="Fight_btn" runat="server" Text="Fight" OnClick="Fight_Click" />
        <asp:SqlDataSource ID="Creature_Select" runat="server" ConnectionString="<%$ ConnectionStrings:TableTop_DB %>" SelectCommand="SELECT [creature_name] FROM [Creatures] WHERE ([user_id] = @User_id)">
        <SelectParameters>
            <asp:sessionparameter Name="User_id" SessionField="User_id" Type="Int32" />
        </SelectParameters>
        </asp:SqlDataSource>
        <br />
        Fight Results<br />
        <br />
        Creature 1 Win Rate:
        <asp:Label ID="Win_Rate_1" runat="server" Text=""></asp:Label>
        <br />
        <br />
        Creature 1 Average Accuracy Per Full Attack:
        <asp:Label ID="Accuracy_1" runat="server" Text=""></asp:Label>
        <br />
        <br />
        Creature 1 Average Damage Per Full Attack: 
        <asp:Label ID="Damage_1" runat="server" Text=""></asp:Label>
        <br />
        <br />
        Creature 2 Win Rate:
        <asp:Label ID="Win_Rate_2" runat="server" Text=""></asp:Label>
        <br />
        <br />
        Creature 2 Average Accuracy Per Full Attack:
        <asp:Label ID="Accuracy_2" runat="server" Text=""></asp:Label>
        <br />
        <br />
        Creature 2 Average Damage Per Full Attack:
        <asp:Label ID="Damage_2" runat="server" Text=""></asp:Label>
        <br />
        <br />
        <br />
    </form>
</body>
</html>
