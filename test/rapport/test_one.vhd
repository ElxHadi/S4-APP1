-- Testbench for AppCombi_top
-- Verifies that ADCth = "000000000011" with BTN0=0, BTN1=0 produces the expected 7-segment pattern.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_AppCombi_top is
end tb_AppCombi_top;

architecture sim of tb_AppCombi_top is

  -- Component under test
  component AppCombi_top is
    port (
      i_btn     : in  std_logic_vector(3 downto 0);
      i_sw      : in  std_logic_vector(3 downto 0);
      sysclk    : in  std_logic;
      o_SSD     : out std_logic_vector(7 downto 0);
      o_led     : out std_logic_vector(3 downto 0);
      o_led6_r  : out std_logic;
      o_pmodled : out std_logic_vector(7 downto 0);
      ADCth     : in  std_logic_vector(11 downto 0);
      DEL2      : out std_logic;
      DEL3      : out std_logic;
      S1        : in  std_logic;
      S2        : in  std_logic
    );
  end component;

  -- Signals to connect to DUT
  signal i_btn     : std_logic_vector(3 downto 0) := (others => '0');
  signal i_sw      : std_logic_vector(3 downto 0) := (others => '0');
  signal sysclk    : std_logic := '0';
  signal o_SSD     : std_logic_vector(7 downto 0);
  signal o_led     : std_logic_vector(3 downto 0);
  signal o_led6_r  : std_logic;
  signal o_pmodled : std_logic_vector(7 downto 0);
  signal ADCth     : std_logic_vector(11 downto 0) := (others => '0');
  signal DEL2      : std_logic;
  signal DEL3      : std_logic;
  signal S1        : std_logic := '0';
  signal S2        : std_logic := '0';

  constant CLK_PERIOD : time := 10 ns;

begin

  -- Instantiate the DUT
  DUT: AppCombi_top
    port map (
      i_btn     => i_btn,
      i_sw      => i_sw,
      sysclk    => sysclk,
      o_SSD     => o_SSD,
      o_led     => o_led,
      o_led6_r  => o_led6_r,
      o_pmodled => o_pmodled,
      ADCth     => ADCth,
      DEL2      => DEL2,
      DEL3      => DEL3,
      S1        => S1,
      S2        => S2
    );

  -- Clock generator
  clk_process : process
  begin
    while true loop
      sysclk <= '0';
      wait for CLK_PERIOD/2;
      sysclk <= '1';
      wait for CLK_PERIOD/2;
    end loop;
  end process clk_process;

  -- Test stimulus
  stim_process : process
  begin
    -- Apply the specific test vectors
    ADCth  <= "000000000011";  -- Thermo code for decimal 3
    i_btn  <= "1111";          -- BTN0=0, BTN1=0 -> BCD non signé
    S1     <= '0';             -- parité impaire (irrelevant here)
    S2     <= '0';             -- pas d'erreur forcée

    -- Give time for propagation through the design
    wait for 200 ns;

    -- Assert expected 7-segment pattern
    assert o_SSD = "1001111"  
      report "TEST FAILED"
      severity error;

    -- If reached, the test passed
    report "TEST PASSED";
    wait;
  end process stim_process;

end architecture sim;
