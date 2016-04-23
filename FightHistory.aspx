<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FightHistory.aspx.cs" Inherits="FightHistory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="fight_id" DataSourceID="Fight_History_Source">
            <Columns>
                <asp:BoundField DataField="fight_id" HeaderText="fight_id" InsertVisible="False" ReadOnly="True" SortExpression="fight_id" />
                <asp:BoundField DataField="user_id" HeaderText="user_id" SortExpression="user_id" Visible="false" />
                <asp:BoundField DataField="creature_1_name" HeaderText="creature_1_name" SortExpression="creature_1_name" />
                <asp:BoundField DataField="creature_2_name" HeaderText="creature_2_name" SortExpression="creature_2_name" />
                <asp:BoundField DataField="creature_1_id" HeaderText="creature_1_id" SortExpression="creature_1_id" Visible="false" />
                <asp:BoundField DataField="creature_2_id" HeaderText="creature_2_id" SortExpression="creature_2_id" Visible="false" />
                <asp:BoundField DataField="creature_1_hit_rate" HeaderText="creature_1_hit_rate" SortExpression="creature_1_hit_rate" />
                <asp:BoundField DataField="creature_2_hit_rate" HeaderText="creature_2_hit_rate" SortExpression="creature_2_hit_rate" />
                <asp:BoundField DataField="creature_1_damage_rate" HeaderText="creature_1_damage_rate" SortExpression="creature_1_damage_rate" />
                <asp:BoundField DataField="creature_2_damage_rate" HeaderText="creature_2_damage_rate" SortExpression="creature_2_damage_rate" />
                <asp:BoundField DataField="creature_1_win_rate" HeaderText="creature_1_win_rate" SortExpression="creature_1_win_rate" />
                <asp:BoundField DataField="creature_2_win_rate" HeaderText="creature_2_win_rate" SortExpression="creature_2_win_rate" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="Fight_History_Source" runat="server" ConnectionString="<%$ ConnectionStrings:TableTop_DB %>" SelectCommand="SELECT History.*, A.creature_name As creature_1_name, B.creature_name As creature_2_name FROM History,Creatures As A,Creatures As B WHERE History.creature_1_id = A.creature_id AND History.creature_2_id = B.creature_id "></asp:SqlDataSource>
    <div>
    
    </div>
    </form>
</body>
</html>
