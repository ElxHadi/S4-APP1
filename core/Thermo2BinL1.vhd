----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.05.2025 09:57:30
-- Design Name: 
-- Module Name: Thermo2BinL1 - Behavioral
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

entity Thermo2BinL1 is
    Port ( X : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC_VECTOR (1 downto 0);
           Ok : out STD_LOGIC);
end Thermo2BinL1;

architecture Behavioral of Thermo2BinL1 is

    COMPONENT Add1BitB
        Port ( Ci : in STD_LOGIC;
               X : in STD_LOGIC;
               Y : in STD_LOGIC;
               S : out STD_LOGIC;
               Co : out STD_LOGIC);
    end COMPONENT;

    COMPONENT VerifL1
        Port ( P : in STD_LOGIC_VECTOR (2 downto 0);
               Ok : out STD_LOGIC);
    end COMPONENT;

begin

ADD: Add1BitB 
    PORT MAP(
    Ci => X(0),
    X => X(1),
    Y => X(2),
    S => S(0),
    Co => S(1)
    );

Verf: VerifL1
    PORT MAP(
    P => X,
    Ok => Ok
    );

end Behavioral;
