
library ieee;
use ieee.std_logic_1164.all;
--library tcb018gbwp7t;
--use tcb018gbwp7t.all;

architecture synthesised of selector is

  component CKAN2D4BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component INVD0BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  signal n_0 : std_logic;

begin

  g17 : CKAN2D4BWP7T port map(A1 => b, A2 => n_0, Z => p1);
  g18 : CKAN2D4BWP7T port map(A1 => b, A2 => p, Z => p2);
  g19 : INVD0BWP7T port map(I => p, ZN => n_0);

end synthesised;
