----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.05.2025 09:12:14
-- Design Name: 
-- Module Name: Checker - Behavioral
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

entity Checker is
    Port ( V1 : in STD_LOGIC;
           P1 : in STD_LOGIC_VECTOR (2 downto 0);
           V2 : in STD_LOGIC;
           P2 : in STD_LOGIC_VECTOR (2 downto 0);
           Erreur : out STD_LOGIC);
end Checker;

architecture Behavioral of Checker is

    signal intern1 : std_logic_vector(1 downto 0);
    signal intern2 : std_logic_vector(1 downto 0);

begin

    intern1(0) <= NOT(P1(2)) AND NOT(P1(1)) AND NOT(P1(0));
    intern1(1) <= P2(2) AND P2(1) AND P2(0);
    intern2(0) <= V1 AND V2;
    intern2(1) <= intern1(1) OR intern1(0);
    Erreur <= NOT(intern2(1) OR intern2(0));

end Behavioral;
