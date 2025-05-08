----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.05.2025 09:12:14
-- Design Name: 
-- Module Name: VerifL1 - Behavioral
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

entity VerifL1 is
    Port ( P : in STD_LOGIC_VECTOR (2 downto 0);
           Ok : out STD_LOGIC);
end VerifL1;

architecture Behavioral of VerifL1 is

    signal intern : std_logic_vector(0 to 1);

begin

    intern(0) <= NOT(P(2)) AND NOT(P(1));
    intern(1) <= P(1) AND P(0);
    Ok <= intern(1) OR intern(0);

end Behavioral;
