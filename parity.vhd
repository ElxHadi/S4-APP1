library ieee;
  use ieee.std_logic_1164.all;

entity parity_calculator is
  port (
    data_in    : in  STD_LOGIC_VECTOR(3 downto 0);
    parity_sel : in  STD_LOGIC;
    parity_bit : out STD_LOGIC
  );
end entity;

architecture Behavioral of parity_calculator is
begin
  parity_bit <= (data_in(3) xor data_in(2) xor data_in(1) xor data_in(0)) xor parity_sel;
end architecture;