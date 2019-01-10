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
   component vga_controller
      port (clk:in std_logic;
            reset:in std_logic;
            vga_hsync:out std_logic;
            vga_vsync:out std_logic;
            clock_60hz:out std_logic;
            x_out:out std_logic_vector(3 downto 0);
            y_out:out std_logic_vector(3 downto 0);
            h_out:out std_logic_vector(4 downto 0);
            v_out:out std_logic_vector(5 downto 0);
            video_on:out std_logic);
   end component;
   component sprites
      port (victory:in std_logic_vector(1 downto 0);
            playground:in std_logic_vector(241 downto 0);
            clk:in std_logic;
            reset:in std_logic;
            x_p1:in std_logic_vector(3 downto 0);
            y_p1:in std_logic_vector(3 downto 0);
            x_p2:in std_logic_vector(3 downto 0);
            y_p2:in std_logic_vector(3 downto 0);
            x_bomb_a:in std_logic_vector(3 downto 0);
            y_bomb_a:in std_logic_vector(3 downto 0);
            bomb_a_enable:in std_logic;
            x_bomb_b:in std_logic_vector(3 downto 0);
            y_bomb_b:in std_logic_vector(3 downto 0);
            bomb_b_enable:in std_logic;
            x_bomb_c:in std_logic_vector(3 downto 0);
            y_bomb_c:in std_logic_vector(3 downto 0);
            bomb_c_enable:in std_logic;
            x_bomb_d:in std_logic_vector(3 downto 0);
            y_bomb_d:in std_logic_vector(3 downto 0);
            bomb_d_enable:in std_logic;
            x_bomb_e:in std_logic_vector(3 downto 0);
            y_bomb_e:in std_logic_vector(3 downto 0);
            bomb_e_enable:in std_logic;
            x_bomb_f:in std_logic_vector(3 downto 0);
            y_bomb_f:in std_logic_vector(3 downto 0);
            bomb_f_enable:in std_logic;
            x_bomb_g:in std_logic_vector(3 downto 0);
            y_bomb_g:in std_logic_vector(3 downto 0);
            bomb_g_enable:in std_logic;
            x_bomb_h:in std_logic_vector(3 downto 0);
            y_bomb_h:in std_logic_vector(3 downto 0);
            bomb_h_enable:in std_logic;
            x_map:in std_logic_vector(3 downto 0);
            y_map:in std_logic_vector(3 downto 0);
            input_h_map:in std_logic_vector(4 downto 0);
            input_v_map:in std_logic_vector(5 downto 0);
            video_on:in std_logic;
            r:out std_logic_vector(3 downto 0);
            g:out std_logic_vector(3 downto 0);
            b:out std_logic_vector(3 downto 0));
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
begin
   hsync <= net_0; 
   vsync <= net_1; 
   r <= net_2; 
   g <= net_3; 
   b <= net_4; 
   sound_output <= net_5;
	LED <= net_10;
   bomb_process_0 : bomb_process port map (X_b => net_38, Y_b => net_39, 
                                           reset => reset,clk => clk, 
                                           clk_30 => net_53,X_p1 => net_6, 
                                           Y_p1 => net_7,X_p2 => net_8, 
                                           Y_p2 => net_9,
                                           lethal_flag => net_43,
                                           victoryv => net_44,
                                           lethaltile_x => net_35,
                                           lethaltile_y => net_36,
                                           bombp1 => bombp1,bombp2 => bombp2, 
                                           b_explosion => net_46,
                                           b_placed => net_45,
                                           explosion_bomb => net_10,
                                           buff_p1 => net_41,
                                           buff_p2 => net_42);
   hitbox_top_lvl_1 : hitbox_top_lvl port map (clk => clk, v_clk => net_53, 
                                               reset => reset,
                                               walls_and_crates => net_37,
                                               bomb_x_a => net_11,
                                               bomb_y_a => net_12,
                                               bomb_x_b => net_14,
                                               bomb_y_b => net_15,
                                               bomb_x_c => net_17,
                                               bomb_y_c => net_18,
                                               bomb_x_d => net_20,
                                               bomb_y_d => net_21,
                                               bomb_x_e => net_23,
                                               bomb_y_e => net_24,
                                               bomb_x_f => net_26,
                                               bomb_y_f => net_27,
                                               bomb_x_g => net_28,
                                               bomb_y_g => net_29,
                                               bomb_x_h => net_33,
                                               bomb_y_h => net_34,
                                               bomb_a_active => net_13,
                                               bomb_b_active => net_16,
                                               bomb_c_active => net_19,
                                               bomb_d_active => net_22,
                                               bomb_e_active => net_25,
                                               bomb_f_active => net_30,
                                               bomb_g_active => net_31,
                                               bomb_h_active => net_32,
                                               up_p1 => p1_up,
                                               right_p1 => p1_right,
                                               down_p1 => p1_down,
                                               left_p1 => p1_left,
                                               up_p2 => p2_up,
                                               right_p2 => p2_right,
                                               down_p2 => p2_down,
                                               left_p2 => p2_left,
                                               x_p1 => net_6,y_p1 => net_7, 
                                               x_p2 => net_8,y_p2 => net_9);
   toplvl_coor_2 : toplvl_coor port map (clk => clk, reset => reset, 
                                         p1_x => net_6,p1_y => net_7, 
                                         p2_x => net_8,p2_y => net_9, 
                                         p1_b => net_41,p2_b => net_42, 
                                         expl_htoa => net_10,
                                         lethaltile_x => net_35,
                                         lethaltile_y => net_36,
                                         lethal_flag => net_43,
                                         bomb_a_x => net_11,
                                         bomb_a_y => net_12,
                                         bomb_a_cook => net_13,
                                         bomb_b_x => net_14,
                                         bomb_b_y => net_15,
                                         bomb_b_cook => net_16,
                                         bomb_c_x => net_17,
                                         bomb_c_y => net_18,
                                         bomb_c_cook => net_19,
                                         bomb_d_x => net_20,
                                         bomb_d_y => net_21,
                                         bomb_d_cook => net_22,
                                         bomb_e_x => net_23,
                                         bomb_e_y => net_24,
                                         bomb_e_cook => net_25,
                                         bomb_f_x => net_26,
                                         bomb_f_y => net_27,
                                         bomb_f_cook => net_30,
                                         bomb_g_x => net_28,
                                         bomb_g_y => net_29,
                                         bomb_g_cook => net_31,
                                         bomb_h_x => net_33,
                                         bomb_h_y => net_34,
                                         bomb_h_cook => net_32,
                                         bombflag_htoa => net_40,
                                         maptoVGA => net_47,
                                         obstacle_grid => net_37);
   last_bomb_4 : last_bomb port map (clk => clk, reset => reset, 
                                     flag_htoa => net_40,bomb_a_x => net_11, 
                                     bomb_a_y => net_12,bomb_b_x => net_14, 
                                     bomb_b_y => net_15,bomb_c_x => net_17, 
                                     bomb_c_y => net_18,bomb_d_x => net_20, 
                                     bomb_d_y => net_21,bomb_e_x => net_23, 
                                     bomb_e_y => net_24,bomb_f_x => net_26, 
                                     bomb_f_y => net_27,bomb_g_x => net_28, 
                                     bomb_g_y => net_29,bomb_h_x => net_33, 
                                     bomb_h_y => net_34,expl_x => net_38, 
                                     expl_y => net_39);
   sound_5 : sound port map (clk => clk, clk_30 => net_53, reset => reset, 
                             victory => net_44,bomb_placed => net_45, 
                             bomb_exploded => net_46,output => net_5);
   vga_controller_6 : vga_controller port map (clk => clk, reset => reset, 
                                               vga_hsync => net_0,
                                               vga_vsync => net_1,
                                               clock_60hz => net_53,
                                               x_out => net_48,
                                               y_out => net_49,
                                               h_out => net_50,
                                               v_out => net_51,
                                               video_on => net_52);
   sprites_7 : sprites port map (victory => net_44, playground => net_47, 
                                 clk => clk,reset => reset, x_p1 => net_6, 
                                 y_p1 => net_7,x_p2 => net_8, y_p2 => net_9, 
                                 x_bomb_a => net_11,y_bomb_a => net_12, 
                                 bomb_a_enable => net_13,x_bomb_b => net_14, 
                                 y_bomb_b => net_15,bomb_b_enable => net_16, 
                                 x_bomb_c => net_17,y_bomb_c => net_18, 
                                 bomb_c_enable => net_19,x_bomb_d => net_20, 
                                 y_bomb_d => net_21,bomb_d_enable => net_22, 
                                 x_bomb_e => net_23,y_bomb_e => net_24, 
                                 bomb_e_enable => net_25,x_bomb_f => net_26, 
                                 y_bomb_f => net_27,bomb_f_enable => net_30, 
                                 x_bomb_g => net_28,y_bomb_g => net_29, 
                                 bomb_g_enable => net_31,x_bomb_h => net_33, 
                                 y_bomb_h => net_34,bomb_h_enable => net_32, 
                                 x_map => net_48,y_map => net_49, 
                                 input_h_map => net_50,input_v_map => net_51, 
                                 video_on => net_52,r => net_2, 
                                 g => net_3,b => net_4);
end circuit;

