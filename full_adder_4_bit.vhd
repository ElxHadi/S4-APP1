library IEEE;
  use IEEE.STD_LOGIC_1164.all;
  use IEEE.NUMERIC_STD.all;

entity full_adder_4bit is
  port (
    A    : in  STD_LOGIC_VECTOR(3 downto 0);
    B    : in  STD_LOGIC_VECTOR(3 downto 0);
    Cin  : in  STD_LOGIC;
    S    : out STD_LOGIC_VECTOR(3 downto 0);
    Cout : out STD_LOGIC
  );
end entity;

architecture Behavioral of full_adder_4bit is

  signal carry : STD_LOGIC_VECTOR(4 downto 0);
begin

  carry(0) <= Cin;

  gen_adders: for i in 0 to 3 generate
    full_adder: entity work.full_adder_1bit
      port map (
        A    => A(i),
        B    => B(i),
        Cin  => carry(i),
        S    => S(i),
        Cout => carry(i + 1)
      );
  end generate;

  Cout <= carry(4);
end architecture;
