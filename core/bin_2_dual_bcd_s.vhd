library IEEE;
  use IEEE.STD_LOGIC_1164.all;
  use IEEE.NUMERIC_STD.all;

entity bin_2_dual_bcd_s is
  port (
    a          : in  STD_LOGIC_VECTOR(3 downto 0);
    Code_signe : out STD_LOGIC_VECTOR(2 downto 0);
    Unite_s    : out STD_LOGIC_VECTOR(2 downto 0)
  );
end entity;

architecture Behavioral of bin_2_dual_bcd_s is
  signal a_signed : signed(3 downto 0);
  constant SIGN_NEGATIVE : STD_LOGIC_VECTOR(2 downto 0) := "001";
  constant SIGN_POSITIVE : STD_LOGIC_VECTOR(2 downto 0) := "000";
begin
  a_signed <= signed(a);

  process (a_signed)
    variable magnitude : unsigned(3 downto 0);
  begin
    case a_signed(3) is
      when '1' =>
        Code_signe <= SIGN_NEGATIVE;
        magnitude := unsigned(- a_signed); -- Compute absolute value (~a_signed + 1)
      when others =>
        Code_signe <= SIGN_POSITIVE;
        magnitude := unsigned(a_signed);
    end case;
    -- Ps: wraps 8 to 000
    Unite_s <= std_logic_vector(magnitude(2 downto 0));
  end process;
end architecture;
