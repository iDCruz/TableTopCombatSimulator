using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Fight : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User_id"] == null)
        {
            Server.Transfer("Default.aspx", true);
        }
    }

    protected void Fight_Click(object sender, EventArgs e)
    {
        // SQL Var
        Creatures creature1 = null;
        Creatures creature2 = null;
        List<Attacks> Attack_list_1 = new List<Attacks>();
        List<Attacks> Attack_list_2 = new List<Attacks>();
        string error_msg_creatures_1 = "";
        string error_msg_creatures_2 = "";
        string error_msg_attacks_1 = "";
        string error_msg_attacks_2 = "";

        //Fight Simulation Var
        Random random = new Random(DateTime.Now.Millisecond);
        int number_of_fights_total = 50000;
        int number_of_fights_count = number_of_fights_total;
        bool creature_1_goes_first = true;
        float[] stats = { 0.0F, 0.0F };
        List<float> creature_1_hit_rate_list = new List<float>();
        List<float> creature_2_hit_rate_list = new List<float>();
        List<float> creature_1_damage_rate_list = new List<float>();
        List<float> creature_2_damage_rate_list = new List<float>();
        float creature_1_hit_rate = 0.0F;
        float creature_2_hit_rate = 0.0F;
        float creature_1_damage_rate = 0.0F;
        float creature_2_damage_rate = 0.0F;
        float creature_1_win_rate = 0.0F;
        float creature_2_win_rate = 0.0F;

        //Get Creatures
        creature1 = Creatures_Query.Get_Creature(out error_msg_creatures_1, DropDownList1.SelectedItem.Text, ((int)Session["User_id"]));
        creature2 = Creatures_Query.Get_Creature(out error_msg_creatures_2, DropDownList2.SelectedItem.Text, ((int)Session["User_id"]));

        //Get their Attacks
        Attack_list_1 = Attacks_Query.Get_Attacks_Of_Creature(out error_msg_attacks_1, creature1.Creature_id, creature1.User_id);
        Attack_list_2 = Attacks_Query.Get_Attacks_Of_Creature(out error_msg_attacks_2, creature2.Creature_id, creature2.User_id);

        //Simulate Fights
        while (number_of_fights_count > 0)
        {

            // Setup temp creatures hp for fight
            int temp_creature1_hp = creature1.Hit_points;
            int temp_creature2_hp = creature2.Hit_points;
            int round_count = 0;
            int creature_1_turns = 0;
            int creature_2_turns = 0;

            //Roll initaive 
            creature_1_goes_first = Roll_Initative(creature1, creature2, random);

            // Start Fight
            while (temp_creature1_hp > 0 && temp_creature2_hp > 0)
            {
                // if creature 1 goes first
                if (creature_1_goes_first)
                {
                    stats = Attack(creature1, Attack_list_1, creature2, ref temp_creature2_hp, random);
                    creature_1_turns++;
                    creature_1_hit_rate += stats[0];
                    creature_1_damage_rate += stats[1];

                    if (temp_creature2_hp > 0)
                    {
                        stats = Attack(creature2, Attack_list_2, creature1, ref temp_creature1_hp, random);
                        creature_2_turns++;
                        creature_2_hit_rate += stats[0];
                        creature_2_damage_rate += stats[1];
                    }
                }

                // if creature 2 goes fire
                else if (!creature_1_goes_first)
                {
                    stats = Attack(creature2, Attack_list_2, creature1, ref temp_creature1_hp, random);
                    creature_2_turns++;
                    creature_2_hit_rate += stats[0];
                    creature_2_damage_rate += stats[1];

                    if (temp_creature1_hp > 0)
                    {
                        stats = Attack(creature1, Attack_list_1, creature2, ref temp_creature2_hp, random);
                        creature_1_turns++;
                        creature_1_hit_rate += stats[0];
                        creature_1_damage_rate += stats[1];
                    }
                }

                // increment round
                round_count++;
            }

            //Finalize Stats for Fight
            if(creature_1_turns > 0)
            {
                creature_1_hit_rate_list.Add(creature_1_hit_rate / creature_1_turns);
                creature_1_hit_rate = 0.0F;
                creature_1_damage_rate_list.Add(creature_1_damage_rate / creature_1_turns);
                creature_1_damage_rate = 0.0F;
            }

            if(creature_2_turns > 0)
            {
                creature_2_hit_rate_list.Add(creature_2_hit_rate / creature_2_turns);
                creature_2_hit_rate = 0.0F;
                creature_2_damage_rate_list.Add(creature_2_damage_rate / creature_2_turns);
                creature_2_damage_rate = 0.0F;
            }


            //Declarge Fight Winner
            if (temp_creature1_hp <= 0)
            {
                creature_2_win_rate++;
            }
            else if(temp_creature2_hp <= 0)
            {
                creature_1_win_rate++;
            }

            // End Fight
            number_of_fights_count--;
        }

        //Finalize win rate
        creature_1_win_rate = creature_1_win_rate / number_of_fights_total;
        creature_2_win_rate = creature_2_win_rate / number_of_fights_total;
        string test = "";
    }


    protected float[] Attack(Creatures attacking_creature, List<Attacks> attackers_attacks, Creatures attacked_creature, 
        ref int attacked_creature_hp, Random random)
    {
        // Attack Stats
        float[] stats = { 0.0F, 0.0F };
        float hit_rate = 0.0f;
        float avg_damage = 0.0F;

        foreach (Attacks attack in attackers_attacks)
        {
            if(attacked_creature_hp > 0)
            {
                // Attack
                int attack_roll = random.Next(1, 21) + attack.Attack_modifier;

                // If hit
                if (attack_roll >= attacked_creature.Armor_class)
                {
                    hit_rate += 1;

                    // Calculate damage
                    char[] spliters = { 'd', '+', '-'};
                    string[] damage_info = attack.Attack_damge.Split(spliters);
                    int damage_roll = 0;
                    int damage_dice_number = 0;
                    int damage_dice_size = 0;
                    int damage_modifier = 0;

                    Int32.TryParse(damage_info[0], out damage_dice_number);
                    Int32.TryParse(damage_info[1], out damage_dice_size);
                    Int32.TryParse(damage_info[2], out damage_modifier);

                    // Check for negative modifier 
                    if(attack.Attack_damge.ToLower().IndexOf('-') != -1)
                    {
                        damage_modifier *= -1;
                    }

                    for (int i = 0; i < damage_dice_number; i++)
                    {
                        damage_roll += random.Next(1, damage_dice_size + 1);
                    }

                    damage_roll += damage_modifier;

                    // Min 1 dmg
                    if (damage_roll <= 0)
                    {
                        damage_roll = 1;
                    }

                    
                    avg_damage += damage_roll;

                    // Do Damage
                    attacked_creature_hp -= damage_roll;
                } 
            } 
        }

        // Return Stats
        hit_rate = hit_rate / attackers_attacks.Count();
        stats[0] = (hit_rate);
        stats[1] = (avg_damage);

        return stats;
    }

    protected bool Roll_Initative(Creatures creature1, Creatures creature2, Random random)
    {
        //Roll initiative 
        bool creature_1_goes_first = true;
        int creature_1_init = 0;
        int creature_2_init = 0;
        creature_1_init = random.Next(1, 21) + creature1.Initiative;
        creature_2_init = random.Next(1, 21) + creature2.Initiative;

        //Determin Turn Order
        if (creature_1_init > creature_2_init)
        {
            creature_1_goes_first = true;
        }
        else if (creature_2_init > creature_1_init)
        {
            creature_1_goes_first = false;
        }
        else if (creature_1_init == creature_2_init)
        {
            if (creature1.Initiative > creature2.Initiative)
            {
                creature_1_goes_first = true;
            }
            else if (creature2.Initiative > creature1.Initiative)
            {
                creature_1_goes_first = false;
            }
            else if (creature1.Initiative == creature2.Initiative)
            {
                int coin_flip = random.Next(0, 2);

                if (coin_flip == 0)
                {
                    creature_1_goes_first = true;
                }
                else if (coin_flip == 1)
                {
                    creature_1_goes_first = false;
                }
            }
        }

        return creature_1_goes_first;
    }
}