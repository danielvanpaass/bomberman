library IEEE;
use IEEE.std_logic_1164.ALL;

architecture circuit of test is
   component bomb_process
      port (X_b:in std_logic_vector(3 downto 0);
            Y_b:in std_logic_vector(3 downto 0);
            reset:in std_logic;
            clk:in std_logic;
            clk_30:in std_logic;
            X_p1:in std_logic_vector(3 downto 0);
            Y_p1:in std_logic_vector(3 downto 0);
            X_p2:in std_logic_vector(3 downto 0);
            Y_p2:in std_logic_vector(3 downto 0);
            lethal_flag:out std_logic;
            victoryv:out std_logic_vector(1 downto 0);
            lethaltile_x:out std_logic_vector(3 downto 0);
            lethaltile_y:out std_logic_vector(3 downto 0);
            bombp1:in std_logic;
            bombp2:in std_logic;
            b_explosion:out std_logic;
            b_placed:out std_logic;
            explosion_bomb:out std_logic_vector(7 downto 0);
            buff_p1:out std_logic;
            buff_p2:out std_logic);
   end component;
   component hitbox_top_lvl
      port (clk:in std_logic;
            v_clk:in std_logic;
            reset:in std_logic;
            walls_and_crates:in std_logic_vector(120 downto 0);
            bomb_x_a:in std_logic_vector(3 downto 0);
            bomb_y_a:in std_logic_vector(3 downto 0);
            bomb_x_b:in std_logic_vector(3 downto 0);
            bomb_y_b:in std_logic_vector(3 downto 0);
            bomb_x_c:in std_logic_vector(3 downto 0);
            bomb_y_c:in std_logic_vector(3 downto 0);
            bomb_x_d:in std_logic_vector(3 downto 0);
            bomb_y_d:in std_logic_vector(3 downto 0);
            bomb_x_e:in std_logic_vector(3 downto 0);
            bomb_y_e:in std_logic_vector(3 downto 0);
            bomb_x_f:in std_logic_vector(3 downto 0);
            bomb_y_f:in std_logic_vector(3 downto 0);
            bomb_x_g:in std_logic_vector(3 downto 0);
            bomb_y_g:in std_logic_vector(3 downto 0);
            bomb_x_h:in std_logic_vector(3 downto 0);
            bomb_y_h:in std_logic_vector(3 downto 0);
            bomb_a_active:in std_logic;
            bomb_b_active:in std_logic;
            bomb_c_active:in std_logic;
            bomb_d_active:in std_logic;
            bomb_e_active:in std_logic;
            bomb_f_active:in std_logic;
            bomb_g_active:in std_logic;
            bomb_h_active:in std_logic;
            up_p1:in std_logic;
            right_p1:in std_logic;
            down_p1:in std_logic;
            left_p1:in std_logic;
            up_p2:in std_logic;
            right_p2:in std_logic;
            down_p2:in std_logic;
            left_p2:in std_logic;
            x_p1:out std_logic_vector(3 downto 0);
            y_p1:out std_logic_vector(3 downto 0);
            x_p2:out std_logic_vector(3 downto 0);
            y_p2:out std_logic_vector(3 downto 0));
   end component;
   component toplvl_coor
      port (clk:in std_logic;
            reset:in std_logic;
            p1_x:in std_logic_vector(3 downto 0);
            p1_y:in std_logic_vector(3 downto 0);
            p2_x:in std_logic_vector(3 downto 0);
            p2_y:in std_logic_vector(3 downto 0);
            p1_b:in std_logic;
            p2_b:in std_logic;
            expl_htoa:in std_logic_vector(7 downto 0);
            lethaltile_x:in std_logic_vector(3 downto 0);
            lethaltile_y:in std_logic_vector(3 downto 0);
            lethal_flag:in std_logic;
            bomb_a_x:out std_logic_vector(3 downto 0);
            bomb_a_y:out std_logic_vector(3 downto 0);
            bomb_a_cook:out std_logic;
            bomb_b_x:out std_logic_vector(3 downto 0);
            bomb_b_y:out std_logic_vector(3 downto 0);
            bomb_b_cook:out std_logic;
            bomb_c_x:out std_logic_vector(3 downto 0);
            bomb_c_y:out std_logic_vector(3 downto 0);
            bomb_c_cook:out std_logic;
            bomb_d_x:out std_logic_vector(3 downto 0);
            bomb_d_y:out std_logic_vector(3 downto 0);
            bomb_d_cook:out std_logic;
            bomb_e_x:out std_logic_vector(3 downto 0);
            bomb_e_y:out std_logic_vector(3 downto 0);
            bomb_e_cook:out std_logic;
            bomb_f_x:out std_logic_vector(3 downto 0);
            bomb_f_y:out std_logic_vector(3 downto 0);
            bomb_f_cook:out std_logic;
            bomb_g_x:out std_logic_vector(3 downto 0);
            bomb_g_y:out std_logic_vector(3 downto 0);
            bomb_g_cook:out std_logic;
            bomb_h_x:out std_logic_vector(3 downto 0);
            bomb_h_y:out std_logic_vector(3 downto 0);
            bomb_h_cook:out std_logic;
            bombflag_htoa:out std_logic_vector(7 downto 0);
            maptoVGA:out std_logic_vector(241 downto 0);
            obstacle_grid:out std_logic_vector(120 downto 0));
   end component;
   component last_bomb
      port (clk:in std_logic;
            reset:in std_logic;
            flag_htoa:in std_logic_vector(7 downto 0);
            bomb_a_x:in std_logic_vector(3 downto 0);
            bomb_a_y:in std_logic_vector(3 downto 0);
            bomb_b_x:in std_logic_vector(3 downto 0);
            bomb_b_y:in std_logic_vector(3 downto 0);
            bomb_c_x:in std_logic_vector(3 downto 0);
            bomb_c_y:in std_logic_vector(3 downto 0);
            bomb_d_x:in std_logic_vector(3 downto 0);
            bomb_d_y:in std_logic_vector(3 downto 0);
            bomb_e_x:in std_logic_vector(3 downto 0);
            bomb_e_y:in std_logic_vector(3 downto 0);
            bomb_f_x:in std_logic_vector(3 downto 0);
            bomb_f_y:in std_logic_vector(3 downto 0);
            bomb_g_x:in std_logic_vector(3 downto 0);
            bomb_g_y:in std_logic_vector(3 downto 0);
            bomb_h_x:in std_logic_vector(3 downto 0);
            bomb_h_y:in std_logic_vector(3 downto 0);
            expl_x:out std_logic_vector(3 downto 0);
            expl_y:out std_logic_vector(3 downto 0));
   end component;
   component sound
      port (clk:in std_logic;
            clk_30:in std_logic;
            reset:in std_logic;
            victory:in std_logic_vector(1 downto 0);
            bomb_placed:in std_logic;
            bomb_exploded:in std_logic;
            output:out std_logic);
   end component;
   signal net_0: std_logic;
   signal net_1: std_logic_vector(1 downto 0);
   signal net_2: std_logic_vector(3 downto 0);
   signal net_3: std_logic_vector(3 downto 0);
   signal net_4: std_logic_vector(3 downto 0);
   signal net_5: std_logic_vector(3 downto 0);
   signal net_6: std_logic_vector(7 downto 0);
   signal net_7: std_logic_vector(3 downto 0);
   signal net_8: std_logic_vector(3 downto 0);
   signal net_9: std_logic;
   signal net_10: std_logic_vector(3 downto 0);
   signal net_11: std_logic_vector(3 downto 0);
   signal net_12: std_logic;
   signal net_13: std_logic_vector(3 downto 0);
   signal net_14: std_logic_vector(3 downto 0);
   signal net_15: std_logic;
   signal net_16: std_logic_vector(3 downto 0);
   signal net_17: std_logic_vector(3 downto 0);
   signal net_18: std_logic;
   signal net_19: std_logic_vector(3 downto 0);
   signal net_20: std_logic_vector(3 downto 0);
   signal net_21: std_logic;
   signal net_22: std_logic_vector(3 downto 0);
   signal net_23: std_logic_vector(3 downto 0);
   signal net_24: std_logic_vector(3 downto 0);
   signal net_25: std_logic_vector(3 downto 0);
   signal net_26: std_logic;
   signal net_27: std_logic;
   signal net_28: std_logic;
   signal net_29: std_logic_vector(3 downto 0);
   signal net_30: std_logic_vector(3 downto 0);
   signal net_31: std_logic_vector(3 downto 0);
   signal net_32: std_logic_vector(3 downto 0);
   signal net_33: std_logic_vector(120 downto 0);
   signal net_34: std_logic_vector(3 downto 0);
   signal net_35: std_logic_vector(3 downto 0);
   signal net_36: std_logic_vector(7 downto 0);
   signal net_37: std_logic;
   signal net_38: std_logic;
   signal net_39: std_logic;
   signal net_40: std_logic;
