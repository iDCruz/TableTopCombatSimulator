using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

public class Creatures
{
    private int creature_id;
    private int user_id;
    private string creature_name;
    private int hit_points;
    private int initiative;
    private int armor_class;

    public Creatures(SqlDataReader rdr)
    {
        creature_id = (int)rdr["creature_id"];
        user_id = (int)rdr["user_id"];
        creature_name = (string)rdr["creature_name"];
        hit_points = (int)rdr["hit_points"];
        initiative = (int)rdr["initiative"];
        armor_class = (int)rdr["armor_class"];
    }

    public int Creature_id
    {
        get
        {
            return creature_id;
        }

        set
        {
            creature_id = value;
        }
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

    public string Creature_name
    {
        get
        {
            return creature_name;
        }

        set
        {
            creature_name = value;
        }
    }

    public int Hit_points
    {
        get
        {
            return hit_points;
        }

        set
        {
            hit_points = value;
        }
    }

    public int Initiative
    {
        get
        {
            return initiative;
        }

        set
        {
            initiative = value;
        }
    }

    public int Armor_class
    {
        get
        {
            return armor_class;
        }

        set
        {
            armor_class = value;
        }
    }
}