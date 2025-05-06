----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.05.2025 22:40:01
-- Design Name: 
-- Module Name: Bin2DualBCD - Behavioral
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

entity Bin2DualBCD is
    Port ( Entree : in STD_LOGIC_VECTOR (3 downto 0);
           Dizaines : out STD_LOGIC_VECTOR (3 downto 0);
           Unites_ns : out STD_LOGIC_VECTOR (3 downto 0);
           Code_signe : out STD_LOGIC_VECTOR (3 downto 0);
           Unites_s : out STD_LOGIC_VECTOR (3 downto 0));
end Bin2DualBCD;

architecture Behavioral of Bin2DualBCD is

COMPONENT Bin2DualBCD_NS is
    Port ( Entree : in STD_LOGIC_VECTOR (3 downto 0);
           Dizaines : out STD_LOGIC_VECTOR (3 downto 0);
           Unites_ns : out STD_LOGIC_VECTOR (3 downto 0));
end COMPONENT;

COMPONENT Moins_5
    Port ( Entree : in STD_LOGIC_VECTOR (3 downto 0);
           Moins5 : out STD_LOGIC_VECTOR (3 downto 0));
end COMPONENT;
signal OutMoins_5 : STD_LOGIC_VECTOR (3 downto 0);

COMPONENT Bin2DualBCD_S
    Port ( Entree : in STD_LOGIC_VECTOR (3 downto 0);
           Code_signe : out STD_LOGIC_VECTOR (3 downto 0);
           Unites_s : out STD_LOGIC_VECTOR (3 downto 0));
end COMPONENT;


begin

NS: Bin2DualBCD_NS
    PORT MAP( 
        Entree => Entree,
        Dizaines => Dizaines,
        Unites_ns => Unites_ns
        );

M5: Moins_5
    PORT MAP( 
        Entree => Entree,
        Moins5 => OutMoins_5
        );

S: Bin2DualBCD_S
    PORT MAP( 
        Entree => OutMoins_5,
        Code_signe => Code_signe,
        Unites_s => Unites_s
        );



end Behavioral;
