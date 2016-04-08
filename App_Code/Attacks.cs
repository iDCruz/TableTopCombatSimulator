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
    private int critical_range;
    private Boolean finesse;
    private Boolean is_weapon;
    private int attack_modifier;

    public Attacks(SqlDataReader rdr)
    {
        Attack_id = (int)rdr["Attack_id"];
        Creature_id = (int)rdr["Creature_id"];
        Attack_name = (string)rdr["Attack_name"];
        Attack_damge = (string)rdr["Attack_damage"];
        Critical_range = (int)rdr["Critical_range"];
        Finesse = (Boolean)rdr["finesse"];
        Is_weapon = (Boolean)rdr["is_weapon"];
        Attack_modifier = (int)rdr["attack_modifier"];
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

    public int Critical_range
    {
        get
        {
            return critical_range;
        }

        set
        {
            critical_range = value;
        }
    }

    public bool Finesse
    {
        get
        {
            return finesse;
        }

        set
        {
            finesse = value;
        }
    }

    public bool Is_weapon
    {
        get
        {
            return is_weapon;
        }

        set
        {
            is_weapon = value;
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


}