using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FightHistory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void menub1_Click(object sender, EventArgs e)
    {
        Server.Transfer("MonsterList.aspx", true);
    }

    protected void menub2_Click(object sender, EventArgs e)
    {
        Server.Transfer("Fight.aspx", true);
    }

    protected void menub3_Click(object sender, EventArgs e)
    {
        Server.Transfer("FightHistory.aspx", true);
    }

    protected void menub4_Click(object sender, EventArgs e)
    {
        Session["User_id"] = null;
        Server.Transfer("Default.aspx", true);
    }
}