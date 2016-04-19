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
                creature:
                <asp:DropDownList ID="creature_DropDownList" runat="server" AppendDataBoundItems="false" DataSourceID="Monster_Name_Source" DataTextField="creature_name" DataValueField="creature_id" OnSelectedIndexChanged="creature_DropDownList_SelectedIndexChanged" AutoPostBack="true"/>
                <br />
                attack_name:
                <asp:TextBox ID="attack_nameTextBox" runat="server" Text='<%# Bind("attack_name") %>' />
                <br />
                attack_modifier:
                <asp:TextBox ID="attack_modifierTextBox" runat="server" Text='<%# Bind("attack_modifier") %>' />
                <br />
                attack_damage:
                <asp:TextBox ID="attack_damageTextBox" runat="server" Text='<%# Bind("attack_damage") %>' />
                <br />
                critical_threshold:
                <asp:TextBox ID="critical_thresholdTextBox" runat="server" Text='<%# Bind("critical_threshold") %>' />
                <br />
                critical_multiplier:
                <asp:TextBox ID="critical_multiplierTextBox" runat="server" Text='<%# Bind("critical_multiplier") %>' />
                <br />
                <asp:TextBox ID="user_idTextBox" runat="server" Text='<%# Bind("user_id") %>' Visible="false" />
                <asp:TextBox ID="creature_idTextBox" runat="server" Text='<%# Bind("creature_id") %>' Visible="false" />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="Attack_Insert_Source" runat="server" ConnectionString="<%$ ConnectionStrings:TableTop_DB %>" InsertCommand="Insert_Attack" InsertCommandType="StoredProcedure" SelectCommand="Select_Attack" SelectCommandType="StoredProcedure">
            <InsertParameters>
                <asp:Parameter Name="creature_id" Type="Int32" />
                <asp:Parameter Name="attack_name" Type="String" />
                <asp:Parameter Name="attack_damage" Type="String" />
                <asp:Parameter Name="critical_threshold" Type="Int32" />
                <asp:Parameter Name="attack_modifier" Type="Int32" />
                <asp:Parameter Name="user_id" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="Monster_Name_Source" runat="server" ConnectionString="<%$ ConnectionStrings:TableTop_DB %>" SelectCommand="SELECT [creature_id], [creature_name] FROM [Creatures] WHERE ([user_id] = @User_id)">
            <SelectParameters>
                <asp:SessionParameter name="User_id" SessionField="User_id"/>
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:FormView ID="Monster_Insert" runat="server" DataKeyNames="creature_id" DefaultMode="Insert" OnItemCreated="Monster_Insert_ItemCreated" BorderStyle="Solid" DataSourceID="Insert_Creature">
            <InsertItemTemplate>
                <asp:TextBox ID="user_idTextBox" runat="server" Text='<%# Bind("user_id") %>' Visible="false"/>
                <br />
                creature_name:
                <asp:TextBox ID="creature_nameTextBox" runat="server" Text='<%# Bind("creature_name") %>' />
                <br />
                initiative:
                <asp:TextBox ID="initiativeTextBox" runat="server" Text='<%# Bind("initiative") %>' />
                <br />
                hit_points:
                <asp:TextBox ID="hit_pointsTextBox" runat="server" Text='<%# Bind("hit_points") %>' />
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
        <asp:SqlDataSource ID="Creatures_Table" runat="server" FilterExpression="user_id = {0}" ConnectionString="<%$ ConnectionStrings:TableTop_DB %>" DeleteCommand="DELETE FROM [Creatures] WHERE [creature_id] = @creature_id" SelectCommand="SELECT * FROM [Creatures]">
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
                <asp:BoundField DataField="attack_id" HeaderText="attack_id" InsertVisible="False" ReadOnly="True" SortExpression="attack_id" Visible="False" />
                <asp:BoundField DataField="creature_id" HeaderText="creature_id" SortExpression="creature_id" />
                <asp:BoundField DataField="attack_name" HeaderText="attack_name" SortExpression="attack_name" />
                <asp:BoundField DataField="attack_damage" HeaderText="attack_damage" SortExpression="attack_damage" />
                <asp:BoundField DataField="critical_threshold" HeaderText="critical_threshold" SortExpression="critical_threshold" />
                <asp:BoundField DataField="critical_multiplier" HeaderText="critical_multiplier" SortExpression="critical_multiplier" />
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
        <asp:SqlDataSource ID="Attacks_Table" runat="server" FilterExpression="user_id = {0}"  ConnectionString="<%$ ConnectionStrings:TableTop_DB %>" DeleteCommand="DELETE FROM [Attacks] WHERE [attack_id] = @attack_id" SelectCommand="SELECT * FROM [Attacks]">
            <DeleteParameters>
                <asp:Parameter Name="attack_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="creature_id" Type="Int32" />
                <asp:Parameter Name="attack_name" Type="String" />
                <asp:Parameter Name="attack_damage" Type="String" />
                <asp:Parameter Name="critical_threshold" Type="Int32" />
                <asp:Parameter Name="critical_multiplier" Type="Int32" />
                <asp:Parameter Name="attack_modifier" Type="Int32" />
                <asp:Parameter Name="user_id" Type="Int32" />
            </InsertParameters>
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
