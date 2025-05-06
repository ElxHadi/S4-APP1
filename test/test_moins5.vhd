-- filepath: /home/elxhadi/Documents/uni/s4/app1/S4-APP1/test_moins5.vhd
library IEEE;
  use IEEE.STD_LOGIC_1164.all;
  use IEEE.NUMERIC_STD.all;
  use std.textio.all; -- Add this package for string conversion

entity tb_moins5 is
end entity;

architecture sim of tb_moins5 is
  signal a : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
  signal y : STD_LOGIC_VECTOR(3 downto 0);

  component Moins5
    port (
      a : in  STD_LOGIC_VECTOR(3 downto 0);
      y : out STD_LOGIC_VECTOR(3 downto 0)
    );
  end component;

begin
  uut: Moins5 port map (a => a, y => y);

  process
    variable expected_y : STD_LOGIC_VECTOR(3 downto 0);
  begin
    -- Test all 16 input combinations
    a <= "0000";
    wait for 10 ns;
    expected_y := std_logic_vector(to_unsigned(- 5, 4));
    assert y = expected_y report "Error: a=0000, y=" severity ERROR;

    a <= "0001";
    wait for 10 ns;
    expected_y := std_logic_vector(to_unsigned(- 4, 4));
    assert y = expected_y report "Error: a=0001, y=" severity ERROR;

    a <= "0010";
    wait for 10 ns;
    expected_y := std_logic_vector(to_unsigned(- 3, 4));
    assert y = expected_y report "Error: a=0010, y=" severity ERROR;

    a <= "0011";
    wait for 10 ns;
    expected_y := std_logic_vector(to_unsigned(- 2, 4));
    assert y = expected_y report "Error: a=0011, y=" severity ERROR;

    a <= "0100";
    wait for 10 ns;
    expected_y := std_logic_vector(to_unsigned(- 1, 4));
    assert y = expected_y report "Error: a=0100, y=" severity ERROR;

    a <= "0101";
    wait for 10 ns;
    expected_y := std_logic_vector(to_unsigned(0, 4));
    assert y = expected_y report "Error: a=0101, y=" severity ERROR;

    a <= "0110";
    wait for 10 ns;
    expected_y := std_logic_vector(to_unsigned(1, 4));
    assert y = expected_y report "Error: a=0110, y=" severity ERROR;

    a <= "0111";
    wait for 10 ns;
    expected_y := std_logic_vector(to_unsigned(2, 4));
    assert y = expected_y report "Error: a=0111, y=" severity ERROR;

    a <= "1000";
    wait for 10 ns;
    expected_y := std_logic_vector(to_unsigned(3, 4));
    assert y = expected_y report "Error: a=1000, y=" severity ERROR;

    a <= "1001";
    wait for 10 ns;
    expected_y := std_logic_vector(to_unsigned(4, 4));
    assert y = expected_y report "Error: a=1001, y=" severity ERROR;

    a <= "1010";
    wait for 10 ns;
    expected_y := std_logic_vector(to_unsigned(5, 4));
    assert y = expected_y report "Error: a=1010, y=" severity ERROR;

    a <= "1011";
    wait for 10 ns;
    expected_y := std_logic_vector(to_unsigned(6, 4));
    assert y = expected_y report "Error: a=1011, y=" severity ERROR;

    a <= "1100";
    wait for 10 ns;
    expected_y := std_logic_vector(to_unsigned(7, 4));
    assert y = expected_y report "Error: a=1100, y=" severity ERROR;

    a <= "1101";
    wait for 10 ns;
    expected_y := std_logic_vector(to_unsigned(8, 4));
    assert y = expected_y report "Error: a=1101, y=" severity ERROR;

    a <= "1110";
    wait for 10 ns;
    expected_y := std_logic_vector(to_unsigned(9, 4));
    assert y = expected_y report "Error: a=1110, y=" severity ERROR;

    a <= "1111";
    wait for 10 ns;
    expected_y := std_logic_vector(to_unsigned(10, 4));
    assert y = expected_y report "Error: a=1111, y=" severity ERROR;

    wait;
  end process;
end architecture;
