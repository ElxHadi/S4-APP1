----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.04.2025 14:51:36
-- Design Name: 
-- Module Name: Add4bits - Behavioral
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

entity Add4bits is
    Port ( Ci : in STD_LOGIC;
           X4 : in STD_LOGIC_VECTOR (3 downto 0);
           Y4 : in STD_LOGIC_VECTOR (3 downto 0);
           S4 : out STD_LOGIC_VECTOR (3 downto 0);
           Co : out STD_LOGIC );
end Add4bits;

architecture Behavioral of Add4bits is

COMPONENT Add1BitB
    Port ( Ci : in STD_LOGIC;
           X : in STD_LOGIC;
           Y : in STD_LOGIC;
           S : out STD_LOGIC;
           Co : out STD_LOGIC);
end COMPONENT;

signal Coutout : std_logic_vector(0 to 2);

begin

ADD0: Add1BitB 
    PORT MAP(
    Ci => Ci,
    X => X4(0),
    Y => Y4(0),
    S => S4(0),
    Co => Coutout(0)
    );
ADD1: Add1BitB
    PORT MAP(
    Ci => Coutout(0),
    X => X4(1),
    Y => Y4(1),
    S => S4(1),
    Co => Coutout(1)
    );
ADD2: Add1BitB
    PORT MAP(
    Ci => Coutout(1),
    X => X4(2),
    Y => Y4(2),
    S => S4(2),
    Co => Coutout(2)
    );
ADD3: Add1BitB
    PORT MAP(
    Ci => Coutout(2),
    X => X4(3),
    Y => Y4(3),
    S => S4(3),
    Co => Co
    );



end Behavioral;
