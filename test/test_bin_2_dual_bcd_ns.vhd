library IEEE;
  use IEEE.STD_LOGIC_1164.all;
  use IEEE.NUMERIC_STD.all;

entity bin_2_dual_bcd_ns_tb is
end entity;

architecture Behavioral of bin_2_dual_bcd_ns_tb is
  component bin_2_dual_bcd_ns
    port (
      a : in  STD_LOGIC_VECTOR(3 downto 0);
      D : out STD_LOGIC_VECTOR(3 downto 0);
      U : out STD_LOGIC_VECTOR(3 downto 0)
    );
  end component;

  signal a : STD_LOGIC_VECTOR(3 downto 0) := "0000";
  signal D : STD_LOGIC_VECTOR(3 downto 0);
  signal U : STD_LOGIC_VECTOR(3 downto 0);

begin
  uut: bin_2_dual_bcd_ns
    port map (
      a => a,
      D => D,
      U => U
    );

  stim_proc: process
  begin
    -- Test cases for a <= 9
    a <= "0000";
    wait for 10 ns;
    assert (D = "0000" and U = "0000") report "Test case 0000 failed" severity error;

    a <= "0001";
    wait for 10 ns;
    assert (D = "0000" and U = "0001") report "Test case 0001 failed" severity error;

    a <= "0010";
    wait for 10 ns;
    assert (D = "0000" and U = "0010") report "Test case 0010 failed" severity error;

    a <= "0011";
    wait for 10 ns;
    assert (D = "0000" and U = "0011") report "Test case 0011 failed" severity error;

    a <= "0100";
    wait for 10 ns;
    assert (D = "0000" and U = "0100") report "Test case 0100 failed" severity error;

    a <= "0101";
    wait for 10 ns;
    assert (D = "0000" and U = "0101") report "Test case 0101 failed" severity error;

    a <= "0110";
    wait for 10 ns;
    assert (D = "0000" and U = "0110") report "Test case 0110 failed" severity error;

    a <= "0111";
    wait for 10 ns;
    assert (D = "0000" and U = "0111") report "Test case 0111 failed" severity error;

    a <= "1000";
    wait for 10 ns;
    assert (D = "0000" and U = "1000") report "Test case 1000 failed" severity error;

    a <= "1001";
    wait for 10 ns;
    assert (D = "0000" and U = "1001") report "Test case 1001 failed" severity error;

    -- Test cases for a >= 10
    a <= "1010";
    wait for 10 ns;
    assert (D = "0001" and U = "0000") report "Test case 1010 failed" severity error;

    a <= "1011";
    wait for 10 ns;
    assert (D = "0001" and U = "0001") report "Test case 1011 failed" severity error;

    a <= "1100";
    wait for 10 ns;
    assert (D = "0001" and U = "0010") report "Test case 1100 failed" severity error;

    a <= "1101";
    wait for 10 ns;
    assert (D = "0001" and U = "0011") report "Test case 1101 failed" severity error;

    a <= "1110";
    wait for 10 ns;
    assert (D = "0001" and U = "0100") report "Test case 1110 failed" severity error;

    a <= "1111";
    wait for 10 ns;
    assert (D = "0001" and U = "0101") report "Test case 1111 failed" severity error;

    wait;
  end process;

end architecture;
