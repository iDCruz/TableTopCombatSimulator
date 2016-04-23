using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

public class History_Query
{
    public static void Record_Combat_Results(int user_id, int creature_1_id, int creature_2_id, float creature_1_hr, float creature_2_hr, float creature_1_dr, float creature_2_dr, float creature_1_wr, float creature_2_wr)
    {
        using (SqlConnection cn = new SqlConnection(WebConfigurationManager.ConnectionStrings["TableTop_DB"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO History(user_id, creature_1_id, creature_2_id, creature_1_hit_rate, creature_2_hit_rate, creature_1_damage_rate, creature_2_damage_rate, creature_1_win_rate, creature_2_win_rate) VALUES (@user_id, @creature_1_id, @creature_2_id, @creature_1_hit_rate, @creature_2_hit_rate, @creature_1_damage_rate, @creature_2_damage_rate, @creature_1_win_rate, @creature_2_win_rate)", cn);
            cmd.Parameters.AddWithValue("@user_id", user_id);
            cmd.Parameters.AddWithValue("@creature_1_id", creature_1_id);
            cmd.Parameters.AddWithValue("@creature_2_id", creature_2_id);
            cmd.Parameters.AddWithValue("@creature_1_hit_rate", creature_1_hr);
            cmd.Parameters.AddWithValue("@creature_2_hit_rate", creature_2_hr);
            cmd.Parameters.AddWithValue("@creature_1_damage_rate", creature_1_dr);
            cmd.Parameters.AddWithValue("@creature_2_damage_rate", creature_2_dr);
            cmd.Parameters.AddWithValue("@creature_1_win_rate", creature_1_wr);
            cmd.Parameters.AddWithValue("@creature_2_win_rate", creature_2_wr);
            cmd.Connection.Open();
            cmd.ExecuteNonQuery();
        }
    }
}