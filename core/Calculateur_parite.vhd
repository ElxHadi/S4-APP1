----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.05.2025 21:13:19
-- Design Name: 
-- Module Name: Calculateur_parite - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Calculateur_parite is
    Port ( data_in : in STD_LOGIC_VECTOR (3 downto 0);
           parity_sel : in STD_LOGIC;
           parity_bit : out STD_LOGIC);
end Calculateur_parite;

architecture Behavioral of Calculateur_parite is
begin

parity_bit <= (data_in(3) xor data_in(2) xor data_in(1) xor data_in(0)) xor parity_sel;

end Behavioral;
