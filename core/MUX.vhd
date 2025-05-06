----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.05.2025 23:49:57
-- Design Name: 
-- Module Name: MUX - Behavioral
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

entity MUX is
  port (
    erreur     : in  STD_LOGIC;
    S2         : in  STD_LOGIC;
    BTN        : in  STD_LOGIC_VECTOR(1 downto 0);
    ADCbin     : in  STD_LOGIC_VECTOR(3 downto 0);
    Dizaines   : in  STD_LOGIC_VECTOR(3 downto 0);
    Unites_ns  : in  STD_LOGIC_VECTOR(3 downto 0);
    Code_signe : in  STD_LOGIC_VECTOR(3 downto 0);
    Unites_s   : in  STD_LOGIC_VECTOR(3 downto 0);
    DAFF0      : out STD_LOGIC_VECTOR(3 downto 0);
    DAFF1      : out STD_LOGIC_VECTOR(3 downto 0)
  );
end entity;

architecture Behavioral of MUX is
  constant E_code          : STD_LOGIC_VECTOR(3 downto 0) := "1110"; -- 'E'
  constant r_code          : STD_LOGIC_VECTOR(3 downto 0) := "1111"; -- 'r'
  constant sign_minus_code : STD_LOGIC_VECTOR(3 downto 0) := "1010"; -- '-' not so sure ?
begin
  process (erreur, s2, BTN, ADCbin, Dizaines, Unites_ns, Code_signe, Unites_s)
  begin
    if (erreur = '1' or s2 = '1' or BTN = "11") then
      DAFF1 <= E_code;
      DAFF0 <= r_code;
    elsif (BTN = "00") then --BDC normal
      DAFF1 <= Dizaines;
      DAFF0 <= Unites_ns;
    elsif (BTN = "01") then --Hexadecimal
      DAFF1 <= "0000";
      DAFF0 <= ADCbin;
    elsif (BTN = "10") then --BDC -5 signé
      if (Code_signe = "0001") then
        DAFF1 <= sign_minus_code;
      else
        DAFF1 <= "0000";
      end if;
      DAFF0 <= Unites_s;
    else -- Default case (unreachable)
      DAFF1 <= "0000";
      DAFF0 <= "0000";
    end if;
  end process;
end architecture;
