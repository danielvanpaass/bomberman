library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of BombHandling is
   component bomb_process
      port (X_b:in std_logic_vector(3 downto 0);
            Y_b:in std_logic_vector(3 downto 0);
            reset:in std_logic;
	    explosion:in std_logic;
            clk:in std_logic;
            clk_30:in std_logic;
            X_p1:in std_logic_vector(3 downto 0);
            Y_p1:in std_logic_vector(3 downto 0);
            X_p2:in std_logic_vector(3 downto 0);
            Y_p2:in std_logic_vector(3 downto 0);
	bomb_a_x : in std_logic_vector(3 downto 0);
	bomb_a_y : in std_logic_vector(3 downto 0);
	bomb_b_x : in std_logic_vector(3 downto 0);
	bomb_b_y : in std_logic_vector(3 downto 0);
	bomb_c_x : in std_logic_vector(3 downto 0);
	bomb_c_y : in std_logic_vector(3 downto 0);
	bomb_d_x : in std_logic_vector(3 downto 0);
	bomb_d_y : in std_logic_vector(3 downto 0);
	bomb_e_x : in std_logic_vector(3 downto 0);
	bomb_e_y : in std_logic_vector(3 downto 0);
	bomb_f_x : in std_logic_vector(3 downto 0);
	bomb_f_y : in std_logic_vector(3 downto 0);
	bomb_g_x : in std_logic_vector(3 downto 0);
	bomb_g_y : in std_logic_vector(3 downto 0);
	bomb_h_x : in std_logic_vector(3 downto 0);
	bomb_h_y : in std_logic_vector(3 downto 0);
	timer_p1 : in std_logic_vector(3 downto 0);
	timer_p2 : in std_logic_vector(3 downto 0);
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
	timer_p1 : out std_logic_vector(3 downto 0);
	timer_p2 : out std_logic_vector(3 downto 0);
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
	    explosion:out std_logic;
            expl_x:out std_logic_vector(3 downto 0);
            expl_y:out std_logic_vector(3 downto 0));
   end component;
   
 
   signal net_0: std_logic;
   signal net_1: std_logic;
   signal net_2: std_logic_vector(3 downto 0);
   signal net_3: std_logic_vector(3 downto 0);
   signal net_4: std_logic_vector(3 downto 0);
   signal net_5: std_logic;
   signal net_6: std_logic_vector(3 downto 0);
   signal net_7: std_logic_vector(3 downto 0);
   signal net_8: std_logic_vector(3 downto 0);
   signal net_9: std_logic_vector(3 downto 0);
   signal net_10: std_logic_vector(7 downto 0);
   signal net_11: std_logic_vector(3 downto 0);
   signal net_12: std_logic_vector(3 downto 0);
   signal net_13: std_logic;
   signal net_14: std_logic_vector(3 downto 0);
   signal net_15: std_logic_vector(3 downto 0);
   signal net_16: std_logic;
   signal net_17: std_logic_vector(3 downto 0);
   signal net_18: std_logic_vector(3 downto 0);
   signal net_19: std_logic;
   signal net_20: std_logic_vector(3 downto 0);
   signal net_21: std_logic_vector(3 downto 0);
   signal net_22: std_logic;
   signal net_23: std_logic_vector(3 downto 0);
   signal net_24: std_logic_vector(3 downto 0);
   signal net_25: std_logic;
   signal net_26: std_logic_vector(3 downto 0);
   signal net_27: std_logic_vector(3 downto 0);
   signal net_28: std_logic_vector(3 downto 0);
   signal net_29: std_logic_vector(3 downto 0);
   signal net_30: std_logic;
   signal net_31: std_logic;
   signal net_32: std_logic;
   signal net_33: std_logic_vector(3 downto 0);
   signal net_34: std_logic_vector(3 downto 0);
   signal net_35: std_logic_vector(3 downto 0);
   signal net_36: std_logic_vector(3 downto 0);
   signal net_37: std_logic_vector(120 downto 0);
   signal net_38: std_logic_vector(3 downto 0);
   signal net_39: std_logic_vector(3 downto 0);
   signal net_40: std_logic_vector(7 downto 0);
   signal net_41: std_logic;
   signal net_42: std_logic;
   signal net_43: std_logic;
   signal net_44: std_logic_vector(1 downto 0);
   signal net_45: std_logic;
   signal net_46: std_logic;
   signal net_47: std_logic_vector(241 downto 0);
   signal net_48: std_logic_vector(3 downto 0);
   signal net_49: std_logic_vector(3 downto 0);
   signal net_50: std_logic_vector(4 downto 0);
   signal net_51: std_logic_vector(5 downto 0);
   signal net_52: std_logic;
   signal net_53: std_logic;
   signal net_54 : std_logic;
	signal net_55 : std_logic_vector(3 downto 0);
	signal net_56 : std_logic_vector(3 downto 0);
