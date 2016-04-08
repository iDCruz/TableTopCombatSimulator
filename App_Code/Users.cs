using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

public class Users
{
    private int user_id;
    private string user_name;
    private string user_password;

    public Users(SqlDataReader rdr)
    {
        user_id = (int)rdr["User_id"];
        user_name = (string)rdr["User_name"];
        user_password = (string)rdr["User_password"];
    }

    public int User_id
    {
        get
        {
            return user_id;
        }

        set
        {
            user_id = value;
        }
    }

    public string User_name
    {
        get
        {
            return user_name;
        }

        set
        {
            user_name = value;
        }
    }

    public string User_password
    {
        get
        {
            return user_password;
        }

        set
        {
            user_password = value;
        }
    }
}