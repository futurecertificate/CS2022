LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_car IS
END tb_car;
 
ARCHITECTURE behavior OF tb_car IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CAR
    Port(	Cmux : in STD_LOGIC_VECTOR(7 downto 0);
			Smux, reset, Clk : in STD_LOGIC;
			car_out : out STD_LOGIC_VECTOR(7 downto 0)
			);
    END COMPONENT;
    

   --Inputs
   signal Cmux : std_logic_vector(7 downto 0) := (others => '0');
   signal Smux : std_logic := '0';
   signal reset : std_logic := '0';
   signal Clk : std_logic := '0';
 	--Outputs
   signal car_out : std_logic_vector(7 downto 0);
 
BEGIN
 clk_process :process
   begin
		Clk <= '0';
		wait for 5ns;
		Clk <= '1';
		wait for 5ns;
   end process;
   
   
	-- Instantiate the Unit Under Test (UUT)
   uut: CAR PORT MAP (
          Cmux => Cmux,
          Smux => Smux,
          reset => reset,
          car_out => car_out,
          Clk => Clk
        );
		  
   -- Stimulus process
   stim_proc: process
   begin		
		wait for 5ns;
		reset <= '1';
		
		wait for 30ns;
		reset <= '0';
		
		wait for 30ns;
		Cmux <= x"01";
		
		wait for 30ns;
		Cmux <= x"DA";
		Smux <= '1';

      wait;
   end process;

END;
