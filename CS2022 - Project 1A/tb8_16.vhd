LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb8_16 IS
END tb8_16;
 
ARCHITECTURE behavior OF tb8_16 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux8_16
    PORT(
         s0 : IN  std_logic;
         s1 : IN  std_logic;
         s2 : IN  std_logic;
         
         in0 : IN  std_logic_vector(15 downto 0);
         in1 : IN  std_logic_vector(15 downto 0);
         in2 : IN  std_logic_vector(15 downto 0);
         in3 : IN  std_logic_vector(15 downto 0);
         in4 : IN  std_logic_vector(15 downto 0);
         in5 : IN  std_logic_vector(15 downto 0);
         in6 : IN  std_logic_vector(15 downto 0);
         in7 : IN  std_logic_vector(15 downto 0);
         z : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal in0 : std_logic_vector(15 downto 0) := (others => '0');
   signal in1 : std_logic_vector(15 downto 0) := (others => '0');
   signal in2 : std_logic_vector(15 downto 0) := (others => '0');
   signal in3 : std_logic_vector(15 downto 0) := (others => '0');
   signal in4 : std_logic_vector(15 downto 0) := (others => '0');
   signal in5 : std_logic_vector(15 downto 0) := (others => '0');
   signal in6 : std_logic_vector(15 downto 0) := (others => '0');
   signal in7 : std_logic_vector(15 downto 0) := (others => '0');
   
   signal s0 : std_logic := '0';
   signal s1 : std_logic := '0';
   signal s2 : std_logic := '0';
    
 	--Outputs
   signal z : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
    uut: mux8_16 PORT MAP (
          in0 => in0,
          in1 => in1,
          in2 => in2,
          in3 => in3,
          in4 => in4,
          in5 => in5,
          in6 => in6,
          in7 => in7,
          
          s0 => s0,
          s1 => s1,
          s2 => s2,
          
          z => z
        ); 

    stim_proc: process
    begin		
		wait for 10ns;
		in0 <= x"BEEF";
		in1 <= x"B00B";
		in2 <= x"BAAA";
		in3 <= x"BABE";
		in4 <= x"FAB0";
		in5 <= x"BADD";
		in6 <= x"DAD3";
		in7 <= x"CA75";
		
		
		wait for 10ns;
		s0 <= '0';
		s1 <= '0';
		s2 <= '0';
		
		
		wait for 10ns;
		s0 <= '1';
		s1 <= '1';
		s2 <= '1';
		
		
		wait for 10ns;
		s0 <= '0';
		s1 <= '0';
		s2 <= '0';
		
	
    end process;

END;
