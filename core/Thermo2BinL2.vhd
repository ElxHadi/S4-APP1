----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.05.2025 09:57:30
-- Design Name: 
-- Module Name: Thermo2BinL2 - Behavioral
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

entity Thermo2BinL2 is
    Port ( X : in STD_LOGIC_VECTOR (1 downto 0);
           Y : in STD_LOGIC_VECTOR (1 downto 0);
           V1 : in STD_LOGIC;
           V2 : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (2 downto 0);
           Ok : out STD_LOGIC);
end Thermo2BinL2;

architecture Behavioral of Thermo2BinL2 is

    COMPONENT Add2bits
    Port ( Ci : in STD_LOGIC;
           X2 : in STD_LOGIC_VECTOR (1 downto 0);
           Y2 : in STD_LOGIC_VECTOR (1 downto 0);
           S2 : out STD_LOGIC_VECTOR (1 downto 0);
           Co : out STD_LOGIC);
    end COMPONENT;
    
    COMPONENT VerifL2
    Port ( V1 : in STD_LOGIC;
           P1 : in STD_LOGIC_VECTOR (1 downto 0);
           V2 : in STD_LOGIC;
           P2 : in STD_LOGIC_VECTOR (1 downto 0);
           Ok : out STD_LOGIC);
    end COMPONENT;
    
begin

ADD: Add2bits
    PORT MAP(
    Ci => '0',
    X2 => X,
    Y2 => Y,
    S2 => S(1 downto 0),
    Co => S(2)
);

Verf: VerifL2
    PORT MAP(
    V1 => V1,
    P1 => X,
    V2 => V2,
    P2 => Y,
    Ok => Ok
    );

end Behavioral;
