<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MonsterList.aspx.cs" Inherits="MonsterList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h2> Monster List Page </h2>
    <p> &nbsp;</p>
    <form id="form1" runat="server">
    <div>
        <asp:FormView ID="Attack_Insert" runat="server" DefaultMode="Insert" BorderStyle="Solid" OnItemCreated="Attack_Insert_ItemCreated" DataSourceID="Attack_Insert_Source">
            <InsertItemTemplate>
                creature_id:
                <asp:TextBox ID="creature_idTextBox" runat="server" Text='<%# Bind("creature_id") %>' />
                <br />
                attack_name:
                <asp:TextBox ID="attack_nameTextBox" runat="server" Text='<%# Bind("attack_name") %>' />
                <br />
                attack_damage:
                <asp:TextBox ID="attack_damageTextBox" runat="server" Text='<%# Bind("attack_damage") %>' />
                <br />
                critical_range:
                <asp:TextBox ID="critical_rangeTextBox" runat="server" Text='<%# Bind("critical_range") %>' />
                <br />
                finesse:
                <asp:CheckBox ID="finesseCheckBox" runat="server" Checked='<%# Bind("finesse") %>' />
                <br />
                is_weapon:
                <asp:CheckBox ID="is_weaponCheckBox" runat="server" Checked='<%# Bind("is_weapon") %>' />
                <br />
                attack_modifier:
                <asp:TextBox ID="attack_modifierTextBox" runat="server" Text='<%# Bind("attack_modifier") %>' />
                <br />
                <asp:TextBox ID="user_idTextBox" runat="server" Text='<%# Bind("user_id") %>' Visible="false" />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="Attack_Insert_Source" runat="server" ConnectionString="<%$ ConnectionStrings:TableTop_DB %>" InsertCommand="Insert_Attack" InsertCommandType="StoredProcedure" SelectCommand="Select_Attack" SelectCommandType="StoredProcedure">
            <InsertParameters>
                <asp:Parameter Name="creature_id" Type="Int32" />
                <asp:Parameter Name="attack_name" Type="String" />
                <asp:Parameter Name="attack_damage" Type="String" />
                <asp:Parameter Name="critical_range" Type="Int32" />
                <asp:Parameter Name="finesse" Type="Boolean" />
                <asp:Parameter Name="is_weapon" Type="Boolean" />
                <asp:Parameter Name="attack_modifier" Type="Int32" />
                <asp:Parameter Name="user_id" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <br />
        <asp:FormView ID="Monster_Insert" runat="server" DataKeyNames="creature_id" DefaultMode="Insert" OnItemCreated="Monster_Insert_ItemCreated" BorderStyle="Solid" DataSourceID="Insert_Creature">
            <InsertItemTemplate>
                <asp:TextBox ID="user_idTextBox" runat="server" Text='<%# Bind("user_id") %>' Visible="false"/>
                <br />
                creature_name:
                <asp:TextBox ID="creature_nameTextBox" runat="server" Text='<%# Bind("creature_name") %>' />
                <br />
                hit_points:
                <asp:TextBox ID="hit_pointsTextBox" runat="server" Text='<%# Bind("hit_points") %>' />
                <br />
                initiative:
                <asp:TextBox ID="initiativeTextBox" runat="server" Text='<%# Bind("initiative") %>' />
                <br />
                armor_class:
                <asp:TextBox ID="armor_classTextBox" runat="server" Text='<%# Bind("armor_class") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="Insert_Creature" runat="server" ConnectionString="<%$ ConnectionStrings:TableTop_DB %>" InsertCommand="INSERT INTO Creatures(user_id, creature_name, hit_points, initiative, armor_class) VALUES (@user_id, @creature_name, @hit_points, @initiative, @armor_class)" SelectCommand="SELECT Creatures.* FROM Creatures">
            <InsertParameters>
                <asp:Parameter Name="user_id" />
                <asp:Parameter Name="creature_name" />
                <asp:Parameter Name="hit_points" />
                <asp:Parameter Name="initiative" />
                <asp:Parameter Name="armor_class" />
            </InsertParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <asp:GridView ID="Creature_GridView" OnRowDeleting="Creature_Gridview_OnRowDeleting" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="creature_id" DataSourceID="Creatures_Table">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="creature_id" HeaderText="creature_id" InsertVisible="False" ReadOnly="True" SortExpression="creature_id" />
                <asp:BoundField DataField="user_id" HeaderText="user_id" SortExpression="user_id" Visible="False" />
                <asp:BoundField DataField="creature_name" HeaderText="creature_name" SortExpression="creature_name" />
                <asp:BoundField DataField="hit_points" HeaderText="hit_points" SortExpression="hit_points" />
                <asp:BoundField DataField="initiative" HeaderText="initiative" SortExpression="initiative" />
                <asp:BoundField DataField="armor_class" HeaderText="armor_class" SortExpression="armor_class" />
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="Creatures_Table" runat="server" FilterExpression="user_id = {0}" ConnectionString="<%$ ConnectionStrings:TableTop_DB %>" DeleteCommand="DELETE FROM [Creatures] WHERE [creature_id] = @creature_id" InsertCommand="INSERT INTO [Creatures] ([user_id], [creature_name], [hit_points], [initiative], [armor_class]) VALUES (@user_id, @creature_name, @hit_points, @initiative, @armor_class)" SelectCommand="SELECT * FROM [Creatures]" UpdateCommand="UPDATE [Creatures] SET [user_id] = @user_id, [creature_name] = @creature_name, [hit_points] = @hit_points, [initiative] = @initiative, [armor_class] = @armor_class WHERE [creature_id] = @creature_id">
            <DeleteParameters>
                <asp:Parameter Name="creature_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="user_id" Type="Int32" />
                <asp:Parameter Name="creature_name" Type="String" />
                <asp:Parameter Name="hit_points" Type="Int32" />
                <asp:Parameter Name="initiative" Type="Int32" />
                <asp:Parameter Name="armor_class" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="user_id" Type="Int32" />
                <asp:Parameter Name="creature_name" Type="String" />
                <asp:Parameter Name="hit_points" Type="Int32" />
                <asp:Parameter Name="initiative" Type="Int32" />
                <asp:Parameter Name="armor_class" Type="Int32" />
                <asp:Parameter Name="creature_id" Type="Int32" />
            </UpdateParameters>
            <FilterParameters>
                <asp:SessionParameter
                    Name="User_id"
                    SessionField="User_id"
                     />
            </FilterParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="Attack_GridView" runat="server" AllowPaging="True" AllowSorting="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="Attacks_Table" style="margin-right: 0px" AutoGenerateColumns="False" DataKeyNames="attack_id">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="attack_id" HeaderText="attack_id" InsertVisible="False" ReadOnly="True" SortExpression="attack_id" />
                <asp:BoundField DataField="creature_id" HeaderText="creature_id" SortExpression="creature_id" />
                <asp:BoundField DataField="attack_name" HeaderText="attack_name" SortExpression="attack_name" />
                <asp:BoundField DataField="attack_damage" HeaderText="attack_damage" SortExpression="attack_damage" />
                <asp:BoundField DataField="critical_range" HeaderText="critical_range" SortExpression="critical_range" />
                <asp:CheckBoxField DataField="finesse" HeaderText="finesse" SortExpression="finesse" />
                <asp:CheckBoxField DataField="is_weapon" HeaderText="is_weapon" SortExpression="is_weapon" />
                <asp:BoundField DataField="attack_modifier" HeaderText="attack_modifier" SortExpression="attack_modifier" />
                <asp:BoundField DataField="user_id" HeaderText="user_id" SortExpression="user_id" ReadOnly="True" Visible="False" />
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
        <asp:SqlDataSource ID="Attacks_Table" runat="server" FilterExpression="user_id = {0}"  ConnectionString="<%$ ConnectionStrings:TableTop_DB %>" DeleteCommand="DELETE FROM [Attacks] WHERE [attack_id] = @attack_id" InsertCommand="INSERT INTO [Attacks] ([creature_id], [attack_name], [attack_damage], [critical_range], [finesse], [is_weapon], [attack_modifier], [user_id]) VALUES (@creature_id, @attack_name, @attack_damage, @critical_range, @finesse, @is_weapon, @attack_modifier, @user_id)" SelectCommand="SELECT * FROM [Attacks]" UpdateCommand="UPDATE [Attacks] SET [creature_id] = @creature_id, [attack_name] = @attack_name, [attack_damage] = @attack_damage, [critical_range] = @critical_range, [finesse] = @finesse, [is_weapon] = @is_weapon, [attack_modifier] = @attack_modifier, [user_id] = @user_id WHERE [attack_id] = @attack_id">
            <DeleteParameters>
                <asp:Parameter Name="attack_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="creature_id" Type="Int32" />
                <asp:Parameter Name="attack_name" Type="String" />
                <asp:Parameter Name="attack_damage" Type="String" />
                <asp:Parameter Name="critical_range" Type="Int32" />
                <asp:Parameter Name="finesse" Type="Boolean" />
                <asp:Parameter Name="is_weapon" Type="Boolean" />
                <asp:Parameter Name="attack_modifier" Type="Int32" />
                <asp:Parameter Name="user_id" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="creature_id" Type="Int32" />
                <asp:Parameter Name="attack_name" Type="String" />
                <asp:Parameter Name="attack_damage" Type="String" />
                <asp:Parameter Name="critical_range" Type="Int32" />
                <asp:Parameter Name="finesse" Type="Boolean" />
                <asp:Parameter Name="is_weapon" Type="Boolean" />
                <asp:Parameter Name="attack_modifier" Type="Int32" />
                <asp:Parameter Name="user_id" Type="Int32" />
                <asp:Parameter Name="attack_id" Type="Int32" />
            </UpdateParameters>
            <FilterParameters>
                <asp:SessionParameter
                    Name="User_id"
                    SessionField="User_id"
                     />
            </FilterParameters>
        </asp:SqlDataSource>
        <br />
        <br />
    
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
