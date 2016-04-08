using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;


public static class Users_Query
{
    public static int? Get_User_ID(out string error_msg, string user_name, string user_password)
    {
        SqlDataReader rdr = null;
        SqlConnection cn = null;
        Users Users = null;
        int? ID = null;
        error_msg = "";

        try
        {
            cn = Setup_Connection();
            rdr = Get_User_ID(cn, user_name, user_password); // Perform the query
                                                            // Process Query Result

            if (rdr.Read())
            {
                Users = new Users(rdr);
                ID = Users.User_id;
            }
            else
            {
                error_msg = "Invalid Credentials";
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

        return ID;
    }

    public static int? Register_User(out string error_msg, string user_name, string user_password)
    {
        SqlDataReader rdr = null;
        SqlConnection cn = null;
        int? ID = null;
        error_msg = "";

        try
        {
            cn = Setup_Connection();
            rdr = Check_For_Existing_Credentials(cn, user_name, user_password); // Perform the query
                                                                                // Process Query Result

            if (rdr.Read())
            {
                error_msg = "Invalid Credentials";
            }
            else
            {
                rdr.Close();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "Add_User";
                cmd.Parameters.AddWithValue("@user_name", user_name);
                cmd.Parameters.AddWithValue("@user_password", user_name);
                cmd.Connection = cn;
                cmd.ExecuteNonQuery();
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

        return ID;
    }

    public static SqlDataReader Get_User_ID(SqlConnection cn, string user_name, string user_password)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "Get_User_ID";
        cmd.Parameters.AddWithValue("@user_name", user_name);
        cmd.Parameters.AddWithValue("@user_password", user_password);
        cmd.Connection = cn;
        return cmd.ExecuteReader();
    }

    public static SqlDataReader Check_For_Existing_Credentials(SqlConnection cn, string user_name, string user_password)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "Check_User_Or_Pass_Exist";
        cmd.Parameters.AddWithValue("@user_name", user_name);
        cmd.Parameters.AddWithValue("@user_password", user_name);
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