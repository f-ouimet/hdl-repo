library ieee;
use ieee.std_logic_1164.all;

entity tb_test is
end tb_test;

architecture behavior of tb_test is
  -- Component declaration for the unit under test (UUT)
  component test
    port (
      a : in std_logic;
      b : in std_logic;
      f : out std_logic
    );
  end component;

  -- Signals to connect to UUT
  signal a : std_logic := '0';
  signal b : std_logic := '0';
  signal f : std_logic;

begin
  -- Instantiate the Unit Under Test (UUT)
  uut: test
    port map (
      a => a,
      b => b,
      f => f
    );

  -- Test process
  stim_proc: process
  begin
    -- Apply test vectors
    a <= '0'; b <= '0';  -- Expect f = '0'
    wait for 10 ns;
    
    a <= '0'; b <= '1';  -- Expect f = '0'
    wait for 10 ns;
    
    a <= '1'; b <= '0';  -- Expect f = '0'
    wait for 10 ns;
    
    a <= '1'; b <= '1';  -- Expect f = '1'
    wait for 10 ns;
    
    -- End simulation
    wait;
  end process;
end behavior;
