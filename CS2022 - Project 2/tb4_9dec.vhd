

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb4_9dec is

end tb4_9dec;

architecture Behavioral of tb4_9dec is
COMPONENT decoder4_9
PORT(
LE : IN std_logic;
A0 : IN std_logic;
A1 : IN std_logic;
A2 : IN std_logic;
A3 : IN std_logic;
Q0 : OUT std_logic;
Q1 : OUT std_logic;
Q2 : OUT std_logic;
Q3 : OUT std_logic;
Q4 : OUT std_logic;
Q5 : OUT std_logic;
Q6 : OUT std_logic;
Q7 : OUT std_logic;
Q8 : OUT std_logic
);
END COMPONENT;
    
     --Inputs
   signal LE : std_logic := '1';
   
   signal A0 : std_logic := '0';
   signal A1 : std_logic := '0';
   signal A2 : std_logic := '0';
   signal A3 : std_logic := '0';
    
    
 	--Outputs
   signal Q0 : std_logic;
   signal Q1 : std_logic;
   signal Q2 : std_logic;
   signal Q3 : std_logic;
   signal Q4 : std_logic;
   signal Q5 : std_logic;
   signal Q6 : std_logic;
   signal Q7 : std_logic;
   signal Q8 : std_logic;
   
begin
--Unit Under Testing 
uut: decoder4_9 PORT MAP (
          LE => LE,
          Q0 => Q0,
          Q1 => Q1,
          Q2 => Q2,
          Q3 => Q3,
          Q4 => Q4,
          Q5 => Q5,
          Q6 => Q6,
          Q7 => Q7,
          Q8 => Q8,
          
          A0 => A0,
          A1 => A1,
          A2 => A2,
          A3 => A3
          
        ); 
stim_proc: process
    begin		
		wait for 10ns;
		A0 <= '0';
		A1 <= '0';
		A2 <= '0';
		A3 <= '0';
        
        wait for 10ns;
		A0 <= '0';
		A1 <= '0';
		A2 <= '0';
		A3 <= '1';
        
        wait for 10ns;
		A0 <= '0';
		A1 <= '0';
		A2 <= '1';
		A3 <= '0';
        
        wait for 10ns;
		A0 <= '0';
		A1 <= '0';
		A2 <= '1';
		A3 <= '1';
        
        wait for 10ns;
		A0 <= '0';
		A1 <= '1';
		A2 <= '0';
		A3 <= '0';
        
        wait for 10ns;
		A0 <= '0';
		A1 <= '1';
		A2 <= '0';
		A3 <= '1';
        
        wait for 10ns;
		A0 <= '0';
		A1 <= '1';
		A2 <= '1';
		A3 <= '0';
        
        wait for 10ns;
		A0 <= '0';
		A1 <= '1';
		A2 <= '1';
		A3 <= '1';
        
        wait for 10ns;
		A0 <= '1';
		A1 <= '0';
		A2 <= '0';
		A3 <= '0';
        
        

    end process;
end Behavioral;


