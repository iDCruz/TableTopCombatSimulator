using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;


public class Attacks_Query
{
    public static List<Attacks> Get_Attacks_Of_Creature(out string error_msg, int creature_id, int user_id)
    {
        SqlDataReader rdr = null;
        SqlConnection cn = null;
        Attacks attack = null;
        List<Attacks> attacks = null;
        error_msg = "";

        try
        {
            cn = Setup_Connection();
            rdr = Attacks_Of_Creature(cn, creature_id, user_id);

            attacks = new List<Attacks>();
            while (rdr.Read())
            {
                attack = new Attacks(rdr);
                attacks.Add(attack);
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

        return attacks;
    }

    public static void Delete_Attacks_Of_Creature(int creature_id)
    {
        SqlConnection cn = null;
        cn = Setup_Connection();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "Delete_Attacks_Of_Creature";
        cmd.Parameters.AddWithValue("@creature_id", creature_id);
        cmd.Connection = cn;
        cmd.ExecuteReader();
        cn.Close();
    }

    public static SqlDataReader Attacks_Of_Creature(SqlConnection cn, int creature_id, int user_id)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "Get_Attacks_By_Creatureid_and_Userid";
        cmd.Parameters.AddWithValue("@creature_id", creature_id);
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