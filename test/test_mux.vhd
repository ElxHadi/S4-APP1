library IEEE;
  use IEEE.STD_LOGIC_1164.all;

entity tb_mux is
end entity;

architecture Behavioral of tb_mux is
  -- Signals for inputs and outputs
  signal err        : STD_LOGIC                    := '0';
  signal s2         : STD_LOGIC                    := '0';
  signal BTN        : STD_LOGIC_VECTOR(1 downto 0) := "00";
  signal ADC        : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
  signal DZ         : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
  signal Ut_ns      : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
  signal Code_signe : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
  signal Ut_s       : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
  signal AFF0       : STD_LOGIC_VECTOR(3 downto 0);
  signal AFF1       : STD_LOGIC_VECTOR(3 downto 0);

  -- Component declaration
  component big_mux
    port (
      err        : in  STD_LOGIC;
      s2         : in  STD_LOGIC;
      BTN        : in  STD_LOGIC_VECTOR(1 downto 0);
      ADC        : in  STD_LOGIC_VECTOR(3 downto 0);
      DZ         : in  STD_LOGIC_VECTOR(3 downto 0);
      Ut_ns      : in  STD_LOGIC_VECTOR(3 downto 0);
      Code_signe : in  STD_LOGIC_VECTOR(3 downto 0);
      Ut_s       : in  STD_LOGIC_VECTOR(3 downto 0);
      AFF0       : out STD_LOGIC_VECTOR(3 downto 0);
      AFF1       : out STD_LOGIC_VECTOR(3 downto 0)
    );
  end component;

begin
  -- Instantiate the Unit Under Test (UUT)
  uut: big_mux
    port map (
      err        => err,
      s2         => s2,
      BTN        => BTN,
      ADC        => ADC,
      DZ         => DZ,
      Ut_ns      => Ut_ns,
      Code_signe => Code_signe,
      Ut_s       => Ut_s,
      AFF0       => AFF0,
      AFF1       => AFF1
    );

  -- Test process
  process
  begin
    -- Test case 1: Error condition
    err <= '1';
    s2 <= '0';
    BTN <= "00";
    wait for 10 ns;
    assert (AFF1 = "1110" and AFF0 = "1011") report "Test case 1 failed" severity error;

    -- Test case 2: s2 condition
    err <= '0';
    s2 <= '1';
    BTN <= "00";
    wait for 10 ns;
    assert (AFF1 = "1110" and AFF0 = "1011") report "Test case 2 failed" severity error;

    -- Test case 3: BTN = "11"
    err <= '0';
    s2 <= '0';
    BTN <= "11";
    wait for 10 ns;
    assert (AFF1 = "1110" and AFF0 = "1011") report "Test case 3 failed" severity error;

    -- Test case 4: BTN = "00"
    err <= '0';
    s2 <= '0';
    BTN <= "00";
    DZ <= "1100";
    Ut_ns <= "0011";
    wait for 10 ns;
    assert (AFF1 = "1100" and AFF0 = "0011") report "Test case 4 failed" severity error;

    -- Test case 5: BTN = "01"
    BTN <= "01";
    ADC <= "1010";
    wait for 10 ns;
    assert (AFF1 = "0000" and AFF0 = "1010") report "Test case 5 failed" severity error;

    -- Test case 6: BTN = "10", Code_signe = "0001"
    BTN <= "10";
    Code_signe <= "0001";
    Ut_s <= "0110";
    wait for 10 ns;
    assert (AFF1 = "1010" and AFF0 = "0110") report "Test case 6 failed" severity error;

    -- Test case 7: BTN = "10", Code_signe /= "0001"
    Code_signe <= "0010";
    wait for 10 ns;
    assert (AFF1 = "0000" and AFF0 = "0110") report "Test case 7 failed" severity error;

    -- Test case 8: Default case
    BTN <= "XX"; -- Invalid BTN value
    wait for 10 ns;
    assert (AFF1 = "0000" and AFF0 = "0000") report "Test case 8 failed" severity error;

    wait;
  end process;
end architecture;
