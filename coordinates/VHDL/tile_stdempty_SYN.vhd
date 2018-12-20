
library ieee;
use ieee.std_logic_1164.all;
--library tcb018gbwp7t;
--use tcb018gbwp7t.all;

architecture synthesised of tile_stdempty is

  component INR3D0BWP7T
    port(A1, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component AOI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component INVD4BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component EDFQD0BWP7T
    port(CP, D, E : in std_logic; Q : out std_logic);
  end component;

  component TIELBWP7T
    port(ZN : out std_logic);
  end component;

  component TIEHBWP7T
    port(Z : out std_logic);
  end component;

  signal logic_1_1_net, n_0, n_1, n_2 : std_logic;

begin

  g117 : INR3D0BWP7T port map(A1 => expl, B1 => reset, B2 => n_1, ZN => n_2);
  g118 : AOI21D0BWP7T port map(A1 => xlethal, A2 => ylethal, B => n_0, ZN => n_1);
  drc_bufs121 : INVD4BWP7T port map(I => n_0, ZN => tiletype(0));
  state_reg : EDFQD0BWP7T port map(CP => clk, D => n_2, E => logic_1_1_net, Q => n_0);
  tie_0_cell : TIELBWP7T port map(ZN => tiletype(1));
  tie_1_cell : TIEHBWP7T port map(Z => logic_1_1_net);

end synthesised;
