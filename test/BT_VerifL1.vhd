----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.05.2025 17:19:09
-- Design Name: 
-- Module Name: BT_VerifL1 - Behavioral
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

entity BT_VerifL1 is
end BT_VerifL1;


ARCHITECTURE behavioral OF BT_VerifL1 IS 

--> Remplacer ce COMPONENT par celui de votre COMPONENT à tester 
    -- Note: vous pouvez copier la partie PORT ( .. ) de l'entity de votre code VHDL 
    -- et l'insérer dans la déclaration COMPONENT.
--> Si vous voulez comparer 2 modules VHDL, vous pouvez déclarer 2 COMPONENTS 
    -- distincts avec leurs PORT MAP respectif. 
    
    COMPONENT Thermo2BinL1
        Port ( X : in STD_LOGIC_VECTOR (2 downto 0);
               S : out STD_LOGIC_VECTOR (1 downto 0);
               Ok : out STD_LOGIC);
    end COMPONENT;
   
--> Génération des signaux internes au test bench
   SIGNAL X : STD_LOGIC_VECTOR (2 downto 0);
   SIGNAL S : STD_LOGIC_VECTOR (1 downto 0);
   SIGNAL Ok : STD_LOGIC;

   SIGNAL vect_test : STD_LOGIC_VECTOR (2 downto 0);

   CONSTANT PERIOD    : time := 10 ns;


BEGIN
  -- Par le "port-map" suivant, cela revient à connecter le composant aux signaux internes du tests bench
  -- UUT Unit Under Test: ce nom est habituel mais non imposé.
  -- Si on simule deux composantes, on pourrait avoir UUT1, UUT2 par exemple
  
  UUT: Thermo2BinL1 PORT MAP(
      X => X, 
      S => S, 
      Ok => Ok
   );

 --> on assigne les signaux du vecteur de test vers les signaux connectés au port map. 
X <= vect_test;
 
-- *** Test Bench - User Defined Section ***
-- l'intérêt de cette structure de test bench est que l'on recopie la table de vérité.

   tb : PROCESS
   BEGIN

       --> Tous les tests
         wait for PERIOD; vect_test <="000";
         wait for PERIOD; vect_test <="001";
         wait for PERIOD; vect_test <="010";
         wait for PERIOD; vect_test <="011";
         wait for PERIOD; vect_test <="100";
         wait for PERIOD; vect_test <="101";
         wait for PERIOD; vect_test <="110";
         wait for PERIOD; vect_test <="111";
         
                  
         WAIT; -- will wait forever
   END PROCESS;
END;


