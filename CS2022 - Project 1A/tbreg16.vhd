LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

ENTITY tbreg16 IS
END tbreg16;
 
ARCHITECTURE behavior OF tbreg16 IS 
 
    
    COMPONENT reg16
    PORT(
         D : IN  std_logic_vector(15 downto 0);
         load : IN  std_logic;
         clk : IN  std_logic;
         Q : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   signal D : std_logic_vector(15 downto 0) := (others => '0');
   signal load : std_logic := '0';
   signal clk : std_logic := '0';

 	signal Q : std_logic_vector(15 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reg16 PORT MAP (
          D => D,
          load => load,
          clk => clk,
          Q => Q
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for 5ns;
		clk <= '1';
		wait for 5ns;
   end process;

   -- Stimulus process
   stim_proc: process
   begin		
		wait for 10ns;
		D <= x"1234";
		load <= '1';
		
		wait for 10ns;
		load <= '0';
		
		wait for 10ns;
		D <= x"FFFF";
		load <= '1';
		
		wait for 10ns;
		load <= '0';
   end process;

END;