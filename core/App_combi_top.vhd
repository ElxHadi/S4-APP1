---------------------------------------------------------------------------------------------
-- Université de Sherbrooke - Département de GEGI
-- Version     : 3.0
-- Nomenclature  : GRAMS
-- Date      : 21 Avril 2020
-- Auteur(s)     : Réjean Fontaine, Daniel Dalle, Marc-André Tétrault
-- Technologies  : FPGA Zynq (carte ZYBO Z7-10 ZYBO Z7-20)
--           peripheriques: Pmod8LD PmodSSD
--
-- Outils      : vivado 2019.1 64 bits
---------------------------------------------------------------------------------------------
-- Description:
-- Circuit utilitaire pour le laboratoire et la problématique de logique combinatoire
--
---------------------------------------------------------------------------------------------
-- À faire :
-- Voir le guide de l'APP
--  Insérer les modules additionneurs ("components" et "instances")
--
---------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity AppCombi_top is port (
  i_btn     : in  std_logic_vector (3 downto 0); -- Boutons de la carte Zybo
  i_sw      : in  std_logic_vector (3 downto 0); -- Interrupteurs de la carte Zybo
  sysclk    : in  std_logic;           -- horloge systeme
  o_SSD     : out std_logic_vector (7 downto 0); -- vers cnnecteur pmod afficheur 7 segments
  o_led     : out std_logic_vector (3 downto 0); -- vers DELs de la carte Zybo
  o_led6_r  : out std_logic;           -- vers DEL rouge de la carte Zybo
  o_pmodled : out std_logic_vector (7 downto 0);  -- vers connecteur pmod 8 DELs
  ADCth     : in std_logic_vector (11 downto 0);     -- Connecteur ADCth thermometrique
  DEL2      : out std_logic;                         -- Carte thermometrique
  DEL3      : out std_logic;                         -- Carte thermometrique
  S1        : in std_logic;                          -- Carte thermometrique
  S2        : in std_logic                           -- Carte thermometrique
);
end AppCombi_top;

architecture Behavioral of AppCombi_top is

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
    
    COMPONENT MUX
    Port ( erreur     : in  STD_LOGIC;
           S2         : in  STD_LOGIC;
           BTN        : in  STD_LOGIC_VECTOR(1 downto 0);
           ADCbin     : in  STD_LOGIC_VECTOR(3 downto 0);
           Dizaines   : in  STD_LOGIC_VECTOR(3 downto 0);
           Unites_ns  : in  STD_LOGIC_VECTOR(3 downto 0);
           Code_signe : in  STD_LOGIC_VECTOR(3 downto 0);
           Unites_s   : in  STD_LOGIC_VECTOR(3 downto 0);
           DAFF0      : out STD_LOGIC_VECTOR(3 downto 0);
           DAFF1      : out STD_LOGIC_VECTOR(3 downto 0));
    end COMPONENT;
    signal DAFF0_MUX : std_logic_vector(3 downto 0);
    signal DAFF1_MUX : std_logic_vector(3 downto 0);
    
    COMPONENT synchro_module_v2
    Port ( 
           clkm        : in STD_LOGIC;      -- Entrée  horloge maitre
           o_clk_5MHz  : out  STD_LOGIC;    -- horloge divisee via bufg  
           o_S_1Hz     : out  STD_LOGIC     -- Signal temoin 1 Hz (0,99952 Hz) 
           );
    end COMPONENT;
    signal o_clk_5MHz : std_logic;
    signal o_S_1Hz : std_logic;
    
    COMPONENT septSegments_top
    Port (   clk            : in   STD_LOGIC;                      -- horloge systeme, typique 100 MHz (preciser par le constante)
             i_AFF0         : in   STD_LOGIC_VECTOR (3 downto 0);  -- donnee a afficher sur 4 bits : chiffre hexa position 0
             i_AFF1         : in   STD_LOGIC_VECTOR (3 downto 0);  -- donnee a afficher sur 4 bits : chiffre hexa position 1
             o_AFFSSD_Sim   : out string(2 downto 1);
             o_AFFSSD       : out  STD_LOGIC_VECTOR (7 downto 0));
    end COMPONENT;
    signal o_AFFSSD_Sim : string(2 downto 1);
    
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
        Y => o_pmodled
        );

Parite: Calculateur_parite
    PORT MAP (
        data_in => ADCbin,
        parity_sel => S1,
        parity_bit => parity_bit
        );
        DEL2 <= parity_bit;
        o_led(0) <= parity_bit;

DualBCD : Bin2DualBCD
    PORT MAP (
        Entree => ADCbin,
        Dizaines => Diz_BCD,
        Unites_ns => Unit_ns_BCD,
        Code_signe => Signe_BCD,
        Unites_s => Unit_s_BCD
        );
        
Multiplex: Mux
    PORT MAP (
        erreur     => thermo_erreur,
        S2         => S2,
        BTN        => i_btn( 1 downto 0),
        ADCbin     => ADCbin,
        Dizaines   => Diz_BCD,
        Unites_ns  => Unit_ns_BCD,
        Code_signe => Signe_BCD,
        Unites_s   => Unit_s_BCD,
        DAFF0      => DAFF0_MUX,
        DAFF1      => DAFF1_MUX
        );

Horloge : synchro_module_v2
    PORT MAP( 
           clkm       => sysclk,
           o_clk_5MHz => o_clk_5MHz,
           o_S_1Hz    => DEL3
           );  
        
SeptSegments : septSegments_Top
    PORT MAP (
        clk    => o_clk_5MHz,-- horloge systeme, typique 100 MHz (preciser par le constante)
        i_AFF0 => DAFF0_MUX, -- donnee a afficher sur 4 bits : chiffre hexa position 0
        i_AFF1 => DAFF1_MUX, -- donnee a afficher sur 4 bits : chiffre hexa position 1
        o_AFFSSD_Sim => o_AFFSSD_Sim,
        o_AFFSSD => o_SSD
        );


end Behavioral;
