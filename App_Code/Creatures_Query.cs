using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;


public class Creatures_Query
{
    public static Creatures Get_Creature(out string error_msg, string creature_name, int user_id)
    {
        SqlDataReader rdr = null;
        SqlConnection cn = null;
        Creatures creature = null;
        error_msg = "";

        try
        {
            cn = Setup_Connection();
            rdr = Get_Creature_By_Name_And_User(cn, creature_name, user_id);

            if (rdr.Read())
            {
                creature = new Creatures(rdr);
            }
            else
            {
                error_msg = "No Creature Found";
            }


        }
        catch (Exception ex)
        {
            error_msg = "ERROR: " + ex.Message;
        }

        finally
        {
            if (rdr != null)
            {
                rdr.Close();
            }
            if (cn != null)
            {
                cn.Close();
            }
        }

        return creature;
    }

    public static SqlDataReader Get_Creature_By_Name_And_User(SqlConnection cn, string creature_name, int user_id)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "Get_Creature_By_Id_and_Name";
        cmd.Parameters.AddWithValue("@creature_name", creature_name);
        cmd.Parameters.AddWithValue("@user_id", user_id);
        cmd.Connection = cn;
        return cmd.ExecuteReader();
    }

    public static SqlConnection Setup_Connection()
    {
        String connection_string = WebConfigurationManager.ConnectionStrings["TableTop_DB"].ConnectionString;
        SqlConnection cn = new SqlConnection(connection_string);
        cn.Open();
        return cn;
    }
}