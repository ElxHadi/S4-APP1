----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.05.2025 00:20:46
-- Design Name: 
-- Module Name: synchro_module_v2 - Behavioral
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

entity synchro_module_v2 is
generic (const_CLK_syst_MHz: integer := 100);
    Port (
        clkm : in STD_LOGIC; -- Entrée horloge maitresse
        o_clk_5MHz : out STD_LOGIC; -- horloge divisee via bufg
        o_S_1Hz : out STD_LOGIC -- Signal temoin 1 Hz (0,99952 Hz)
        );
end synchro_module_v2;

architecture Behavioral of synchro_module_v2 is

begin


end Behavioral;
