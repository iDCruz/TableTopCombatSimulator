﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FightHistory.aspx.cs" Inherits="FightHistory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fight History</title>
    <link href="StyleSheet.css" type="text/css" rel="stylesheet" />
</head>
<body class="center">
    <h1>Fight History</h1>
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="fight_id" DataSourceID="Fight_History_Source" CssClass="grid">
            <RowStyle CssClass="row" />
            <AlternatingRowStyle CssClass="altrow" />
            <Columns>
                <asp:BoundField DataField="fight_id" HeaderText="Fight ID" InsertVisible="False" ReadOnly="True" SortExpression="fight_id" />
                <asp:BoundField DataField="user_id" HeaderText="user_id" SortExpression="user_id" Visible="false" />
                <asp:BoundField ItemStyle-CssClass="creature1" DataField="creature_1_name" HeaderText="Creature 1" SortExpression="creature_1_name" />
                <asp:BoundField ItemStyle-CssClass="creature2" DataField="creature_2_name" HeaderText="Creature 2" SortExpression="creature_2_name" />
                <asp:BoundField DataField="creature_1_id" HeaderText="creature_1_id" SortExpression="creature_1_id" Visible="false" />
                <asp:BoundField DataField="creature_2_id" HeaderText="creature_2_id" SortExpression="creature_2_id" Visible="false" />
                <asp:BoundField ItemStyle-CssClass="creature1" DataField="creature_1_hit_rate" HeaderText="Creature 1 Hit %" SortExpression="creature_1_hit_rate" />
                <asp:BoundField ItemStyle-CssClass="creature2" DataField="creature_2_hit_rate" HeaderText="Creature 2 Hit %" SortExpression="creature_2_hit_rate" />
                <asp:BoundField ItemStyle-CssClass="creature1" DataField="creature_1_damage_rate" HeaderText="Creature 1 Damage per Round" SortExpression="creature_1_damage_rate" />
                <asp:BoundField ItemStyle-CssClass="creature2" DataField="creature_2_damage_rate" HeaderText="Creature 2 Damage per Round" SortExpression="creature_2_damage_rate" />
                <asp:BoundField ItemStyle-CssClass="creature1" DataField="creature_1_win_rate" HeaderText="Creature 1 Win %" SortExpression="creature_1_win_rate" />
                <asp:BoundField ItemStyle-CssClass="creature2" DataField="creature_2_win_rate" HeaderText="Creature 2 Win %" SortExpression="creature_2_win_rate" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="Fight_History_Source" runat="server" ConnectionString="<%$ ConnectionStrings:TableTop_DB %>" SelectCommand="SELECT History.*, A.creature_name As creature_1_name, B.creature_name As creature_2_name FROM History,Creatures As A,Creatures As B WHERE History.creature_1_id = A.creature_id AND History.creature_2_id = B.creature_id "></asp:SqlDataSource>
    </form>
    <footer>
        <br />
        <br />
        <br />
        Created by David Cruz, Gurdane Sethi, and Kevin Wagner.
    </footer>
</body>
</html>
