LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY tb2_16 IS
END tb2_16;
 
ARCHITECTURE behavior OF tb2_16 IS 
 
 
    COMPONENT mux2_16
    PORT(
         s : IN  std_logic;
         in0 : IN  std_logic_vector(15 downto 0);
         in1 : IN  std_logic_vector(15 downto 0);
         z : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   signal in0 : std_logic_vector(15 downto 0) := (others => '0');
   signal in1 : std_logic_vector(15 downto 0) := (others => '0');
   signal s : std_logic := '0';

   signal z : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
    uut: mux2_16 PORT MAP (
          in0 => in0,
          in1 => in1,
          s => s,
          z => z
        ); 

    stim_proc: process
    begin		
		wait for 10ns;
		in0 <= x"BEEF";
		in1 <= x"B00B";
		
		wait for 10ns;
		s <= '1';
		
		wait for 10ns;
		s <= '0';
		
		wait for 10ns;
		s <= '1';
	
    end process;

END;
