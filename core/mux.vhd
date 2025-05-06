library IEEE;
  use IEEE.STD_LOGIC_1164.all;

entity big_mux is
  port (
    err        : in  STD_LOGIC;
    s2         : in  STD_LOGIC;
    BTN        : in  STD_LOGIC_VECTOR(1 downto 0);
    ADC        : in  STD_LOGIC_VECTOR(3 downto 0);
    DZ         : in  STD_LOGIC_VECTOR(3 downto 0);
    Ut_ns      : in  STD_LOGIC_VECTOR(3 downto 0);
    Code_signe : in  STD_LOGIC_VECTOR(3 downto 0);
    Ut_s       : in  STD_LOGIC_VECTOR(3 downto 0);
    AFF0       : out STD_LOGIC_VECTOR(3 downto 0);
    AFF1       : out STD_LOGIC_VECTOR(3 downto 0)
  );
end entity;

architecture Behavioral of big_mux is
  constant E_code          : STD_LOGIC_VECTOR(3 downto 0) := "1110"; -- 'E'
  constant r_code          : STD_LOGIC_VECTOR(3 downto 0) := "1011"; -- 'r'
  constant sign_minus_code : STD_LOGIC_VECTOR(3 downto 0) := "1010"; -- '-' not so sure ?
begin
  process (err, s2, BTN, ADC, DZ, Ut_ns, Code_signe, Ut_s)
  begin
    if (err = '1' or s2 = '1' or BTN = "11") then
      AFF1 <= E_code;
      AFF0 <= r_code;
    elsif (BTN = "00") then
      AFF1 <= DZ;
      AFF0 <= Ut_ns;
    elsif (BTN = "01") then
      AFF1 <= "0000";
      AFF0 <= ADC;
    elsif (BTN = "10") then
      if (Code_signe = "0001") then
        AFF1 <= sign_minus_code;
      else
        AFF1 <= "0000";
      end if;
      AFF0 <= Ut_s;
    else -- Default case (unreachable)
      AFF1 <= "0000";
      AFF0 <= "0000";
    end if;
  end process;
end architecture;
