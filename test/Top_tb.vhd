----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/07/2019 08:34:20 PM
-- Design Name: 
-- Module Name: testBench - Behavioral
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

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;

--> L'entity du test bench est vide et elle doit le demeurer
--> L'entity peut porter le nom que vous voulez mais il est de bonne pratique 
--> d'utiliser le nom du module à tester avec un suffixe par exemple.

ENTITY Top_tb IS          --> Remarquez que l'ENTITY est vide et doit le demeurer pour un test bench !!!  
END Top_tb;


ARCHITECTURE behavioral OF Top_tb IS 

--> Remplacer ce COMPONENT par celui de votre COMPONENT à tester 
    -- Note: vous pouvez copier la partie PORT ( .. ) de l'entity de votre code VHDL 
    -- et l'insérer dans la déclaration COMPONENT.
--> Si vous voulez comparer 2 modules VHDL, vous pouvez déclarer 2 COMPONENTS 
    -- distincts avec leurs PORT MAP respectif. 

   COMPONENT Thermo2Bin
   PORT( ADCth : in STD_LOGIC_VECTOR (11 downto 0);
         ADCbin : out STD_LOGIC_VECTOR (3 downto 0);
         erreur : out STD_LOGIC);
   END COMPONENT;
   
--> Génération des signaux internes au test bench
   SIGNAL ADCth  : STD_LOGIC_VECTOR (11 downto 0);
   SIGNAL ADCbin : STD_LOGIC_VECTOR (3 downto 0);
   SIGNAL erreur : STD_LOGIC;

   SIGNAL vect_test : STD_LOGIC_VECTOR (11 downto 0);

   CONSTANT PERIOD    : time := 10 ns;


BEGIN
  -- Par le "port-map" suivant, cela revient à connecter le composant aux signaux internes du tests bench
  -- UUT Unit Under Test: ce nom est habituel mais non imposé.
  -- Si on simule deux composantes, on pourrait avoir UUT1, UUT2 par exemple
  
  UUT: Thermo2Bin PORT MAP(
      ADCth => ADCth, 
      ADCbin => ADCbin, 
      erreur => erreur
   );

 --> on assigne les signaux du vecteur de test vers les signaux connectés au port map. 
ADCth <= vect_test;
 
-- *** Test Bench - User Defined Section ***
-- l'intérêt de cette structure de test bench est que l'on recopie la table de vérité.

   tb : PROCESS
   BEGIN

       --> Cette partie est un exemple pour simuler le thermométrique
         wait for PERIOD; vect_test <="000000000000"; --> Code normal
         wait for PERIOD; vect_test <="000000000001";
         wait for PERIOD; vect_test <="000000000011";
         wait for PERIOD; vect_test <="000000000111";
         wait for PERIOD; vect_test <="000000001111";
         wait for PERIOD; vect_test <="000000011111";
         wait for PERIOD; vect_test <="000000111111";
         wait for PERIOD; vect_test <="000001111111";
         wait for PERIOD; vect_test <="000011111111";
         wait for PERIOD; vect_test <="000111111111";
         wait for PERIOD; vect_test <="001111111111";
         wait for PERIOD; vect_test <="011111111111";
         wait for PERIOD; vect_test <="111111111111";
         wait for PERIOD; vect_test <="111111111110"; --> Code avec erreur
         wait for PERIOD; vect_test <="111111111100";
         wait for PERIOD; vect_test <="111111111000";
         wait for PERIOD; vect_test <="111111110000";
         wait for PERIOD; vect_test <="111111100000";
         wait for PERIOD; vect_test <="111111000000";
         wait for PERIOD; vect_test <="111110000000";
         wait for PERIOD; vect_test <="111100000000";
         wait for PERIOD; vect_test <="111000000000";
         wait for PERIOD; vect_test <="110000000000";
         wait for PERIOD; vect_test <="100000000000";

        
         
                  
         WAIT; -- will wait forever
   END PROCESS;
END;


