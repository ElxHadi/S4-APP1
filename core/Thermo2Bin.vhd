----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.05.2025 09:04:36
-- Design Name: 
-- Module Name: Thermo2Bin - Behavioral
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

entity Thermo2Bin is
    Port ( ADCth : in STD_LOGIC_VECTOR (11 downto 0);
           ADCbin : out STD_LOGIC_VECTOR (3 downto 0);
           erreur : out STD_LOGIC);
end Thermo2Bin;

architecture Behavioral of Thermo2Bin is
    
    COMPONENT Checker
    Port ( ADCth : in STD_LOGIC_VECTOR (11 downto 0);
           Erreur : out STD_LOGIC);
    end COMPONENT;
    
    COMPONENT Add3bits
    Port ( Ci : in STD_LOGIC;
           X3 : in STD_LOGIC_VECTOR (2 downto 0);
           Y3 : in STD_LOGIC_VECTOR (2 downto 0);
           S3 : out STD_LOGIC_VECTOR (2 downto 0);
           Co : out STD_LOGIC);
    end COMPONENT;
    
    COMPONENT Add2bits
    Port ( Ci : in STD_LOGIC;
           X2 : in STD_LOGIC_VECTOR (1 downto 0);
           Y2 : in STD_LOGIC_VECTOR (1 downto 0);
           S2 : out STD_LOGIC_VECTOR (1 downto 0);
           Co : out STD_LOGIC);
    end COMPONENT;
    
    COMPONENT Add1bitB
    Port ( Ci : in STD_LOGIC;
           X : in STD_LOGIC;
           Y : in STD_LOGIC;
           S : out STD_LOGIC;
           Co : out STD_LOGIC);
    end COMPONENT;
    
    signal intern_L2_0 : std_logic_vector(2 downto 0);
    signal intern_L2_1 : std_logic_vector(2 downto 0);
    
    signal intern_L1_0 : std_logic_vector(1 downto 0);
    signal intern_L1_1 : std_logic_vector(1 downto 0);
    signal intern_L1_2 : std_logic_vector(1 downto 0);
    signal intern_L1_3 : std_logic_vector(1 downto 0);
        
begin

L1_0: Add1bitB
    PORT MAP (
        Ci => ADCth(0),
        X => ADCth(1),
        Y => ADCth(2),
        S => intern_L1_0(0),
        Co => intern_L1_0(1)
        );
L1_1: Add1bitB
    PORT MAP (
        Ci => ADCth(3),
        X => ADCth(4),
        Y => ADCth(5),
        S => intern_L1_1(0),
        Co => intern_L1_1(1)
        );
L1_2: Add1bitB
    PORT MAP (
        Ci => ADCth(6),
        X => ADCth(7),
        Y => ADCth(8),
        S => intern_L1_2(0),
        Co => intern_L1_2(1)
        );
L1_3: Add1bitB
    PORT MAP (
        Ci => ADCth(9),
        X => ADCth(10),
        Y => ADCth(11),
        S => intern_L1_3(0),
        Co => intern_L1_3(1)
        );
        
L2_0: Add2bits
    PORT MAP (
       Ci => '0',
       X2 => intern_L1_0,
       Y2 => intern_L1_1,
       S2 => intern_L2_0(1 downto 0),
       Co => intern_L2_0(2)
       );
L2_1: Add2bits
    PORT MAP (
       Ci => '0',
       X2 => intern_L1_2,
       Y2 => intern_L1_3,
       S2 => intern_L2_1(1 downto 0),
       Co => intern_L2_1(2)
       );
       
ADD: Add3bits
    PORT MAP (
       Ci => '0',
       X3 => intern_L2_0,
       Y3 => intern_L2_1,
       S3 => ADCbin(2 downto 0),
       Co => ADCbin(3)
       );

CHECK: Checker
    PORT MAP (
        ADCth => ADCth,
        Erreur => erreur
        );

end Behavioral;