begin
   test <= net_0; 
   victory <= net_1; 
   bomb_process_0 : bomb_process port map (X_b => net_34, Y_b => net_35, 
                                           reset => reset,clk => clk, 
                                           clk_30 => clk_60hz,X_p1 => net_2, 
                                           Y_p1 => net_3,X_p2 => net_4, 
                                           Y_p2 => net_5,
                                           lethal_flag => net_39,
                                           victoryv => net_1,
                                           lethaltile_x => net_31,
                                           lethaltile_y => net_32,
                                           bombp1 => bombp1,bombp2 => bombp2, 
                                           b_explosion => net_0,
                                           b_placed => net_40,
                                           explosion_bomb => net_6,
                                           buff_p1 => net_37,
                                           buff_p2 => net_38);
   hitbox_top_lvl_1 : hitbox_top_lvl port map (clk => clk, 
                                               v_clk => clk_60hz,
                                               reset => reset,
                                               walls_and_crates => net_33,
                                               bomb_x_a => net_7,
                                               bomb_y_a => net_8,
                                               bomb_x_b => net_10,
                                               bomb_y_b => net_11,
                                               bomb_x_c => net_13,
                                               bomb_y_c => net_14,
                                               bomb_x_d => net_16,
                                               bomb_y_d => net_17,
                                               bomb_x_e => net_19,
                                               bomb_y_e => net_20,
                                               bomb_x_f => net_22,
                                               bomb_y_f => net_23,
                                               bomb_x_g => net_24,
                                               bomb_y_g => net_25,
                                               bomb_x_h => net_29,
                                               bomb_y_h => net_30,
                                               bomb_a_active => net_9,
                                               bomb_b_active => net_12,
                                               bomb_c_active => net_15,
                                               bomb_d_active => net_18,
                                               bomb_e_active => net_21,
                                               bomb_f_active => net_26,
                                               bomb_g_active => net_27,
                                               bomb_h_active => net_28,
                                               up_p1 => p1_up,
                                               right_p1 => p1_right,
                                               down_p1 => p1_down,
                                               left_p1 => p1_left,
                                               up_p2 => p2_up,
                                               right_p2 => p2_right,
                                               down_p2 => p2_down,
                                               left_p2 => p2_left,
                                               x_p1 => net_2,y_p1 => net_3, 
                                               x_p2 => net_4,y_p2 => net_5);
   toplvl_coor_2 : toplvl_coor port map (clk => clk, reset => reset, 
                                         p1_x => net_2,p1_y => net_3, 
                                         p2_x => net_4,p2_y => net_5, 
                                         p1_b => net_37,p2_b => net_38, 
                                         expl_htoa => net_6,
                                         lethaltile_x => net_31,
                                         lethaltile_y => net_32,
                                         lethal_flag => net_39,
                                         bomb_a_x => net_7,bomb_a_y => net_8, 
                                         bomb_a_cook => net_9,
                                         bomb_b_x => net_10,
                                         bomb_b_y => net_11,
                                         bomb_b_cook => net_12,
                                         bomb_c_x => net_13,
                                         bomb_c_y => net_14,
                                         bomb_c_cook => net_15,
                                         bomb_d_x => net_16,
                                         bomb_d_y => net_17,
                                         bomb_d_cook => net_18,
                                         bomb_e_x => net_19,
                                         bomb_e_y => net_20,
                                         bomb_e_cook => net_21,
                                         bomb_f_x => net_22,
                                         bomb_f_y => net_23,
                                         bomb_f_cook => net_26,
                                         bomb_g_x => net_24,
                                         bomb_g_y => net_25,
                                         bomb_g_cook => net_27,
                                         bomb_h_x => net_29,
                                         bomb_h_y => net_30,
                                         bomb_h_cook => net_28,
                                         bombflag_htoa => net_36,
                                         maptoVGA => OPEN,
                                         obstacle_grid => net_33);
   last_bomb_4 : last_bomb port map (clk => clk, reset => reset, 
                                     flag_htoa => net_36,bomb_a_x => net_7, 
                                     bomb_a_y => net_8,bomb_b_x => net_10, 
                                     bomb_b_y => net_11,bomb_c_x => net_13, 
                                     bomb_c_y => net_14,bomb_d_x => net_16, 
                                     bomb_d_y => net_17,bomb_e_x => net_19, 
                                     bomb_e_y => net_20,bomb_f_x => net_22, 
                                     bomb_f_y => net_23,bomb_g_x => net_24, 
                                     bomb_g_y => net_25,bomb_h_x => net_29, 
                                     bomb_h_y => net_30,expl_x => net_34, 
                                     expl_y => net_35);
   sound_5 : sound port map (clk => clk, clk_30 => clk_60hz, reset => reset, 
                             victory => net_1,bomb_placed => net_40, 
                             bomb_exploded => net_0,output => OPEN);
end circuit;

