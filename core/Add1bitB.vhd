----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.04.2025 14:51:36
-- Design Name: 
-- Module Name: Add1bitB - Behavioral
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

entity Add1bitB is
    Port ( Ci : in STD_LOGIC;
           X : in STD_LOGIC;
           Y : in STD_LOGIC;
           S : out STD_LOGIC;
           Co : out STD_LOGIC);
end Add1bitB;

architecture Behavioral of Add1bitB is

    signal XOR1OUT : std_logic;
    signal AND1OUT : std_logic;
    signal AND2OUT : std_logic;

begin

    XOR1OUT <= X XOR Y;
    AND1OUT <= X AND Y;
    AND2OUT <= Ci AND XOR1OUT;
    S <= XOR1OUT XOR Ci;
    Co <= AND1OUT OR AND2OUT;

end Behavioral;
