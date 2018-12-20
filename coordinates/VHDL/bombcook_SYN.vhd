
library ieee;
use ieee.std_logic_1164.all;
--library tcb018gbwp7t;
--use tcb018gbwp7t.all;

architecture synthesised of bombcook is

  component DFKCNQD1BWP7T
    port(CP, CN, D : in std_logic; Q : out std_logic);
  end component;

  component CKAN2D4BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component OAI211D1BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component LNQD1BWP7T
    port(EN, D : in std_logic; Q : out std_logic);
  end component;

  component OAI31D0BWP7T
    port(A1, A2, A3, B : in std_logic; ZN : out std_logic);
  end component;

  component ND2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component INVD1BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component BUFFD4BWP7T
    port(I : in std_logic; Z : out std_logic);
  end component;

  component INVD0BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  signal state : std_logic_vector(1 downto 0);
  signal bombxsample : std_logic_vector(3 downto 0);
  signal bombysample : std_logic_vector(3 downto 0);
  signal n_0, n_1, n_3, n_5, n_6 : std_logic;
  signal n_7, n_13 : std_logic;

begin

  state_reg_1 : DFKCNQD1BWP7T port map(CP => clk, CN => n_13, D => n_7, Q => state(1));
  g304 : CKAN2D4BWP7T port map(A1 => state(1), A2 => bombxsample(3), Z => bombx(3));
  g299 : CKAN2D4BWP7T port map(A1 => state(1), A2 => bombxsample(2), Z => bombx(2));
  g298 : CKAN2D4BWP7T port map(A1 => state(1), A2 => bombysample(0), Z => bomby(0));
  state_reg_0 : DFKCNQD1BWP7T port map(CP => clk, CN => n_13, D => n_5, Q => state(0));
  g303 : CKAN2D4BWP7T port map(A1 => state(1), A2 => bombysample(3), Z => bomby(3));
  g300 : CKAN2D4BWP7T port map(A1 => state(1), A2 => bombxsample(0), Z => bombx(0));
  g302 : CKAN2D4BWP7T port map(A1 => state(1), A2 => bombxsample(1), Z => bombx(1));
  g305 : CKAN2D4BWP7T port map(A1 => state(1), A2 => bombysample(2), Z => bomby(2));
  g306 : CKAN2D4BWP7T port map(A1 => state(1), A2 => bombysample(1), Z => bomby(1));
  g315 : OAI211D1BWP7T port map(A1 => state(0), A2 => n_1, B => n_6, C => n_3, ZN => n_7);
  bombysample_reg_0 : LNQD1BWP7T port map(EN => n_6, D => playery(0), Q => bombysample(0));
  bombxsample_reg_0 : LNQD1BWP7T port map(EN => n_6, D => playerx(0), Q => bombxsample(0));
  bombxsample_reg_2 : LNQD1BWP7T port map(EN => n_6, D => playerx(2), Q => bombxsample(2));
  bombysample_reg_3 : LNQD1BWP7T port map(EN => n_6, D => playery(3), Q => bombysample(3));
  bombxsample_reg_3 : LNQD1BWP7T port map(EN => n_6, D => playerx(3), Q => bombxsample(3));
  bombysample_reg_2 : LNQD1BWP7T port map(EN => n_6, D => playery(2), Q => bombysample(2));
  bombxsample_reg_1 : LNQD1BWP7T port map(EN => n_6, D => playerx(1), Q => bombxsample(1));
  bombysample_reg_1 : LNQD1BWP7T port map(EN => n_6, D => playery(1), Q => bombysample(1));
  g316 : OAI31D0BWP7T port map(A1 => n_0, A2 => state(0), A3 => bombdisplay, B => n_3, ZN => n_5);
  g317 : ND2D1BWP7T port map(A1 => n_1, A2 => state(0), ZN => n_6);
  g318 : ND2D1BWP7T port map(A1 => bombdisplay, A2 => expl, ZN => n_3);
  g322 : INVD1BWP7T port map(I => bombdisplay, ZN => n_1);
  g323 : BUFFD4BWP7T port map(I => state(1), Z => bombdisplay);
  g319 : INVD0BWP7T port map(I => bombinit, ZN => n_0);
  g320 : INVD0BWP7T port map(I => reset, ZN => n_13);

end synthesised;
