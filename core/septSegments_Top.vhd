----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.05.2025 00:20:46
-- Design Name: 
-- Module Name: septSegments_Top - Behavioral
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

entity septSegments_Top is
generic (const_CLK_MHz: integer := 100); -- horloge en MHz, typique 100 MHz
    Port ( clk : in STD_LOGIC; -- horloge systeme, typique 100 MHz (preciser par le constante)
        i_AFF0 : in STD_LOGIC_VECTOR (3 downto 0); -- donnee a afficher sur 4 bits : chiffre hexa position 0
        i_AFF1 : in STD_LOGIC_VECTOR (3 downto 0); -- donnee a afficher sur 4 bits : chiffre hexa position 1
        o_AFFSSD_Sim : out string(1 to 2);
        o_AFFSSD : out STD_LOGIC_VECTOR (7 downto 0) -- sorties directement adaptees au connecteur PmodSSD
        );
end septSegments_Top;



architecture Behavioral of septSegments_Top is

begin


end Behavioral;
