using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void btn_register_Click(object sender, EventArgs e)
    {
        string error_msg;
        int? ID = Users_Query.Register_User(out error_msg, tb_user.Text, tb_pass.Text);

        if (error_msg.Equals("Invalid Credentials"))
        {
            error_lbl.Text = "Either Password or User Name is already in use";
        }
        else
        {
            error_lbl.Text = "Registration successful";
        }

    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        string error_msg;
        int? ID = Users_Query.Get_User_ID(out error_msg, tb_user.Text, tb_pass.Text);

        if (ID != null)
        {
            Session["User_id"] = ID;
            Server.Transfer("MonsterList.aspx", true);
        }
        else
        {
            error_lbl.Text = error_msg;
        }

    }
}