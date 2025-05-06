----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.05.2025 17:30:20
-- Design Name: 
-- Module Name: BT_VerifL2 - Behavioral
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

entity BT_VerifL2 is
--  Port ( );
end BT_VerifL2;

architecture Behavioral of BT_VerifL2 is


COMPONENT Thermo2BinL2
    Port ( X : in STD_LOGIC_VECTOR (1 downto 0);
           Y : in STD_LOGIC_VECTOR (1 downto 0);
           V1 : in STD_LOGIC;
           V2 : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (2 downto 0);
           Ok : out STD_LOGIC);
    end COMPONENT;
   
--> Génération des signaux internes au test bench
   SIGNAL X : STD_LOGIC_VECTOR (1 downto 0);
   SIGNAL Y : STD_LOGIC_VECTOR (1 downto 0);
   SIGNAL V1 : STD_LOGIC;
   SIGNAL V2 : STD_LOGIC;
   SIGNAL S : STD_LOGIC_VECTOR (2 downto 0);
   SIGNAL Ok : STD_LOGIC;

   SIGNAL vect_test : STD_LOGIC_VECTOR (5 downto 0);

   CONSTANT PERIOD    : time := 10 ns;


BEGIN
  -- Par le "port-map" suivant, cela revient à connecter le composant aux signaux internes du tests bench
  -- UUT Unit Under Test: ce nom est habituel mais non imposé.
  -- Si on simule deux composantes, on pourrait avoir UUT1, UUT2 par exemple
  
  UUT: Thermo2BinL2 PORT MAP(
      X => X, 
      Y => Y,
      V1 => V1,
      V2 => V2,
      S => S, 
      Ok => Ok
   );

 --> on assigne les signaux du vecteur de test vers les signaux connectés au port map. 
X <= vect_test(5 downto 4);
Y <= vect_test(3 downto 2);
V1 <= vect_test(1);
V2 <= vect_test(0);

 
-- *** Test Bench - User Defined Section ***
-- l'intérêt de cette structure de test bench est que l'on recopie la table de vérité.

   tb : PROCESS
   BEGIN

       --> Tous les tests
         wait for PERIOD; vect_test <="000011";
         wait for PERIOD; vect_test <="000111";
         wait for PERIOD; vect_test <="001011";
         wait for PERIOD; vect_test <="001111";
         wait for PERIOD; vect_test <="010011";
         wait for PERIOD; vect_test <="010111";
         wait for PERIOD; vect_test <="011011";
         wait for PERIOD; vect_test <="011111";
         wait for PERIOD; vect_test <="100111";
         wait for PERIOD; vect_test <="101011";
         wait for PERIOD; vect_test <="101111";
         wait for PERIOD; vect_test <="110011";
         wait for PERIOD; vect_test <="110111";
         wait for PERIOD; vect_test <="111011";
         wait for PERIOD; vect_test <="111111";
         wait for PERIOD; vect_test <="111110";
         wait for PERIOD; vect_test <="111101";
         wait for PERIOD; vect_test <="111100";
         
                  
         WAIT; -- will wait forever
   END PROCESS;
END;
