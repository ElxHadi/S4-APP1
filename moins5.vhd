library IEEE;
  use IEEE.STD_LOGIC_1164.all;

entity Moins5 is
  port (
    a : in  STD_LOGIC_VECTOR(3 downto 0);
    y : out STD_LOGIC_VECTOR(3 downto 0)
  );
end entity;

architecture Behavioral of Moins5 is
  signal B_const : STD_LOGIC_VECTOR(3 downto 0) := "1011"; -- `-5`
  signal Cout    : STD_LOGIC;
begin
  ADDER: entity work.full_adder_4bit
    port map (
      A    => a,
      B    => B_const,
      Cin  => '0',
      S    => y,
      Cout => Cout
    );
end architecture;
