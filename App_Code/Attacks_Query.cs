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

    public static void Create_Default_Attacks(int user_id, string creature_name)
    {
        string e;
        Creatures creature = Creatures_Query.Get_Creature(out e, creature_name, user_id);

        switch (creature.Creature_name)
        {
            case "Akata":
                Create_Default_Attack(user_id, creature.Creature_id, "bite", "1d6+1", 20, 2, 2);
                Create_Default_Attack(user_id, creature.Creature_id, "2 tentacles", "1d3+0", 20, 2, -3);
                break;
            case "Carbuncle":
                Create_Default_Attack(user_id, creature.Creature_id, "bite", "1d3-3", 20, 2, 1);
                break;
            case "Elk":
                Create_Default_Attack(user_id, creature.Creature_id, "gore", "1d6+2", 20, 2, 3);
                Create_Default_Attack(user_id, creature.Creature_id, "2 hooves", "1d3+1", 20, 2, -2);
                break;
            case "Chupacabra":
                Create_Default_Attack(user_id, creature.Creature_id, "bite", "1d4+1", 20, 2, 6);
                Create_Default_Attack(user_id, creature.Creature_id, "2 claws", "1d3+1", 20, 2, 6);
                break;
            case "Havero":
                Create_Default_Attack(user_id, creature.Creature_id, "tentacle", "2d6+14", 20, 2, 31);
                Create_Default_Attack(user_id, creature.Creature_id, "claw", "2d6+14", 18, 2, 31);
                Create_Default_Attack(user_id, creature.Creature_id, "sting", "2d6+14", 20, 2, 31);
                Create_Default_Attack(user_id, creature.Creature_id, "pincer", "4d6+14", 19, 2, 31);
                break;
        }

    }

    private static void Create_Default_Attack(int user_id, int creature_id, string attack_name, string attack_damage, int critical_threshold, int critical_multiplier, int attack_modifier)
    {
        using (SqlConnection cn = new SqlConnection(WebConfigurationManager.ConnectionStrings["TableTop_DB"].ConnectionString))
        {
            try {
                SqlCommand cmd = new SqlCommand("INSERT INTO Attacks(creature_id, attack_name, attack_damage, critical_threshold, critical_multiplier, attack_modifier, user_id) VALUES (@creature_id, @attack_name, @attack_damage, @critical_threshold, @critical_multiplier, @attack_modifier, @user_id)", cn);
                cmd.Parameters.AddWithValue("@creature_id", creature_id);
                cmd.Parameters.AddWithValue("@attack_name", attack_name);
                cmd.Parameters.AddWithValue("@attack_damage", attack_damage);
                cmd.Parameters.AddWithValue("@critical_threshold", critical_threshold);
                cmd.Parameters.AddWithValue("@critical_multiplier", critical_multiplier);
                cmd.Parameters.AddWithValue("@attack_modifier", attack_modifier);
                cmd.Parameters.AddWithValue("@user_id", user_id);
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
            }
            catch(Exception e)
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