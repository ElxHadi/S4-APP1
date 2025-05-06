----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.05.2025 18:10:35
-- Design Name: 
-- Module Name: App_combi_top - Behavioral
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

entity App_combi_top is
    Port( S1 : in STD_LOGIC;
          S2 : in STD_LOGIC;
          BTN0 : in STD_LOGIC;
          BTN1 : in STD_LOGIC;
          ADCth : in STD_LOGIC_VECTOR (11 downto 0);
          --------
          DEL2 : out STD_LOGIC;
          DEL3 : out STD_LOGIC;
          SSD : out STD_LOGIC_VECTOR (8 downto 0);
          LED : out STD_LOGIC_VECTOR (7 downto 0)
          );
end App_combi_top;

architecture Behavioral of App_combi_top is

    COMPONENT Thermo2Bin
    Port ( ADCth : in STD_LOGIC_VECTOR (11 downto 0);
           ADCbin : out STD_LOGIC_VECTOR (3 downto 0);
           erreur : out STD_LOGIC);
    end COMPONENT;
    signal ADCbin : std_logic_vector(3 downto 0);
    signal thermo_erreur : std_logic;
    

    COMPONENT Add4bits
    Port ( Ci : in STD_LOGIC;
           X4 : in STD_LOGIC_VECTOR (3 downto 0);
           Y4 : in STD_LOGIC_VECTOR (3 downto 0);
           S4 : out STD_LOGIC_VECTOR (3 downto 0);
           Co : out STD_LOGIC);
    end COMPONENT;
    signal ADCbinDeca : std_logic_vector(3 downto 0);
    signal S3_4 : std_logic_vector(3 downto 0);
    signal restant3_4 : std_logic;
    
    
    COMPONENT Dec3_8
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
    end COMPONENT;
    signal YDec3_8 : std_logic_vector(7 downto 0);
    
    COMPONENT Calculateur_parite
    Port ( data_in : in STD_LOGIC_VECTOR (3 downto 0);
           parity_sel : in STD_LOGIC;
           parity_bit : out STD_LOGIC);
    end COMPONENT;
    signal parity_bit : std_logic;
    
    COMPONENT Bin2DualBCD
    Port ( Entree : in STD_LOGIC_VECTOR (3 downto 0);
           Dizaines : out STD_LOGIC_VECTOR (3 downto 0);
           Unites_ns : out STD_LOGIC_VECTOR (3 downto 0);
           Code_signe : out STD_LOGIC_VECTOR (3 downto 0);
           Unites_s : out STD_LOGIC_VECTOR (3 downto 0));
    end COMPONENT;
    signal Diz_BCD : std_logic_vector(3 downto 0);
    signal Unit_ns_BCD : std_logic_vector(3 downto 0);
    signal Signe_BCD : std_logic_vector(3 downto 0);
    signal Unit_s_BCD : std_logic_vector(3 downto 0);
    
begin

Therm2Bin: Thermo2Bin
    PORT MAP (
        ADCth => ADCth,
        ADCbin => ADCbin,
        erreur => thermo_erreur
        );

Fct2_3: Add4bits
    PORT MAP (
        Ci => '0',
        X4 => ADCbin,
        Y4(3 downto 2) => "00",
        Y4(1 downto 0) => ADCbin(3 downto 2),
        S4(0) => restant3_4,
        S4(3 downto 1) => S3_4(2 downto 0),
        Co => S3_4(3)
        );
        
Decodeur3_8: Dec3_8
    PORT MAP (
        A => S3_4(2 downto 0),
        Y => YDec3_8
        );

Parite: Calculateur_parite
    PORT MAP (
        data_in => ADCbin,
        parity_sel => '0',
        parity_bit => parity_bit
        );
        DEL2 <= parity_bit;
        LED(0) <= parity_bit;

DualBCD : Bin2DualBCD
    PORT MAP (
        Entree => ADCbin,
        Dizaines => Diz_BCD,
        Unites_ns => Unit_ns_BCD,
        Code_signe => Signe_BCD,
        Unites_s => Unit_s_BCD
        );

end Behavioral;
