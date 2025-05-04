library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity tb_parity_calculator is
end entity;

architecture sim of tb_parity_calculator is
  signal data_in    : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
  signal parity_sel : STD_LOGIC                    := '0';
  signal parity_bit : STD_LOGIC;

  component parity_calculator
    port (
      data_in    : in  STD_LOGIC_VECTOR(3 downto 0);
      parity_sel : in  STD_LOGIC;
      parity_bit : out STD_LOGIC
    );
  end component;

begin
  uut: parity_calculator port map (data_in, parity_sel, parity_bit);

  process
  begin
    parity_sel <= '0'; -- parity à pair
    data_in <= "0000";
    wait for 10 ns;
    assert parity_bit = '0' report "Error Test 1 (0000/pair)" severity ERROR;
    data_in <= "0001";
    wait for 10 ns;
    assert parity_bit = '1' report "Error Test 2 (0001/pair)" severity ERROR;
    data_in <= "0010";
    wait for 10 ns;
    assert parity_bit = '1' report "Error Test 3 (0010/pair)" severity ERROR;
    data_in <= "0011";
    wait for 10 ns;
    assert parity_bit = '0' report "Error Test 4 (0011/pair)" severity ERROR;
    data_in <= "0100";
    wait for 10 ns;
    assert parity_bit = '1' report "Error Test 5 (0100/pair)" severity ERROR;
    data_in <= "0101";
    wait for 10 ns;
    assert parity_bit = '0' report "Error Test 6 (0101/pair)" severity ERROR;
    data_in <= "0110";
    wait for 10 ns;
    assert parity_bit = '0' report "Error Test 7 (0110/pair)" severity ERROR;
    data_in <= "0111";
    wait for 10 ns;
    assert parity_bit = '1' report "Error Test 8 (0111/pair)" severity ERROR;
    data_in <= "1000";
    wait for 10 ns;
    assert parity_bit = '1' report "Error Test 9 (1000/pair)" severity ERROR;
    data_in <= "1001";
    wait for 10 ns;
    assert parity_bit = '0' report "Error Test 10 (1001/pair)" severity ERROR;
    data_in <= "1010";
    wait for 10 ns;
    assert parity_bit = '0' report "Error Test 11 (1010/pair)" severity ERROR;
    data_in <= "1011";
    wait for 10 ns;
    assert parity_bit = '1' report "Error Test 12 (1011/pair)" severity ERROR;
    data_in <= "1100";
    wait for 10 ns;
    assert parity_bit = '0' report "Error Test 13 (1100/pair)" severity ERROR;
    data_in <= "1101";
    wait for 10 ns;
    assert parity_bit = '1' report "Error Test 14 (1101/pair)" severity ERROR;
    data_in <= "1110";
    wait for 10 ns;
    assert parity_bit = '1' report "Error Test 15 (1110/pair)" severity ERROR;
    data_in <= "1111";
    wait for 10 ns;
    assert parity_bit = '0' report "Error Test 16 (1111/pair)" severity ERROR;

    parity_sel <= '1'; -- parity impair
    data_in <= "0000";
    wait for 10 ns;
    assert parity_bit = '1' report "Error Test 17 (0000/impair)" severity ERROR;
    data_in <= "0001";
    wait for 10 ns;
    assert parity_bit = '0' report "Error Test 18 (0001/impair)" severity ERROR;
    data_in <= "0010";
    wait for 10 ns;
    assert parity_bit = '0' report "Error Test 19 (0010/impair)" severity ERROR;
    data_in <= "0011";
    wait for 10 ns;
    assert parity_bit = '1' report "Error Test 20 (0011/impair)" severity ERROR;
    data_in <= "0100";
    wait for 10 ns;
    assert parity_bit = '0' report "Error Test 21 (0100/impair)" severity ERROR;
    data_in <= "0101";
    wait for 10 ns;
    assert parity_bit = '1' report "Error Test 22 (0101/impair)" severity ERROR;
    data_in <= "0110";
    wait for 10 ns;
    assert parity_bit = '1' report "Error Test 23 (0110/impair)" severity ERROR;
    data_in <= "0111";
    wait for 10 ns;
    assert parity_bit = '0' report "Error Test 24 (0111/impair)" severity ERROR;
    data_in <= "1000";
    wait for 10 ns;
    assert parity_bit = '0' report "Error Test 25 (1000/impair)" severity ERROR;
    data_in <= "1001";
    wait for 10 ns;
    assert parity_bit = '1' report "Error Test 26 (1001/impair)" severity ERROR;
    data_in <= "1010";
    wait for 10 ns;
    assert parity_bit = '1' report "Error Test 27 (1010/impair)" severity ERROR;
    data_in <= "1011";
    wait for 10 ns;
    assert parity_bit = '0' report "Error Test 28 (1011/impair)" severity ERROR;
    data_in <= "1100";
    wait for 10 ns;
    assert parity_bit = '1' report "Error Test 29 (1100/impair)" severity ERROR;
    data_in <= "1101";
    wait for 10 ns;
    assert parity_bit = '0' report "Error Test 30 (1101/impair)" severity ERROR;
    data_in <= "1110";
    wait for 10 ns;
    assert parity_bit = '0' report "Error Test 31 (1110/impair)" severity ERROR;
    data_in <= "1111";
    wait for 10 ns;
    assert parity_bit = '1' report "Error Test 32 (1111/impair)" severity ERROR;

    wait;
  end process;
end architecture;
