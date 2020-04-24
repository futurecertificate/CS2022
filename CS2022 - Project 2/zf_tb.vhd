LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY zf_tb IS
END zf_tb;
 
ARCHITECTURE behavior OF zf_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT zero_fill
    PORT(
         SB : IN  std_logic_vector(2 downto 0);
         constant_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal SB : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal constant_out : std_logic_vector(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: zero_fill PORT MAP (
          SB => SB,
          constant_out => constant_out
        );

   -- Stimulus process
   stim_proc: process
   begin	
		wait for 10ns;
		SB <= "110";
		wait;
   end process;

END;
