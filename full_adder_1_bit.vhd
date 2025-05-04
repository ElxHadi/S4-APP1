library IEEE;
  use IEEE.STD_LOGIC_1164.all;

entity full_adder_1bit is
  port (
    A    : in  STD_LOGIC;
    B    : in  STD_LOGIC;
    Cin  : in  STD_LOGIC;
    S    : out STD_LOGIC;
    Cout : out STD_LOGIC
  );
end entity;

architecture Behavioral of full_adder_1bit is
begin
  S    <= A xor B xor Cin;
  Cout <= (A and B) or (A and Cin) or (B and Cin);
end architecture;
