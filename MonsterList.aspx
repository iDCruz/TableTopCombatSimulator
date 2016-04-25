<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MonsterList.aspx.cs" Inherits="MonsterList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Monster List</title>
    <link href="StyleSheet.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="center">
        <asp:Button ID="menub1" runat="server" Text="Data" CssClass="menub" OnClick="menub1_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="menub2" runat="server" Text="Fight Simulator" CssClass="menub" OnClick="menub2_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="menub3" runat="server" Text="Fight History" CssClass="menub" OnClick="menub3_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="menub4" runat="server" Text="Log Out" CssClass="menub" OnClick="menub4_Click" />
        </div>
    <h1 class="center">Add and View Data</h1>
    <br />
    <h2>Add Weapon or Attack</h2>
    <div>
        <asp:FormView ID="Attack_Insert" runat="server" DefaultMode="Insert" BorderStyle="None" OnItemCreated="Attack_Insert_ItemCreated" DataSourceID="Attack_Insert_Source">
            <InsertItemTemplate>
                <asp:DropDownList ID="creature_DropDownList" runat="server" AppendDataBoundItems="false" DataSourceID="Monster_Name_Source" DataTextField="creature_name" DataValueField="creature_id" OnSelectedIndexChanged="creature_DropDownList_SelectedIndexChanged" AutoPostBack="true"/>
                <br />
                <asp:TextBox ID="attack_nameTextBox" runat="server" Text='<%# Bind("attack_name") %>' placeholder="Attack name"/>
                <asp:RequiredFieldValidator ValidationGroup="AttackInsert" runat="server" ControlToValidate="attack_nameTextBox" Display="Dynamic" ForeColor="Red" ErrorMessage="Attack name is required"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox TextMode="Number" ID="attack_modifierTextBox" runat="server" Text='<%# Bind("attack_modifier") %>' placeholder="Attack modifier"/>
                <asp:RequiredFieldValidator ValidationGroup="AttackInsert" runat="server" ControlToValidate="attack_modifierTextBox" Display="Dynamic" ForeColor="Red" ErrorMessage="Attack modifier is required"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="attack_damageTextBox" runat="server" Text='<%# Bind("attack_damage") %>' placeholder="Damage (XdX+X)"/>
                <asp:RequiredFieldValidator ValidationGroup="AttackInsert" runat="server" ControlToValidate="attack_damageTextBox" Display="Dynamic" ForeColor="Red" ErrorMessage="Required; "></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ValidationGroup="AttackInsert" runat="server" ControlToValidate="attack_damageTextBox" Display="Dynamic" ForeColor="Red" ErrorMessage="Must be in the format XdX +/- X where all Xs are integers" ValidationExpression="^\dd\d[+-]{1}\d$"></asp:RegularExpressionValidator>
                <br />
                <asp:TextBox TextMode="Number" ID="critical_thresholdTextBox" runat="server" Text='<%# Bind("critical_threshold") %>' placeholder="Critical threshold"/>
                <asp:RequiredFieldValidator ValidationGroup="AttackInsert" runat="server" ControlToValidate="critical_thresholdTextBox" Display="Dynamic" ForeColor="Red" ErrorMessage="Critical threshold is required"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox TextMode="Number" ID="critical_multiplierTextBox" runat="server" Text='<%# Bind("critical_multiplier") %>' placeholder="Critical multiplier"/>
                <asp:RequiredFieldValidator ValidationGroup="AttackInsert" runat="server" ControlToValidate="critical_multiplierTextBox" Display="Dynamic" ForeColor="Red" ErrorMessage="Critical multiplier is required"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="user_idTextBox" runat="server" Text='<%# Bind("user_id") %>' Visible="false" />
                <asp:TextBox ID="creature_idTextBox" runat="server" Text='<%# Bind("creature_id") %>' Visible="false" />
                <asp:LinkButton ID="InsertButton" ValidationGroup="AttackInsert" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
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
        <h2>Add Creature</h2>
        <asp:FormView ID="Monster_Insert" runat="server" DataKeyNames="creature_id" DefaultMode="Insert" OnItemCreated="Monster_Insert_ItemCreated" BorderStyle="None" DataSourceID="Insert_Creature" OnItemInserting="Monster_Insert_ItemInserting" >
            <InsertItemTemplate>
                <asp:TextBox ID="user_idTextBox" runat="server" Text='<%# Bind("user_id") %>' Visible="false"/>
                <br />
                <asp:TextBox ID="creature_nameTextBox" runat="server" Text='<%# Bind("creature_name") %>' placeholder="Creature name"/>
                <asp:RequiredFieldValidator ValidationGroup="MonsterInsert" runat="server"  ControlToValidate="creature_nameTextBox" Display="Dynamic" ForeColor="Red" ErrorMessage="Creature name is required"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox TextMode="Number" ID="initiativeTextBox" runat="server" Text='<%# Bind("initiative") %>' placeholder="Initiative modifier"/>
                <asp:RequiredFieldValidator ValidationGroup="MonsterInsert" runat="server" ControlToValidate="initiativeTextBox" Display="Dynamic" ForeColor="Red" ErrorMessage="Initiative is required"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox TextMode="Number" ID="hit_pointsTextBox" runat="server" Text='<%# Bind("hit_points") %>' placeholder="Hit points"/>
                <asp:RequiredFieldValidator ValidationGroup="MonsterInsert" runat="server" ControlToValidate="hit_pointsTextBox" Display="Dynamic" ForeColor="Red" ErrorMessage="Hit points is required"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox TextMode="Number" ID="armor_classTextBox" runat="server" Text='<%# Bind("armor_class") %>' placeholder="Armor class"/>
                <asp:RequiredFieldValidator ValidationGroup="MonsterInsert" runat="server" ControlToValidate="armor_classTextBox" Display="Dynamic" ForeColor="Red" ErrorMessage="Armor class is required"></asp:RequiredFieldValidator>
                <br />
                <asp:LinkButton ValidationGroup="MonsterInsert" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
        </asp:FormView>
        <asp:Label runat="server" ID="MonsterErrorLabel" Font-Bold="true" ForeColor="Red" Visible="false"></asp:Label>
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
        <h2>Monster List</h2>
        <asp:GridView ID="Creature_GridView" OnRowDeleting="Creature_Gridview_OnRowDeleting" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="creature_id" DataSourceID="Creatures_Table" 
            CssClass="grid" PagerStyle-CssClass="pgr">
            <RowStyle CssClass="row" />
            <AlternatingRowStyle CssClass="altrow" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="creature_id" HeaderText="Creature ID" InsertVisible="False" ReadOnly="True" SortExpression="creature_id" />
                <asp:BoundField DataField="user_id" HeaderText="User ID" SortExpression="user_id" Visible="False" />
                <asp:BoundField DataField="creature_name" HeaderText="Creature" SortExpression="creature_name" />
                <asp:BoundField DataField="hit_points" HeaderText="HP" SortExpression="hit_points" />
                <asp:BoundField DataField="initiative" HeaderText="Initiative" SortExpression="initiative" />
                <asp:BoundField DataField="armor_class" HeaderText="Armor Class" SortExpression="armor_class" />
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#F3E2D0" HorizontalAlign="Center" VerticalAlign="Middle"/>
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
        <h2>Weapon/Attack List</h2>
        <asp:GridView ID="Attack_GridView" runat="server" AllowPaging="True" AllowSorting="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="Attacks_Table" style="margin-right: 0px" AutoGenerateColumns="False" DataKeyNames="attack_id" 
            CssClass="grid" PagerStyle-CssClass="pgr">
            <RowStyle CssClass="row" />
            <AlternatingRowStyle CssClass="altrow" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="attack_id" HeaderText="Attack ID" InsertVisible="False" ReadOnly="True" SortExpression="attack_id" Visible="False" />
                <asp:BoundField DataField="creature_id" HeaderText="Creature ID" SortExpression="creature_id" />
                <asp:BoundField DataField="attack_name" HeaderText="Attack" SortExpression="attack_name" />
                <asp:BoundField DataField="attack_damage" HeaderText="Damage" SortExpression="attack_damage" />
                <asp:BoundField DataField="critical_threshold" HeaderText="Critical Threshold" SortExpression="critical_threshold" />
                <asp:BoundField DataField="critical_multiplier" HeaderText="Critical Multiplier" SortExpression="critical_multiplier" />
                <asp:BoundField DataField="attack_modifier" HeaderText="Attack Modifier" SortExpression="attack_modifier" />
                <asp:BoundField DataField="user_id" HeaderText="User ID" SortExpression="user_id" ReadOnly="True" Visible="False" />
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#F3E2D0" HorizontalAlign="Center" VerticalAlign="Middle"/>
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
    </div>
    </form>
    <footer class="center">
        <br />
        <br />
        <br />
        Created by David Cruz, Gurdane Sethi, and Kevin Wagner.
    </footer>
</body>
</html>
