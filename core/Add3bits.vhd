----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.05.2025 09:50:53
-- Design Name: 
-- Module Name: Add3bits - Behavioral
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

entity Add3bits is
    Port ( Ci : in STD_LOGIC;
           X3 : in STD_LOGIC_VECTOR (2 downto 0);
           Y3 : in STD_LOGIC_VECTOR (2 downto 0);
           S3 : out STD_LOGIC_VECTOR (2 downto 0);
           Co : out STD_LOGIC);
end Add3bits;

architecture Behavioral of Add3bits is

COMPONENT Add1BitB
    Port ( Ci : in STD_LOGIC;
           X : in STD_LOGIC;
           Y : in STD_LOGIC;
           S : out STD_LOGIC;
           Co : out STD_LOGIC);
end COMPONENT;

signal Coutout : std_logic_vector(0 to 1);

begin

ADD0: Add1BitB 
    PORT MAP(
    Ci => Ci,
    X => X3(0),
    Y => Y3(0),
    S => S3(0),
    Co => Coutout(0)
    );
ADD1: Add1BitB
    PORT MAP(
    Ci => Coutout(0),
    X => X3(1),
    Y => Y3(1),
    S => S3(1),
    Co => Coutout(1)
    );
ADD2: Add1BitB
    PORT MAP(
    Ci => Coutout(1),
    X => X3(2),
    Y => Y3(2),
    S => S3(2),
    Co => Co
    );


end Behavioral;
