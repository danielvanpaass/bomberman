
library ieee;
use ieee.std_logic_1164.all;
--library tcb018gbwp7t;
--use tcb018gbwp7t.all;

architecture synthesised of xy_convert is

  component CKAN2D4BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component AN3D4BWP7T
    port(A1, A2, A3 : in std_logic; Z : out std_logic);
  end component;

  component AN2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component NR2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component INR2D0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component INVD0BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component CKAN2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  signal n_1, n_5, n_7, n_9, n_10 : std_logic;
  signal n_14, n_15, n_17, n_21, n_23 : std_logic;
  signal n_24, n_28, n_31, n_33, n_46 : std_logic;

begin

  g529 : CKAN2D4BWP7T port map(A1 => n_46, A2 => n_33, Z => x6);
  g528 : CKAN2D4BWP7T port map(A1 => n_46, A2 => x_in(0), Z => x7);
  g530 : CKAN2D4BWP7T port map(A1 => n_31, A2 => n_33, Z => x4);
  g533 : CKAN2D4BWP7T port map(A1 => n_31, A2 => x_in(0), Z => x5);
  g531 : CKAN2D4BWP7T port map(A1 => n_28, A2 => n_21, Z => x8);
  g534 : CKAN2D4BWP7T port map(A1 => n_28, A2 => x_in(1), Z => x10);
  g540 : CKAN2D4BWP7T port map(A1 => n_24, A2 => n_14, Z => x1);
  g537 : CKAN2D4BWP7T port map(A1 => n_23, A2 => n_15, Z => x2);
  g547 : CKAN2D4BWP7T port map(A1 => n_24, A2 => n_23, Z => x3);
  g532 : AN3D4BWP7T port map(A1 => n_24, A2 => x_in(3), A3 => n_21, Z => x9);
  g541 : CKAN2D4BWP7T port map(A1 => n_5, A2 => n_17, Z => y2);
  g542 : CKAN2D4BWP7T port map(A1 => n_7, A2 => n_17, Z => y1);
  g546 : CKAN2D4BWP7T port map(A1 => n_15, A2 => n_14, Z => x0);
  g549 : CKAN2D4BWP7T port map(A1 => n_10, A2 => n_17, Z => y0);
  g552 : AN2D1BWP7T port map(A1 => n_14, A2 => x_in(2), Z => n_31);
  g543 : AN2D1BWP7T port map(A1 => n_15, A2 => x_in(3), Z => n_28);
  g536 : AN3D4BWP7T port map(A1 => n_9, A2 => y_in(1), A3 => y_in(0), Z => y7);
  g539 : CKAN2D4BWP7T port map(A1 => n_10, A2 => n_9, Z => y4);
  g548 : CKAN2D4BWP7T port map(A1 => n_7, A2 => n_9, Z => y5);
  g550 : CKAN2D4BWP7T port map(A1 => n_5, A2 => n_9, Z => y6);
  g535 : AN3D4BWP7T port map(A1 => n_17, A2 => y_in(1), A3 => y_in(0), Z => y3);
  g538 : CKAN2D4BWP7T port map(A1 => n_10, A2 => n_1, Z => y8);
  g551 : CKAN2D4BWP7T port map(A1 => n_7, A2 => n_1, Z => y9);
  g545 : CKAN2D4BWP7T port map(A1 => n_5, A2 => n_1, Z => y10);
  g557 : NR2D0BWP7T port map(A1 => n_21, A2 => x_in(3), ZN => n_23);
  g554 : NR2D0BWP7T port map(A1 => n_33, A2 => x_in(2), ZN => n_24);
  g561 : INR2D0BWP7T port map(A1 => y_in(1), B1 => y_in(0), ZN => n_5);
  g559 : INR2D0BWP7T port map(A1 => y_in(3), B1 => y_in(2), ZN => n_1);
  g558 : INR2D0BWP7T port map(A1 => y_in(2), B1 => y_in(3), ZN => n_9);
  g563 : NR2D0BWP7T port map(A1 => y_in(2), A2 => y_in(3), ZN => n_17);
  g560 : INR2D0BWP7T port map(A1 => y_in(0), B1 => y_in(1), ZN => n_7);
  g556 : NR2D0BWP7T port map(A1 => x_in(1), A2 => x_in(3), ZN => n_14);
  g555 : NR2D0BWP7T port map(A1 => x_in(0), A2 => x_in(2), ZN => n_15);
  g562 : NR2D0BWP7T port map(A1 => y_in(0), A2 => y_in(1), ZN => n_10);
  g565 : INVD0BWP7T port map(I => x_in(0), ZN => n_33);
  g564 : INVD0BWP7T port map(I => x_in(1), ZN => n_21);
  g2 : CKAN2D1BWP7T port map(A1 => x_in(2), A2 => n_23, Z => n_46);

end synthesised;
