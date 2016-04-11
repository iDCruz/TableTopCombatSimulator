using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MonsterList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User_id"] == null)
        {
            Server.Transfer("Default.aspx", true);
        }

        if(!IsPostBack)
        {
            Creature_GridView.DataBind();
            Attack_GridView.DataBind();
            Monster_Name_Source.DataBind();

            var dropDownList = Attack_Insert.FindControl("creature_DropDownList") as DropDownList;
            dropDownList.DataBind();
        }


    }


    protected void Monster_Insert_ItemCreated(object sender, EventArgs e)
    {
        if(Monster_Insert.CurrentMode == FormViewMode.Insert)
        {
            TextBox UserID = Monster_Insert.FindControl("user_idTextBox") as TextBox;
            UserID.Text = Session["User_id"].ToString();

            Creature_GridView.DataBind();
            Attack_GridView.DataBind();
            Monster_Name_Source.DataBind();

            var dropDownList = Attack_Insert.FindControl("creature_DropDownList") as DropDownList;
            dropDownList.DataBind();
        }
    }


    protected void Attack_Insert_ItemCreated(object sender, EventArgs e)
    {
        if (Attack_Insert.CurrentMode == FormViewMode.Insert)
        {
            

            TextBox UserID = Attack_Insert.FindControl("user_idTextBox") as TextBox;
            UserID.Text = Session["User_id"].ToString();

            Creature_GridView.DataBind();
            Attack_GridView.DataBind();
            Monster_Name_Source.DataBind();

            var dropDownList = Attack_Insert.FindControl("creature_DropDownList") as DropDownList;
            dropDownList.DataBind();
        }
    }

    protected void Creature_Gridview_OnRowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
    {
        //GET DELETEING COLUMN
        int creature_id = Convert.ToInt32(this.Creature_GridView.DataKeys[e.RowIndex].Values["creature_id"].ToString());
        Attacks_Query.Delete_Attacks_Of_Creature(creature_id);

        Creature_GridView.DataBind();
        Attack_GridView.DataBind();
        Monster_Name_Source.DataBind();

        var dropDownList = Attack_Insert.FindControl("creature_DropDownList") as DropDownList;
        dropDownList.DataBind();
    }


    protected void creature_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        var dropDownList = Attack_Insert.FindControl("creature_DropDownList") as DropDownList;
        string creature_id = dropDownList.SelectedValue;

        TextBox CreatureID = Attack_Insert.FindControl("creature_idTextBox") as TextBox;
        CreatureID.Text = creature_id;
    }
}