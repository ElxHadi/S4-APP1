library IEEE;
  use IEEE.STD_LOGIC_1164.all;
  use IEEE.NUMERIC_STD.all;

entity bin_2_dual_bcd_ns is
  port (
    a : in  STD_LOGIC_VECTOR(3 downto 0);
    D : out STD_LOGIC_VECTOR(3 downto 0);
    U : out STD_LOGIC_VECTOR(3 downto 0)
  );
end entity;

architecture Behavioral of bin_2_dual_bcd_ns is
begin
  process (a)
  begin
    case to_integer(unsigned(a)) is
      -- For a <= 9: D=0, U=a
      when 0 to 9 =>
        D <= "0000";
        U <= a;
      -- For a >= 10: D=1, U=a-10
      when others =>
        D <= "0001";
        U <= std_logic_vector(unsigned(a) - 10);
    end case;
  end process;
end architecture;