begin
   bomb_process_0 : bomb_process port map (X_b => net_38, Y_b => net_39, 
                                           reset => reset,explosion=>net_54,clk => clk, 
                                           clk_30 => clk_30_input,X_p1 => pos_xp1, -- INPUT
                                           Y_p1 => pos_yp1,X_p2 => pos_xp2, -- IN
                                           Y_p2 => pos_yp2, bomb_a_x => net_11, bomb_a_y => net_12, bomb_b_x => net_14, bomb_b_y => net_15, bomb_c_x => net_17, bomb_c_y => net_18, bomb_d_x => net_20, bomb_d_y => net_21, bomb_e_x => net_23, bomb_e_y => net_24, bomb_f_x => net_26, bomb_f_y => net_27, bomb_g_x => net_28, bomb_g_y => net_29, bomb_h_x => net_33, bomb_h_y => net_34,
					timer_p1 => net_55,
					timer_p2 => net_56,
                                           lethal_flag => net_43,
                                           victoryv => victoryflag, -- OUT
                                           lethaltile_x => net_35,
                                           lethaltile_y => net_36,
                                           bombp1 => bombp1,bombp2 => bombp2, -- IN 
                                           b_explosion => explos_sound, -- OUT
                                           b_placed => placed_sound, -- OUT
                                           explosion_bomb => net_10,
                                           buff_p1 => net_41,
                                           buff_p2 => net_42);
   
   toplvl_coor_2 : toplvl_coor port map (clk => clk, reset => reset,
                                         p1_x => pos_xp1,p1_y => pos_yp1, 
                                         p2_x => pos_xp2,p2_y => pos_yp2, 
                                         p1_b => net_41,p2_b => net_42, 
                                         expl_htoa => net_10,
                                         lethaltile_x => net_35,
                                         lethaltile_y => net_36,
                                         lethal_flag => net_43,
                                         bomb_a_x => net_11,
                                         bomb_a_y => net_12,
                                         bomb_a_cook => bomb_a, -- OUT
                                         bomb_b_x => net_14,
                                         bomb_b_y => net_15,
                                         bomb_b_cook => bomb_b, -- OUT
                                         bomb_c_x => net_17,
                                         bomb_c_y => net_18,
                                         bomb_c_cook => bomb_c, -- OUT
                                         bomb_d_x => net_20,
                                         bomb_d_y => net_21,
                                         bomb_d_cook => bomb_d, -- OUT
                                         bomb_e_x => net_23,
                                         bomb_e_y => net_24,
                                         bomb_e_cook => bomb_e, -- OUT
                                         bomb_f_x => net_26,
                                         bomb_f_y => net_27,
                                         bomb_f_cook => bomb_f, -- OUT
                                         bomb_g_x => net_28,
                                         bomb_g_y => net_29,
                                         bomb_g_cook => bomb_g, -- OUT
                                         bomb_h_x => net_33,
                                         bomb_h_y => net_34,
                                         bomb_h_cook => bomb_h, -- OUT
					timer_p1 => net_55,
					timer_p2 => net_56,
                                         bombflag_htoa => net_40,
                                         maptoVGA => VGA, -- OUT
                                         obstacle_grid => obstacle); -- OUT
   last_bomb_4 : last_bomb port map (clk => clk, reset => reset, 
                                     flag_htoa => net_40,bomb_a_x => net_11, 
                                     bomb_a_y => net_12,bomb_b_x => net_14, 
                                     bomb_b_y => net_15,bomb_c_x => net_17, 
                                     bomb_c_y => net_18,bomb_d_x => net_20, 
                                     bomb_d_y => net_21,bomb_e_x => net_23, 
                                     bomb_e_y => net_24,bomb_f_x => net_26, 
                                     bomb_f_y => net_27,bomb_g_x => net_28, 
                                     bomb_g_y => net_29,bomb_h_x => net_33, 
                                     bomb_h_y => net_34,explosion => net_54,	expl_x => net_38, 
                                     expl_y => net_39);
   
end behaviour;
