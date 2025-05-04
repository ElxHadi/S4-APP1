library IEEE;
  use IEEE.STD_LOGIC_1164.all;

entity decoder_3to8 is
  port (
    A : in  STD_LOGIC_VECTOR(2 downto 0); -- 3-bit input (A2, A1, A0)
    Y : out STD_LOGIC_VECTOR(7 downto 0)  -- 8-bit output (D7 to D0)
  );
end entity;

architecture Behavioral of decoder_3to8 is
begin
  process (A)
  begin
    case A is
      when "000" => Y <= "00000001";
      when "001" => Y <= "00000010";
      when "010" => Y <= "00000100";
      when "011" => Y <= "00001000";
      when "100" => Y <= "00010000";
      when "101" => Y <= "00100000";
      when "110" => Y <= "01000000";
      when "111" => Y <= "10000000";
      when others => Y <= "00000000"; -- Handle invalid inputs (X, U, Z, etc.)
    end case;
  end process;
end architecture;
