using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

public class History
{
    private int fight_id;
    private int user_id;
    private int creature_1_id;
    private int creature_2_id;
    private decimal creature_1_hit_rate;
    private decimal creature_2_hit_rate;
    private decimal creature_1_damage_rate;
    private decimal creature_2_damage_rate;
    private decimal creature_1_win_rate;
    private decimal creature_2_win_rate;

    public History(SqlDataReader rdr)
    {
        fight_id = (int)rdr["Fight_id"];
        user_id = (int)rdr["User_id"];
        creature_1_id = (int)rdr["Creature_1_id"];
        creature_2_id = (int)rdr["Creature_2_id"];
        creature_1_hit_rate = (decimal)rdr["Creature_1_hit_rate"];
        creature_2_hit_rate = (decimal)rdr["Creature_2_hit_rate"];
        creature_1_damage_rate = (decimal)rdr["Creature_1_damage_rate"];
        creature_2_damage_rate = (decimal)rdr["Creature_2_damage_rate"];
        creature_1_win_rate = (decimal)rdr["Creature_1_win_rate"];
        creature_2_win_rate = (decimal)rdr["Creature_2_win_rate"];
    }

    public int Fight_id
    {
        get
        {
            return fight_id;
        }

        set
        {
            fight_id = value;
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

    public int Creature_1_id
    {
        get
        {
            return creature_1_id;
        }

        set
        {
            creature_1_id = value;
        }
    }

    public int Creature_2_id
    {
        get
        {
            return creature_2_id;
        }

        set
        {
            creature_2_id = value;
        }
    }

    public decimal Creature_1_hit_rate
    {
        get
        {
            return creature_1_hit_rate;
        }

        set
        {
            creature_1_hit_rate = value;
        }
    }

    public decimal Creature_2_hit_rate
    {
        get
        {
            return creature_2_hit_rate;
        }

        set
        {
            creature_2_hit_rate = value;
        }
    }

    public decimal Creature_1_damage_rate
    {
        get
        {
            return creature_1_damage_rate;
        }

        set
        {
            creature_1_damage_rate = value;
        }
    }

    public decimal Creature_2_damge_rate
    {
        get
        {
            return creature_2_damage_rate;
        }

        set
        {
            creature_2_damage_rate = value;
        }
    }

    public decimal Creature_1_win_rate
    {
        get
        {
            return creature_1_win_rate;
        }

        set
        {
            creature_1_win_rate = value;
        }
    }

    public decimal Creature_2_win_rate
    {
        get
        {
            return creature_2_win_rate;
        }

        set
        {
            creature_2_win_rate = value;
        }
    }
}