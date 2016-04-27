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
        .auto-style2 {
            text-align: center;
        }
    </style>
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
    <h1 class="center">Fight Simulator</h1>
    <div class="center">
        <br />
&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="Creature_Select" DataTextField="creature_name" DataValueField="creature_name" AppendDataBoundItems="True">
            <asp:ListItem>Select Creature</asp:ListItem>
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp; VS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="Creature_Select" DataTextField="creature_name" DataValueField="creature_name" AppendDataBoundItems="True">
            <asp:ListItem>Select Creature</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:RangeValidator ID="RangeValidator_tbNumFights" runat="server" ControlToValidate="tbNumFights" MinimumValue="0" MaximumValue="1000000" Type="Integer" Text="Number of fights must be an integer between 0 and 1 million!" ForeColor="Red" />
        <br />
         <asp:TextBox TextMode="Number" ID="tbNumFights" runat="server" placeholder="# of fights to simulate?"/>
        <br />
        <asp:Label ID="lAutoNumFights" runat="server" ForeColor="Red" Text="No value entered; number of fights set to 10,000." Visible="False"></asp:Label>
        <br />
        <asp:Button ID="Fight_btn" runat="server" Text="Fight" OnClick="Fight_Click" CssClass="menub" />
        <asp:SqlDataSource ID="Creature_Select" runat="server" ConnectionString="<%$ ConnectionStrings:TableTop_DB %>" SelectCommand="SELECT [creature_name] FROM [Creatures] WHERE ([user_id] = @User_id)">
        <SelectParameters>
            <asp:sessionparameter Name="User_id" SessionField="User_id" Type="Int32" />
        </SelectParameters>
        </asp:SqlDataSource>          
        <br />
        <br />
    <div style="background-color:#FFF6E6; display:inline-block; margin:0 auto; padding:8px; border:solid 2px black;" class="auto-style1">
        <h2 style="text-align: center">Fight Results</h2>
        <table class="fight">
            <tr>
                <td class="light"></td>
                <td class="auto-style2"><strong>Left Creature</strong></td>
                <td class="auto-style2"><strong>Right Creature</strong></string></td>
            </tr>
            <tr>
                <td class="dark"><strong>Win Rate:</strong></td>
                <td class="auto-style2"><asp:Label ID="Win_Rate_1" runat="server" Text=""></asp:Label></td>
                <td class="auto-style2"><asp:Label ID="Win_Rate_2" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td class="dark"><strong>Average Accuracy Per Full Attack</strong></td>
                <td class="auto-style2"><asp:Label ID="Accuracy_1" runat="server" Text=""></asp:Label></td>
                <td class="auto-style2"><asp:Label ID="Accuracy_2" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td class="dark"><strong>Average Damage Per Full Attack</strong> </td>
                <td class="auto-style2"><asp:Label ID="Damage_1" runat="server" Text=""></asp:Label></td>
                <td class="auto-style2"><asp:Label ID="Damage_2" runat="server" Text=""></asp:Label></td>
            </tr>
        </table>
    </div>
    </div>
        <br />
    </form>
</body>
</html>
