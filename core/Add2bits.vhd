----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.05.2025 09:45:49
-- Design Name: 
-- Module Name: Add2bits - Behavioral
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

entity Add2bits is
    Port ( Ci : in STD_LOGIC;
           X2 : in STD_LOGIC_VECTOR (1 downto 0);
           Y2 : in STD_LOGIC_VECTOR (1 downto 0);
           S2 : out STD_LOGIC_VECTOR (1 downto 0);
           Co : out STD_LOGIC);
end Add2bits;

architecture Behavioral of Add2bits is

    COMPONENT Add1BitB
        Port ( Ci : in STD_LOGIC;
               X : in STD_LOGIC;
               Y : in STD_LOGIC;
               S : out STD_LOGIC;
               Co : out STD_LOGIC);
    end COMPONENT;

    signal Coutout : std_logic;

begin

ADD0: Add1BitB 
    PORT MAP(
    Ci => Ci,
    X => X2(0),
    Y => Y2(0),
    S => S2(0),
    Co => Coutout
    );
ADD1: Add1BitB
    PORT MAP(
    Ci => Coutout,
    X => X2(1),
    Y => Y2(1),
    S => S2(1),
    Co => Co
    );
   
end Behavioral;
