----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.05.2025 22:00:54
-- Design Name: 
-- Module Name: Moins_5 - Behavioral
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

entity Moins_5 is
    Port ( Entree : in STD_LOGIC_VECTOR (3 downto 0);
           Moins5 : out STD_LOGIC_VECTOR (3 downto 0));
end Moins_5;

architecture Behavioral of Moins_5 is

COMPONENT Add4Bits
    Port ( Ci : in STD_LOGIC;
           X4 : in STD_LOGIC_VECTOR (3 downto 0);
           Y4 : in STD_LOGIC_VECTOR (3 downto 0);
           S4 : out STD_LOGIC_VECTOR (3 downto 0);
           Co : out STD_LOGIC);
end COMPONENT;

signal restant_Co : STD_LOGIC;

begin

Moins_cinq: Add4Bits
    PORT MAP(
        Ci => '0',
        X4 => Entree,
        Y4 => "1011", -- -5
        S4 => Moins5,
        Co => restant_Co
    );

end Behavioral;
