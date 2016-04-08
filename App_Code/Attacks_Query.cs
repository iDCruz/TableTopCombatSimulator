using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;


public class Attacks_Query
{

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


    public static SqlConnection Setup_Connection()
    {
        String connection_string = WebConfigurationManager.ConnectionStrings["TableTop_DB"].ConnectionString;
        SqlConnection cn = new SqlConnection(connection_string);
        cn.Open();
        return cn;
    }
}