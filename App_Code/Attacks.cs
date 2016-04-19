using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;


public class Attacks
{
    private int attack_id;
    private int creature_id;
    private string attack_name;
    private string attack_damge;
    private int critical_threshold;
    private int critical_multiplier;
    private int attack_modifier;
    private int user_id;

    public Attacks(SqlDataReader rdr)
    {
        Attack_id = (int)rdr["attack_id"];
        Creature_id = (int)rdr["creature_id"];
        Attack_name = (string)rdr["attack_name"];
        Attack_damge = (string)rdr["attack_damage"];
        Critical_threshold = (int)rdr["critical_threshold"];
        Critical_multiplier = (int)rdr["critical_multiplier"];
        Attack_modifier = (int)rdr["attack_modifier"];
        User_id = (int)rdr["user_id"];
    }

    public int Attack_id
    {
        get
        {
            return attack_id;
        }

        set
        {
            attack_id = value;
        }
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

    public string Attack_name
    {
        get
        {
            return attack_name;
        }

        set
        {
            attack_name = value;
        }
    }

    public string Attack_damge
    {
        get
        {
            return attack_damge;
        }

        set
        {
            attack_damge = value;
        }
    }

    public int Critical_threshold
    {
        get
        {
            return critical_threshold;
        }

        set
        {
            critical_threshold = value;
        }
    }

    public int Critical_multiplier
    {
        get
        {
            return critical_multiplier;
        }

        set
        {
            critical_multiplier = value;
        }
    }

    public int Attack_modifier
    {
        get
        {
            return attack_modifier;
        }

        set
        {
            attack_modifier = value;
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


}