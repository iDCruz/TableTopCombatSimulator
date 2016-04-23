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

    public static void Create_Default_Creatures(int? user_id)
    {
        if (user_id == null)
        {
            return;
        }

        Create_Default_Creatures((int)user_id, "Akata", 15, 6, 13);
        Create_Default_Creatures((int)user_id, "Carbuncle", 13, -2, 12);
        Create_Default_Creatures((int)user_id, "Elk", 15, 3, 13);
        Create_Default_Creatures((int)user_id, "Chupacabra", 30, 7, 16);
        Create_Default_Creatures((int)user_id, "Havero", 493, 5, 43);

    }

    private static void Create_Default_Creatures(int user_id, string creature_name, int hit_points, int initiative, int armor_class)
    {
        using (SqlConnection cn = new SqlConnection(WebConfigurationManager.ConnectionStrings["TableTop_DB"].ConnectionString))
        {
            try {
                SqlCommand cmd = new SqlCommand("INSERT INTO Creatures(user_id, creature_name, hit_points, initiative, armor_class) VALUES(@user_id, @creature_name, @hit_points, @initiative, @armor_class)", cn);
                cmd.Parameters.AddWithValue("@user_id", user_id);
                cmd.Parameters.AddWithValue("@creature_name", creature_name);
                cmd.Parameters.AddWithValue("@hit_points", hit_points);
                cmd.Parameters.AddWithValue("@initiative", initiative);
                cmd.Parameters.AddWithValue("@armor_class", armor_class);
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                e.ToString();
            }
        }
    }

    public static SqlConnection Setup_Connection()
    {
        String connection_string = WebConfigurationManager.ConnectionStrings["TableTop_DB"].ConnectionString;
        SqlConnection cn = new SqlConnection(connection_string);
        cn.Open();
        return cn;
    }
}