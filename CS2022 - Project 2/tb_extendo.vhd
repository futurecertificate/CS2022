LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_extendo IS
END tb_extendo;
 
ARCHITECTURE behavior OF tb_extendo IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT E_PC
    PORT(
         SR_SB : IN  std_logic_vector(5 downto 0);
         signed_extension : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal SR_SB : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal signed_extension : std_logic_vector(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: E_PC PORT MAP (
          SR_SB => SR_SB,
          signed_extension => signed_extension
        );

   -- Stimulus process
   stim_proc: process
   begin		
		wait for 50ns;
		SR_SB <= "000001";
		
		wait for 50ns;
		SR_SB <= "100001";
		
      wait;
   end process;

END;
