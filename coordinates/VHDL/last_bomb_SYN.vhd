
library ieee;
use ieee.std_logic_1164.all;
--library tcb018gbwp7t;
--use tcb018gbwp7t.all;

architecture synthesised of last_bomb is

  component OR2D4BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component AN2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component DFQD1BWP7T
    port(CP, D : in std_logic; Q : out std_logic);
  end component;

  component DFKCNQD1BWP7T
    port(CP, CN, D : in std_logic; Q : out std_logic);
  end component;

  component LNQD1BWP7T
    port(EN, D : in std_logic; Q : out std_logic);
  end component;

  component ND2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component IOA21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component OAI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component OAI211D0BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component ND4D0BWP7T
    port(A1, A2, A3, A4 : in std_logic; ZN : out std_logic);
  end component;

  component AOI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component IAO21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component NR2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component NR3D0BWP7T
    port(A1, A2, A3 : in std_logic; ZN : out std_logic);
  end component;

  component AOI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component INR2D0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component INVD0BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component IND2D0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component OR2D0BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component INR3D0BWP7T
    port(A1, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  signal bombysample : std_logic_vector(3 downto 0);
  signal bombxsample : std_logic_vector(3 downto 0);
  signal state : std_logic_vector(3 downto 0);
  signal n_0, n_1, n_2, n_3, n_4 : std_logic;
  signal n_5, n_6, n_7, n_8, n_9 : std_logic;
  signal n_11, n_12, n_13, n_14, n_15 : std_logic;
  signal n_16, n_17, n_18, n_19, n_20 : std_logic;
  signal n_21, n_22, n_23, n_24, n_25 : std_logic;
  signal n_26, n_27, n_28, n_29, n_30 : std_logic;
  signal n_31, n_32, n_33, n_34, n_35 : std_logic;
  signal n_36, n_37, n_38, n_39, n_40 : std_logic;
  signal n_41, n_42, n_43, n_44, n_45 : std_logic;
  signal n_46, n_47, n_48, n_49, n_50 : std_logic;
  signal n_51, n_52, n_53, n_55, n_56 : std_logic;
  signal n_57, n_58, n_59, n_60, n_61 : std_logic;
  signal n_62, n_63, n_64, n_65, n_66 : std_logic;
  signal n_67, n_68, n_69, n_70, n_71 : std_logic;
  signal n_72, n_73, n_156 : std_logic;

begin

  g2545 : OR2D4BWP7T port map(A1 => n_59, A2 => n_66, Z => expl_x(1));
  g2546 : OR2D4BWP7T port map(A1 => n_63, A2 => n_68, Z => expl_x(2));
  g2547 : OR2D4BWP7T port map(A1 => n_60, A2 => n_72, Z => expl_x(3));
  g2550 : OR2D4BWP7T port map(A1 => n_56, A2 => n_67, Z => expl_x(0));
  g2551 : OR2D4BWP7T port map(A1 => n_58, A2 => n_69, Z => expl_y(1));
  g2548 : OR2D4BWP7T port map(A1 => n_64, A2 => n_65, Z => expl_y(2));
  g2552 : OR2D4BWP7T port map(A1 => n_61, A2 => n_70, Z => expl_y(3));
  g2549 : OR2D4BWP7T port map(A1 => n_57, A2 => n_73, Z => expl_y(0));
  g2560 : AN2D1BWP7T port map(A1 => n_71, A2 => bombysample(0), Z => n_73);
  g2555 : AN2D1BWP7T port map(A1 => n_71, A2 => bombxsample(3), Z => n_72);
  g2553 : AN2D1BWP7T port map(A1 => n_71, A2 => bombysample(3), Z => n_70);
  state_reg_1 : DFQD1BWP7T port map(CP => clk, D => n_62, Q => state(1));
  g2557 : AN2D1BWP7T port map(A1 => n_71, A2 => bombysample(1), Z => n_69);
  g2554 : AN2D1BWP7T port map(A1 => n_71, A2 => bombxsample(2), Z => n_68);
  g2561 : AN2D1BWP7T port map(A1 => n_71, A2 => bombxsample(0), Z => n_67);
  g2558 : AN2D1BWP7T port map(A1 => n_71, A2 => bombxsample(1), Z => n_66);
  g2559 : AN2D1BWP7T port map(A1 => n_71, A2 => bombysample(2), Z => n_65);
  state_reg_2 : DFQD1BWP7T port map(CP => clk, D => n_55, Q => state(2));
  state_reg_0 : DFKCNQD1BWP7T port map(CP => clk, CN => n_52, D => n_156, Q => state(0));
  bombysample_reg_2 : LNQD1BWP7T port map(EN => n_71, D => n_64, Q => bombysample(2));
  bombxsample_reg_2 : LNQD1BWP7T port map(EN => n_71, D => n_63, Q => bombxsample(2));
  g2574 : ND2D0BWP7T port map(A1 => n_53, A2 => n_51, ZN => n_62);
  bombysample_reg_3 : LNQD1BWP7T port map(EN => n_71, D => n_61, Q => bombysample(3));
  bombxsample_reg_3 : LNQD1BWP7T port map(EN => n_71, D => n_60, Q => bombxsample(3));
  bombxsample_reg_1 : LNQD1BWP7T port map(EN => n_71, D => n_59, Q => bombxsample(1));
  bombysample_reg_1 : LNQD1BWP7T port map(EN => n_71, D => n_58, Q => bombysample(1));
  bombysample_reg_0 : LNQD1BWP7T port map(EN => n_71, D => n_57, Q => bombysample(0));
  bombxsample_reg_0 : LNQD1BWP7T port map(EN => n_71, D => n_56, Q => bombxsample(0));
  g2572 : IOA21D0BWP7T port map(A1 => n_156, A2 => n_4, B => n_53, ZN => n_55);
  g2573 : OAI21D0BWP7T port map(A1 => n_29, A2 => flag_htoa(5), B => n_0, ZN => n_52);
  g2584 : OAI211D0BWP7T port map(A1 => flag_htoa(1), A2 => flag_htoa(2), B => n_156, C => n_3, ZN => n_51);
  g2581 : ND4D0BWP7T port map(A1 => n_32, A2 => n_38, A3 => n_33, A4 => n_27, ZN => n_57);
  g2575 : ND4D0BWP7T port map(A1 => n_13, A2 => n_11, A3 => n_12, A4 => n_15, ZN => n_64);
  g2582 : ND4D0BWP7T port map(A1 => n_18, A2 => n_25, A3 => n_28, A4 => n_20, ZN => n_61);
  g2578 : ND4D0BWP7T port map(A1 => n_37, A2 => n_19, A3 => n_40, A4 => n_48, ZN => n_58);
  g2577 : ND4D0BWP7T port map(A1 => n_23, A2 => n_24, A3 => n_17, A4 => n_34, ZN => n_60);
  g2576 : ND4D0BWP7T port map(A1 => n_14, A2 => n_49, A3 => n_50, A4 => n_16, ZN => n_59);
  g2579 : ND4D0BWP7T port map(A1 => n_44, A2 => n_21, A3 => n_46, A4 => n_42, ZN => n_63);
  g2580 : ND4D0BWP7T port map(A1 => n_30, A2 => n_22, A3 => n_26, A4 => n_35, ZN => n_56);
  g2585 : OAI21D0BWP7T port map(A1 => flag_htoa(5), A2 => flag_htoa(6), B => n_156, ZN => n_53);
  g2599 : AOI22D0BWP7T port map(A1 => n_45, A2 => bomb_e_x(1), B1 => n_47, B2 => bomb_f_x(1), ZN => n_50);
  g2600 : AOI22D0BWP7T port map(A1 => n_43, A2 => bomb_a_x(1), B1 => n_41, B2 => bomb_d_x(1), ZN => n_49);
  g2601 : AOI22D0BWP7T port map(A1 => n_47, A2 => bomb_f_y(1), B1 => state(3), B2 => bomb_h_y(1), ZN => n_48);
  g2613 : AOI22D0BWP7T port map(A1 => n_45, A2 => bomb_e_x(2), B1 => n_39, B2 => bomb_g_x(2), ZN => n_46);
  g2603 : AOI22D0BWP7T port map(A1 => n_43, A2 => bomb_a_x(2), B1 => n_31, B2 => bomb_b_x(2), ZN => n_44);
  g2604 : AOI22D0BWP7T port map(A1 => n_41, A2 => bomb_d_x(2), B1 => state(3), B2 => bomb_h_x(2), ZN => n_42);
  g2605 : AOI22D0BWP7T port map(A1 => n_45, A2 => bomb_e_y(1), B1 => n_39, B2 => bomb_g_y(1), ZN => n_40);
  g2612 : AOI22D0BWP7T port map(A1 => n_36, A2 => bomb_c_y(0), B1 => n_47, B2 => bomb_f_y(0), ZN => n_38);
  g2606 : AOI22D0BWP7T port map(A1 => n_41, A2 => bomb_d_y(1), B1 => n_36, B2 => bomb_c_y(1), ZN => n_37);
  g2607 : AOI22D0BWP7T port map(A1 => n_47, A2 => bomb_f_x(0), B1 => state(3), B2 => bomb_h_x(0), ZN => n_35);
  g2608 : AOI22D0BWP7T port map(A1 => n_47, A2 => bomb_f_x(3), B1 => n_39, B2 => bomb_g_x(3), ZN => n_34);
  g2609 : AOI22D0BWP7T port map(A1 => n_45, A2 => bomb_e_y(0), B1 => state(3), B2 => bomb_h_y(0), ZN => n_33);
  g2610 : AOI22D0BWP7T port map(A1 => n_31, A2 => bomb_b_y(0), B1 => n_41, B2 => bomb_d_y(0), ZN => n_32);
  g2611 : AOI22D0BWP7T port map(A1 => n_31, A2 => bomb_b_x(0), B1 => n_36, B2 => bomb_c_x(0), ZN => n_30);
  g2586 : IAO21D0BWP7T port map(A1 => n_9, A2 => flag_htoa(3), B => flag_htoa(4), ZN => n_29);
  state_reg_3 : DFKCNQD1BWP7T port map(CP => clk, CN => n_2, D => n_71, Q => state(3));
  g2590 : AOI22D0BWP7T port map(A1 => n_43, A2 => bomb_a_y(3), B1 => n_47, B2 => bomb_f_y(3), ZN => n_28);
  g2614 : AOI22D0BWP7T port map(A1 => n_43, A2 => bomb_a_y(0), B1 => n_39, B2 => bomb_g_y(0), ZN => n_27);
  g2615 : AOI22D0BWP7T port map(A1 => n_45, A2 => bomb_e_x(0), B1 => n_39, B2 => bomb_g_x(0), ZN => n_26);
  g2588 : AOI22D0BWP7T port map(A1 => n_36, A2 => bomb_c_y(3), B1 => n_45, B2 => bomb_e_y(3), ZN => n_25);
  g2616 : AOI22D0BWP7T port map(A1 => n_43, A2 => bomb_a_x(3), B1 => n_41, B2 => bomb_d_x(3), ZN => n_24);
  g2589 : AOI22D0BWP7T port map(A1 => n_31, A2 => bomb_b_x(3), B1 => n_36, B2 => bomb_c_x(3), ZN => n_23);
  g2617 : AOI22D0BWP7T port map(A1 => n_43, A2 => bomb_a_x(0), B1 => n_41, B2 => bomb_d_x(0), ZN => n_22);
  g2618 : AOI22D0BWP7T port map(A1 => n_36, A2 => bomb_c_x(2), B1 => n_47, B2 => bomb_f_x(2), ZN => n_21);
  g2619 : AOI22D0BWP7T port map(A1 => n_39, A2 => bomb_g_y(3), B1 => state(3), B2 => bomb_h_y(3), ZN => n_20);
  g2587 : AOI22D0BWP7T port map(A1 => n_43, A2 => bomb_a_y(1), B1 => n_31, B2 => bomb_b_y(1), ZN => n_19);
  g2591 : AOI22D0BWP7T port map(A1 => n_31, A2 => bomb_b_y(3), B1 => n_41, B2 => bomb_d_y(3), ZN => n_18);
  g2592 : AOI22D0BWP7T port map(A1 => n_45, A2 => bomb_e_x(3), B1 => state(3), B2 => bomb_h_x(3), ZN => n_17);
  g2593 : AOI22D0BWP7T port map(A1 => n_39, A2 => bomb_g_x(1), B1 => state(3), B2 => bomb_h_x(1), ZN => n_16);
  g2594 : AOI22D0BWP7T port map(A1 => n_47, A2 => bomb_f_y(2), B1 => state(3), B2 => bomb_h_y(2), ZN => n_15);
  g2595 : AOI22D0BWP7T port map(A1 => n_31, A2 => bomb_b_x(1), B1 => n_36, B2 => bomb_c_x(1), ZN => n_14);
  g2596 : AOI22D0BWP7T port map(A1 => n_41, A2 => bomb_d_y(2), B1 => n_45, B2 => bomb_e_y(2), ZN => n_13);
  g2597 : AOI22D0BWP7T port map(A1 => n_36, A2 => bomb_c_y(2), B1 => n_39, B2 => bomb_g_y(2), ZN => n_12);
  g2598 : AOI22D0BWP7T port map(A1 => n_43, A2 => bomb_a_y(2), B1 => n_31, B2 => bomb_b_y(2), ZN => n_11);
  g2624 : NR2D0BWP7T port map(A1 => n_5, A2 => state(0), ZN => n_31);
  g2623 : NR2D0BWP7T port map(A1 => n_6, A2 => state(0), ZN => n_47);
  g2625 : NR2D0BWP7T port map(A1 => n_8, A2 => state(0), ZN => n_41);
  g2621 : NR3D0BWP7T port map(A1 => n_7, A2 => state(3), A3 => state(0), ZN => n_71);
  g2626 : AOI21D0BWP7T port map(A1 => n_1, A2 => flag_htoa(0), B => flag_htoa(2), ZN => n_9);
  g2627 : INR2D0BWP7T port map(A1 => state(0), B1 => n_8, ZN => n_45);
  g2628 : INR2D0BWP7T port map(A1 => state(0), B1 => n_7, ZN => n_43);
  g2629 : INR2D0BWP7T port map(A1 => state(0), B1 => n_6, ZN => n_39);
  g2622 : INR2D0BWP7T port map(A1 => state(0), B1 => n_5, ZN => n_36);
  g2633 : INVD0BWP7T port map(I => n_3, ZN => n_4);
  g2635 : IND2D0BWP7T port map(A1 => state(1), B1 => state(2), ZN => n_8);
  g2631 : OR2D0BWP7T port map(A1 => state(2), A2 => state(1), Z => n_7);
  g2632 : IND2D0BWP7T port map(A1 => state(2), B1 => state(1), ZN => n_5);
  g2630 : INR2D0BWP7T port map(A1 => flag_htoa(7), B1 => reset, ZN => n_2);
  g2636 : ND2D0BWP7T port map(A1 => state(2), A2 => state(1), ZN => n_6);
  g2634 : NR2D0BWP7T port map(A1 => flag_htoa(3), A2 => flag_htoa(4), ZN => n_3);
  g2637 : INVD0BWP7T port map(I => flag_htoa(1), ZN => n_1);
  g2638 : INVD0BWP7T port map(I => flag_htoa(6), ZN => n_0);
  g2 : INR3D0BWP7T port map(A1 => n_71, B1 => flag_htoa(7), B2 => reset, ZN => n_156);

end synthesised;
