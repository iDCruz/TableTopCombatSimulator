<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Fight.aspx.cs" Inherits="Fight" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fight Simulator</title>
    <link href="StyleSheet.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            text-align: left;
        }
    </style>
</head>
<body>
    <div class="center">
        <asp:Button ID="menub1" runat="server" Text="Data" CssClass="menub" OnClick="menub1_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="menub2" runat="server" Text="Fight Simluator" CssClass="menub" OnClick="menub2_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="menub3" runat="server" Text="Fight History" CssClass="menub" OnClick="menub3_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="menub4" runat="server" Text="Log Out" CssClass="menub" OnClick="menub4_Click" />
        </div>
    <h1 class="center">Fight Simulator</h1>
    <form id="form1" runat="server">
    <div class="center">
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
    <div style="background-color:#FFF6E6; display:inline-block; margin:0 auto; padding:8px; border:solid 2px black;" class="auto-style1">
        <h2 style="text-align: center">Fight Results</h2>
        <div class="auto-style1">
        <strong>Creature 1 Win Rate:</strong>
        <asp:Label ID="Win_Rate_1" runat="server" Text=""></asp:Label>
        <br />
        <br />
        <strong>Creature 1 Average Accuracy Per Full Attack:</strong>
        <asp:Label ID="Accuracy_1" runat="server" Text=""></asp:Label>
        <br />
        <br />
        <strong>Creature 1 Average Damage Per Full Attack:</strong> 
        <asp:Label ID="Damage_1" runat="server" Text=""></asp:Label>
        <br />
        <br />
        <strong>Creature 2 Win Rate:</strong>
        <asp:Label ID="Win_Rate_2" runat="server" Text=""></asp:Label>
        <br />
        <br />
        <strong>Creature 2 Average Accuracy Per Full Attack:</strong>
        <asp:Label ID="Accuracy_2" runat="server" Text=""></asp:Label>
        <br />
        <br />
        <strong>Creature 2 Average Damage Per Full Attack:
        </strong>
        <asp:Label ID="Damage_2" runat="server" Text=""></asp:Label>
        <br />
        </div>
    </div>
    </div>
        <br />
    </form>
</body>
</html>
