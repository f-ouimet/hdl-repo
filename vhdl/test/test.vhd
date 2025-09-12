library ieee;
use ieee.std_logic_1164.all;

entity test is
  port (
    a : in std_logic;
    b : in std_logic;
    f : out std_logic
  );
end test;

architecture rtl of test is
  signal and_g : std_logic;
begin
  and_g <= a and b;
  f <= and_g;
end architecture rtl;
