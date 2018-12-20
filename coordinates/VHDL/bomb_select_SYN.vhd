
library ieee;
use ieee.std_logic_1164.all;
--library tcb018gbwp7t;
--use tcb018gbwp7t.all;

architecture synthesised of bomb_select is

  component DFKCNQD1BWP7T
    port(CP, CN, D : in std_logic; Q : out std_logic);
  end component;

  component MOAI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component AN2D4BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component IND2D1BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component INR2XD0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component CKAN2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component INVD1BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component DFKCND1BWP7T
    port(CP, CN, D : in std_logic; Q, QN : out std_logic);
  end component;

  signal state : std_logic_vector(2 downto 0);
  signal n_0, n_1, n_4, n_7, n_8 : std_logic;
  signal n_9, n_10, n_11 : std_logic;

begin

  state_reg_2 : DFKCNQD1BWP7T port map(CP => clk, CN => n_11, D => n_10, Q => state(2));
  g311 : MOAI22D0BWP7T port map(A1 => n_9, A2 => state(2), B1 => n_9, B2 => state(2), ZN => n_10);
  g312 : MOAI22D0BWP7T port map(A1 => state(1), A2 => n_7, B1 => state(1), B2 => n_7, ZN => n_8);
  g316 : AN2D4BWP7T port map(A1 => n_4, A2 => state(1), Z => bombno(3));
  g314 : IND2D1BWP7T port map(A1 => n_7, B1 => state(1), ZN => n_9);
  g317 : AN2D4BWP7T port map(A1 => n_4, A2 => n_0, Z => bombno(2));
  g315 : AN2D4BWP7T port map(A1 => n_1, A2 => state(1), Z => bombno(1));
  g313 : AN2D4BWP7T port map(A1 => n_1, A2 => n_0, Z => bombno(0));
  g320 : IND2D1BWP7T port map(A1 => startbomb, B1 => state(0), ZN => n_7);
  g318 : INR2XD0BWP7T port map(A1 => state(0), B1 => state(2), ZN => n_1);
  g319 : CKAN2D1BWP7T port map(A1 => state(2), A2 => state(0), Z => n_4);
  state_reg_0 : DFKCNQD1BWP7T port map(CP => clk, CN => startbomb, D => n_11, Q => state(0));
  g323 : INVD1BWP7T port map(I => reset, ZN => n_11);
  state_reg_1 : DFKCND1BWP7T port map(CP => clk, CN => n_11, D => n_8, Q => state(1), QN => n_0);

end synthesised;
