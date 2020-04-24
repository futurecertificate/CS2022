LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_pc IS
END tb_pc;
 
ARCHITECTURE behavior OF tb_pc IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PCreg
    PORT(
         seAD : in STD_LOGIC_VECTOR(15 downto 0);
         PL : IN  std_logic;
         PI : IN  std_logic;
         reset : IN  std_logic;
         Clk : IN std_logic;
         PC : out STD_LOGIC_VECTOR(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal seAD : std_logic_vector(15 downto 0) := (others => '0');
   signal PL : std_logic := '0';
   signal PI : std_logic := '0';
   signal reset : std_logic := '0';
   signal Clk : std_logic := '0';
 	--Outputs
   signal PC : std_logic_vector(15 downto 0);
 
BEGIN
    clk_process :process
   begin
		Clk <= '0';
		wait for 5ns;
		Clk <= '1';
		wait for 5ns;
   end process;
   
   
	-- Instantiate the Unit Under Test (UUT)
   uut: PCreg PORT MAP (
          seAD => seAD,
          PL => PL,
          PI => PI,
          reset => reset,
          Clk => Clk,
          PC => PC
        );

   -- Stimulus process
   stim_proc: process
   begin		
		wait for 5ns;
		reset <= '1';
		seAD <= x"0000";
		
		wait for 5ns;
		reset <= '0';
		
		wait for 5ns;
		PI <= '1';
		seAD <= x"0002";
		
		wait for 20ns;
		PI <= '0';
		PL <= '1';
		seAD <= x"000F";

      wait;
   end process;

END;
