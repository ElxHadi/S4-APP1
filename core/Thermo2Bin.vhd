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

    COMPONENT Thermo2BinL1
        Port ( X : in STD_LOGIC_VECTOR (2 downto 0);
               S : out STD_LOGIC_VECTOR (1 downto 0);
               Ok : out STD_LOGIC);
    end COMPONENT;

    COMPONENT Thermo2BinL2
    Port ( X : in STD_LOGIC_VECTOR (1 downto 0);
           Y : in STD_LOGIC_VECTOR (1 downto 0);
           V1 : in STD_LOGIC;
           V2 : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (2 downto 0);
           Ok : out STD_LOGIC);
    end COMPONENT;
    
    COMPONENT Checker
    Port ( V1 : in STD_LOGIC;
           P1 : in STD_LOGIC_VECTOR (2 downto 0);
           V2 : in STD_LOGIC;
           P2 : in STD_LOGIC_VECTOR (2 downto 0);
           Erreur : out STD_LOGIC);
    end COMPONENT;
    
    COMPONENT Add3bits
    Port ( Ci : in STD_LOGIC;
           X3 : in STD_LOGIC_VECTOR (2 downto 0);
           Y3 : in STD_LOGIC_VECTOR (2 downto 0);
           S3 : out STD_LOGIC_VECTOR (2 downto 0);
           Co : out STD_LOGIC);
    end COMPONENT;    
    
    signal intern_L1_0 : std_logic_vector(1 downto 0);
    signal Ok_L1_0 : std_logic;
    signal intern_L1_1 : std_logic_vector(1 downto 0);
    signal Ok_L1_1 : std_logic;
    signal intern_L1_2 : std_logic_vector(1 downto 0);
    signal Ok_L1_2 : std_logic;
    signal intern_L1_3 : std_logic_vector(1 downto 0);
    signal Ok_L1_3 : std_logic;
    
    signal intern_L2_0 : std_logic_vector(2 downto 0);
    signal Ok_L2_0 : std_logic;
    signal intern_L2_1 : std_logic_vector(2 downto 0);
    signal Ok_L2_1 : std_logic;
        
begin

L1_0: Thermo2BinL1
    PORT MAP (
        X => ADCth(2 downto 0),
        S => intern_L1_0,
        Ok => Ok_L1_0
        );
L1_1: Thermo2BinL1
    PORT MAP (
        X => ADCth(5 downto 3),
        S => intern_L1_1,
        Ok => Ok_L1_1
        );
L1_2: Thermo2BinL1
    PORT MAP (
        X => ADCth(8 downto 6),
        S => intern_L1_2,
        Ok => Ok_L1_2
        );
L1_3: Thermo2BinL1
    PORT MAP (
        X => ADCth(11 downto 9),
        S => intern_L1_3,
        Ok => Ok_L1_3
        );
        
L2_0: Thermo2BinL2
    PORT MAP (
       X => intern_L1_0,
       Y => intern_L1_1,
       V1 => Ok_L1_0,
       V2 => Ok_L1_1,
       S => intern_L2_0,
       Ok => Ok_L2_0
       );
L2_1: Thermo2BinL2
    PORT MAP (
       X => intern_L1_2,
       Y => intern_L1_3,
       V1 => Ok_L1_2,
       V2 => Ok_L1_3,
       S => intern_L2_1,
       Ok => Ok_L2_1
       );
       
CHECK: Checker
    PORT MAP (
        V1 => Ok_L2_0,
        P1 => intern_L2_0,
        V2 => Ok_L2_1,
        P2 => intern_L2_1,
        Erreur => erreur
        );
       
ADD: Add3bits
    PORT MAP (
       Ci => '0',
       X3 => intern_L2_0,
       Y3 => intern_L2_1,
       S3 => ADCbin(2 downto 0),
       Co => ADCbin(3)
       );

end Behavioral;
