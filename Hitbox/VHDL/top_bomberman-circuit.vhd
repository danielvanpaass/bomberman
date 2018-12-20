library IEEE;
use IEEE.std_logic_1164.ALL;

architecture circuit of top_bomberman is
   component toplvl_coor
      port (clk:in std_logic;
            reset:in std_logic;
            p1_x:in std_logic_vector(3 downto 0);
            p1_y:in std_logic_vector(3 downto 0);
            p2_x:in std_logic_vector(3 downto 0);
            p2_y:in std_logic_vector(3 downto 0);
            p_bomb:in std_logic;
            p_bombplant:in std_logic;
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
   component top_de1
      port (clock_50mhz:in std_logic;
            reset:in std_logic;
            lay0in:in std_logic_vector(241 downto 0);
            lay1in:in std_logic_vector(7 downto 0);
            lay2in:in std_logic_vector(7 downto 0);
            lay3in:in std_logic_vector(7 downto 0);
            lay3enin:in std_logic;
            vga_hsync:out std_logic;
            vga_vsync:out std_logic;
            vga_b:out std_logic_vector(3 downto 0);
            vga_g:out std_logic_vector(3 downto 0);
            vga_r:out std_logic_vector(3 downto 0);
            v_clock:out std_logic);
   end component;
   component bomb_process
      port (X_b:in std_logic_vector(3 downto 0);
            Y_b:in std_logic_vector(3 downto 0);
            reset:in std_logic;
            clk:in std_logic;
            X_p1:in std_logic_vector(3 downto 0);
            Y_p1:in std_logic_vector(3 downto 0);
            X_p2:in std_logic_vector(3 downto 0);
            Y_p2:in std_logic_vector(3 downto 0);
            victoryv:out std_logic_vector(1 downto 0);
            lethaltile_x:out std_logic_vector(3 downto 0);
            lethaltile_y:out std_logic_vector(3 downto 0);
            bombp1:in std_logic;
            bombp2:in std_logic;
            explosion1:out std_logic;
            explosion2:out std_logic;
            explosion5:out std_logic;
            explosion6:out std_logic);
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
   signal net_0: std_logic;
   signal net_1: std_logic;
   signal net_2: std_logic_vector(3 downto 0);
   signal net_3: std_logic_vector(3 downto 0);
   signal net_4: std_logic_vector(3 downto 0);
   signal net_5: std_logic_vector(7 downto 0);
   signal net_6: std_logic_vector(3 downto 0);
   signal net_7: std_logic_vector(3 downto 0);
   signal net_8: std_logic_vector(3 downto 0);
   signal net_9: std_logic_vector(3 downto 0);
   signal net_10: std_logic_vector(3 downto 0);
   signal net_11: std_logic_vector(3 downto 0);
   signal net_12: std_logic_vector(3 downto 0);
   signal net_13: std_logic_vector(3 downto 0);
   signal net_14: std_logic_vector(3 downto 0);
   signal net_15: std_logic_vector(3 downto 0);
   signal net_16: std_logic_vector(3 downto 0);
   signal net_17: std_logic_vector(3 downto 0);
   signal net_18: std_logic_vector(3 downto 0);
   signal net_19: std_logic_vector(3 downto 0);
   signal net_20: std_logic_vector(3 downto 0);
   signal net_21: std_logic_vector(3 downto 0);
   signal net_22: std_logic_vector(3 downto 0);
   signal net_23: std_logic_vector(3 downto 0);
   signal net_24: std_logic_vector(3 downto 0);
   signal net_25: std_logic_vector(3 downto 0);
   signal net_26: std_logic;
   signal net_27: std_logic;
   signal net_28: std_logic;
   signal net_29: std_logic;
   signal net_30: std_logic;
   signal net_31: std_logic;
   signal net_32: std_logic;
   signal net_33: std_logic;
   signal net_34: std_logic_vector(241 downto 0);
   signal net_35: std_logic_vector(120 downto 0);
   signal net_36: std_logic;
   signal net_37: std_logic_vector(3 downto 0);
   signal net_38: std_logic_vector(3 downto 0);
begin
   vga_vsync <= net_0; 
   vga_hsync <= net_1; 
   TEMP3 <= net_2; 
   TEMP4 <= net_3; 
   TEMP6 <= net_4; 
   TEMP7 <= net_5; 
   toplvl_coor_0 : toplvl_coor port map (clk => clk, reset => reset, 
                                         p1_x => net_6,p1_y => net_7, 
                                         p2_x => net_8,p2_y => net_9, 
                                         p_bomb => TEMP,p_bombplant => TEMP, 
                                         expl_htoa => TEMP_vector,
                                         lethaltile_x => net_37,
                                         lethaltile_y => net_38,
                                         lethal_flag => TEMP,
                                         bomb_a_x => net_10,
                                         bomb_a_y => net_11,
                                         bomb_a_cook => net_26,
                                         bomb_b_x => net_12,
                                         bomb_b_y => net_13,
                                         bomb_b_cook => net_27,
                                         bomb_c_x => net_14,
                                         bomb_c_y => net_15,
                                         bomb_c_cook => net_28,
                                         bomb_d_x => net_16,
                                         bomb_d_y => net_17,
                                         bomb_d_cook => net_29,
                                         bomb_e_x => net_18,
                                         bomb_e_y => net_19,
                                         bomb_e_cook => net_30,
                                         bomb_f_x => net_20,
                                         bomb_f_y => net_21,
                                         bomb_f_cook => net_31,
                                         bomb_g_x => net_22,
                                         bomb_g_y => net_23,
                                         bomb_g_cook => net_32,
                                         bomb_h_x => net_24,
                                         bomb_h_y => net_25,
                                         bomb_h_cook => net_33,
                                         bombflag_htoa => net_5,
                                         maptoVGA => net_34,
                                         obstacle_grid => net_35);
   top_de1_1 : top_de1 port map (clock_50mhz => clk, reset => reset, 
                                 lay0in => net_34,lay1in => TEMP_vector, 
                                 lay2in => TEMP_vector,lay3in => TEMP_vector, 
                                 lay3enin => TEMP,vga_hsync => net_1, 
                                 vga_vsync => net_0,vga_b => net_2, 
                                 vga_g => net_3,vga_r => net_4, 
                                 v_clock => net_36);
   bomb_process_3 : bomb_process port map (X_b => TEMP_vector4, 
                                           Y_b => TEMP_vector4,
                                           reset => reset,clk => clk, 
                                           X_p1 => net_6,Y_p1 => net_7, 
                                           X_p2 => net_8,Y_p2 => net_9, 
                                           victoryv => OPEN,
                                           lethaltile_x => net_37,
                                           lethaltile_y => net_38,
                                           bombp1 => bomb_p1,
                                           bombp2 => bomb_p2,
                                           explosion1 => OPEN,
                                           explosion2 => OPEN,
                                           explosion5 => OPEN,
                                           explosion6 => OPEN);
   hitbox_top_lvl_4 : hitbox_top_lvl port map (clk => clk, v_clk => net_36, 
                                               reset => reset,
                                               walls_and_crates => net_35,
                                               bomb_x_a => net_10,
                                               bomb_y_a => net_11,
                                               bomb_x_b => net_12,
                                               bomb_y_b => net_13,
                                               bomb_x_c => net_14,
                                               bomb_y_c => net_15,
                                               bomb_x_d => net_16,
                                               bomb_y_d => net_17,
                                               bomb_x_e => net_18,
                                               bomb_y_e => net_19,
                                               bomb_x_f => net_20,
                                               bomb_y_f => net_21,
                                               bomb_x_g => net_22,
                                               bomb_y_g => net_23,
                                               bomb_x_h => net_24,
                                               bomb_y_h => net_25,
                                               bomb_a_active => net_26,
                                               bomb_b_active => net_27,
                                               bomb_c_active => net_28,
                                               bomb_d_active => net_29,
                                               bomb_e_active => net_30,
                                               bomb_f_active => net_31,
                                               bomb_g_active => net_32,
                                               bomb_h_active => net_33,
                                               up_p1 => up_p1,
                                               right_p1 => right_p1,
                                               down_p1 => down_p1,
                                               left_p1 => left_p1,
                                               up_p2 => up_p2,
                                               right_p2 => right_p2,
                                               down_p2 => down_p2,
                                               left_p2 => left_p2,
                                               x_p1 => net_6,y_p1 => net_7, 
                                               x_p2 => net_8,y_p2 => net_9);
end circuit;

