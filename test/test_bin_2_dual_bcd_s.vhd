library IEEE;
  use IEEE.STD_LOGIC_1164.all;
  use IEEE.NUMERIC_STD.all;

entity tb_bin_2_dual_bcd_s is
end entity;

architecture sim of tb_bin_2_dual_bcd_s is
  signal a_tb       : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
  signal Code_signe : STD_LOGIC_VECTOR(2 downto 0);
  signal Unite_s    : STD_LOGIC_VECTOR(2 downto 0);
begin
  DUT: entity work.bin_2_dual_bcd_s
    port map (
      a          => a_tb,
      Code_signe => Code_signe,
      Unite_s    => Unite_s
    );

  process
  begin
    -- Case 0: a = 0000 (0)
    a_tb <= "0000";
    wait for 10 ns;
    assert Code_signe = "000" and Unite_s = "000"
      report "Case 0: Expected (Code_signe=000, Unite_s=000), Got (" & to_string(Code_signe) & ", " & to_string(Unite_s) & ")"
      severity error;

    -- Case 1: a = 0001 (1)
    a_tb <= "0001";
    wait for 10 ns;
    assert Code_signe = "000" and Unite_s = "001"
      report "Case 1: Expected (Code_signe=000, Unite_s=001), Got (" & to_string(Code_signe) & ", " & to_string(Unite_s) & ")"
      severity error;

    -- Case 2: a = 0010 (2)
    a_tb <= "0010";
    wait for 10 ns;
    assert Code_signe = "000" and Unite_s = "010"
      report "Case 2: Expected (Code_signe=000, Unite_s=010), Got (" & to_string(Code_signe) & ", " & to_string(Unite_s) & ")"
      severity error;

    -- Case 3: a = 0011 (3)
    a_tb <= "0011";
    wait for 10 ns;
    assert Code_signe = "000" and Unite_s = "011"
      report "Case 3: Expected (Code_signe=000, Unite_s=011), Got (" & to_string(Code_signe) & ", " & to_string(Unite_s) & ")"
      severity error;

    -- Case 4: a = 0100 (4)
    a_tb <= "0100";
    wait for 10 ns;
    assert Code_signe = "000" and Unite_s = "100"
      report "Case 4: Expected (Code_signe=000, Unite_s=100), Got (" & to_string(Code_signe) & ", " & to_string(Unite_s) & ")"
      severity error;

    -- Case 5: a = 0101 (5)
    a_tb <= "0101";
    wait for 10 ns;
    assert Code_signe = "000" and Unite_s = "101"
      report "Case 5: Expected (Code_signe=000, Unite_s=101), Got (" & to_string(Code_signe) & ", " & to_string(Unite_s) & ")"
      severity error;

    -- Case 6: a = 0110 (6)
    a_tb <= "0110";
    wait for 10 ns;
    assert Code_signe = "000" and Unite_s = "110"
      report "Case 6: Expected (Code_signe=000, Unite_s=110), Got (" & to_string(Code_signe) & ", " & to_string(Unite_s) & ")"
      severity error;

    -- Case 7: a = 0111 (7)
    a_tb <= "0111";
    wait for 10 ns;
    assert Code_signe = "000" and Unite_s = "111"
      report "Case 7: Expected (Code_signe=000, Unite_s=111), Got (" & to_string(Code_signe) & ", " & to_string(Unite_s) & ")"
      severity error;

    -- Case 8: a = 1000 (-8)
    a_tb <= "1000";
    wait for 10 ns;
    assert Code_signe = "001" and Unite_s = "000"
      report "Case 8: Expected (Code_signe=001, Unite_s=000), Got (" & to_string(Code_signe) & ", " & to_string(Unite_s) & ")"
      severity error;

    -- Case 9: a = 1001 (-7)
    a_tb <= "1001";
    wait for 10 ns;
    assert Code_signe = "001" and Unite_s = "111"
      report "Case 9: Expected (Code_signe=001, Unite_s=111), Got (" & to_string(Code_signe) & ", " & to_string(Unite_s) & ")"
      severity error;

    -- Case 10: a = 1010 (-6)
    a_tb <= "1010";
    wait for 10 ns;
    assert Code_signe = "001" and Unite_s = "110"
      report "Case 10: Expected (Code_signe=001, Unite_s=110), Got (" & to_string(Code_signe) & ", " & to_string(Unite_s) & ")"
      severity error;

    -- Case 11: a = 1011 (-5)
    a_tb <= "1011";
    wait for 10 ns;
    assert Code_signe = "001" and Unite_s = "101"
      report "Case 11: Expected (Code_signe=001, Unite_s=101), Got (" & to_string(Code_signe) & ", " & to_string(Unite_s) & ")"
      severity error;

    -- Case 12: a = 1100 (-4)
    a_tb <= "1100";
    wait for 10 ns;
    assert Code_signe = "001" and Unite_s = "100"
      report "Case 12: Expected (Code_signe=001, Unite_s=100), Got (" & to_string(Code_signe) & ", " & to_string(Unite_s) & ")"
      severity error;

    -- Case 13: a = 1101 (-3)
    a_tb <= "1101";
    wait for 10 ns;
    assert Code_signe = "001" and Unite_s = "011"
      report "Case 13: Expected (Code_signe=001, Unite_s=011), Got (" & to_string(Code_signe) & ", " & to_string(Unite_s) & ")"
      severity error;

    -- Case 14: a = 1110 (-2)
    a_tb <= "1110";
    wait for 10 ns;
    assert Code_signe = "001" and Unite_s = "010"
      report "Case 14: Expected (Code_signe=001, Unite_s=010), Got (" & to_string(Code_signe) & ", " & to_string(Unite_s) & ")"
      severity error;

    -- Case 15: a = 1111 (-1)
    a_tb <= "1111";
    wait for 10 ns;
    assert Code_signe = "001" and Unite_s = "001"
      report "Case 15: Expected (Code_signe=001, Unite_s=001), Got (" & to_string(Code_signe) & ", " & to_string(Unite_s) & ")"
      severity error;

    wait;
  end process;
end architecture;
