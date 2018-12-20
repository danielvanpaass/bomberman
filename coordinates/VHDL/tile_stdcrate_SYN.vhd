
library ieee;
use ieee.std_logic_1164.all;
--library tcb018gbwp7t;
--use tcb018gbwp7t.all;

architecture synthesised of tile_stdcrate is

  component NR2XD0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component AOI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component AOI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component AN2D4BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component ND3D0BWP7T
    port(A1, A2, A3 : in std_logic; ZN : out std_logic);
  end component;

  component ND2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component INVD0BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component BUFFD4BWP7T
    port(I : in std_logic; Z : out std_logic);
  end component;

  component DFD1BWP7T
    port(CP, D : in std_logic; Q, QN : out std_logic);
  end component;

  signal state : std_logic_vector(1 downto 0);
  signal n_0, n_1, n_2, n_3, n_5 : std_logic;
  signal n_6, n_8, n_9 : std_logic;

begin

  g186 : NR2XD0BWP7T port map(A1 => n_8, A2 => reset, ZN => n_9);
  g188 : AOI22D0BWP7T port map(A1 => tiletype(0), A2 => n_5, B1 => state(0), B2 => n_1, ZN => n_8);
  g187 : AOI21D0BWP7T port map(A1 => n_3, A2 => n_5, B => reset, ZN => n_6);
  g190 : AN2D4BWP7T port map(A1 => n_0, A2 => n_2, Z => tiletype(1));
  g189 : ND3D0BWP7T port map(A1 => expl, A2 => xlethal, A3 => ylethal, ZN => n_5);
  g191 : ND2D1BWP7T port map(A1 => state(0), A2 => expl, ZN => n_3);
  g195 : INVD0BWP7T port map(I => expl, ZN => n_1);
  g193 : BUFFD4BWP7T port map(I => state(1), Z => tiletype(0));
  state_reg_0 : DFD1BWP7T port map(CP => clk, D => n_6, Q => state(0), QN => n_2);
  state_reg_1 : DFD1BWP7T port map(CP => clk, D => n_9, Q => state(1), QN => n_0);

end synthesised;
