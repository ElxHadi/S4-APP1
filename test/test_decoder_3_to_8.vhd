library IEEE;
  use IEEE.STD_LOGIC_1164.all;

entity decoder_3to8_tb is
end entity;

architecture Behavioral of decoder_3to8_tb is
  component decoder_3to8
    port (
      A : in  STD_LOGIC_VECTOR(2 downto 0);
      Y : out STD_LOGIC_VECTOR(7 downto 0)
    );
  end component;

  signal A : STD_LOGIC_VECTOR(2 downto 0) := "000";
  signal Y : STD_LOGIC_VECTOR(7 downto 0);

begin
  uut: decoder_3to8
    port map (
      A => A,
      Y => Y
    );

  stim_proc: process
  begin
    A <= "000";
    wait for 10 ns;
    assert (Y = "00000001") report "Test case 000 failed" severity error;

    A <= "001";
    wait for 10 ns;
    assert (Y = "00000010") report "Test case 001 failed" severity error;

    A <= "010";
    wait for 10 ns;
    assert (Y = "00000100") report "Test case 010 failed" severity error;

    A <= "011";
    wait for 10 ns;
    assert (Y = "00001000") report "Test case 011 failed" severity error;

    A <= "100";
    wait for 10 ns;
    assert (Y = "00010000") report "Test case 100 failed" severity error;

    A <= "101";
    wait for 10 ns;
    assert (Y = "00100000") report "Test case 101 failed" severity error;

    A <= "110";
    wait for 10 ns;
    assert (Y = "01000000") report "Test case 110 failed" severity error;

    A <= "111";
    wait for 10 ns;
    assert (Y = "10000000") report "Test case 111 failed" severity error;

    -- Test invalid inputs
    A <= "XXX";
    wait for 10 ns;
    assert (Y = "00000000") report "Test case XXX failed" severity error;

    A <= "ZZZ";
    wait for 10 ns;
    assert (Y = "00000000") report "Test case ZZZ failed" severity error;

    wait;
  end process;

end architecture;
