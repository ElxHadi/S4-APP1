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
    Port ( ADCth : in STD_LOGIC_VECTOR (11 downto 0);
           Erreur : out STD_LOGIC);
end Checker;

architecture Behavioral of Checker is
    
    signal A0A1 : std_logic;
    signal A0A2 : std_logic;
    signal A0A3 : std_logic;
    signal A0A4 : std_logic;
    signal A0A5 : std_logic;
    signal A0A6 : std_logic;
    signal A0A7 : std_logic;
    signal A0A8 : std_logic;
    signal A0A9 : std_logic;
    signal A0A10 : std_logic;
    signal A0A11 : std_logic;
    
    signal VA1 : std_logic;
    signal VA2 : std_logic;
    signal VA3 : std_logic;
    signal VA4 : std_logic;
    signal VA5 : std_logic;
    signal VA6 : std_logic;
    signal VA7 : std_logic;
    signal VA8 : std_logic;
    signal VA9 : std_logic;
    signal VA10 : std_logic;
    signal VA11 : std_logic;

begin

    A0A1 <= ADCth(0) AND ADCth(1);
    A0A2 <= ADCth(1) AND ADCth(2);
    A0A3 <= ADCth(2) AND ADCth(3);
    A0A4 <= ADCth(3) AND ADCth(4);
    A0A5 <= ADCth(4) AND ADCth(5);
    A0A6 <= ADCth(5) AND ADCth(6);
    A0A7 <= ADCth(6) AND ADCth(7);
    A0A8 <= ADCth(7) AND ADCth(8);
    A0A9 <= ADCth(8) AND ADCth(9);
    A0A10 <= ADCth(9) AND ADCth(10);
    A0A11 <= ADCth(10) AND ADCth(11);
    
    VA1 <= ADCth(1) AND NOT(A0A1);
    VA2 <= ADCth(2) AND NOT(A0A2);
    VA3 <= ADCth(3) AND NOT(A0A3);
    VA4 <= ADCth(4) AND NOT(A0A4);
    VA5 <= ADCth(5) AND NOT(A0A5);
    VA6 <= ADCth(6) AND NOT(A0A6);
    VA7 <= ADCth(7) AND NOT(A0A7);
    VA8 <= ADCth(8) AND NOT(A0A8);
    VA9 <= ADCth(9) AND NOT(A0A9);
    VA10 <= ADCth(10) AND NOT(A0A10);
    VA11 <= ADCth(11) AND NOT(A0A11);
    
    erreur <= VA1 OR VA2 OR VA3 OR VA4 OR VA5 OR VA6 OR VA7 OR VA8 OR VA9 OR VA10 OR VA11;

end Behavioral;
