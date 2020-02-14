library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb3_8dec is

end tb3_8dec;

architecture Behavioral of tb3_8dec is
COMPONENT decoder3_8
    PORT(
         A0 : IN  std_logic;
         A1 : IN  std_logic;
         A2 : IN  std_logic;
         
         Q0 : out  std_logic;
         Q1 : out  std_logic;
         Q2 : out  std_logic;
         Q3 : out  std_logic;
         Q4 : out  std_logic;
         Q5 : out  std_logic;
         Q6 : out  std_logic;
         Q7 : out  std_logic
        );
    END COMPONENT;
    
     --Inputs
   
   signal A0 : std_logic := '0';
   signal A1 : std_logic := '0';
   signal A2 : std_logic := '0';
    
 	--Outputs
   signal Q0 : std_logic;
   signal Q1 : std_logic;
   signal Q2 : std_logic;
   signal Q3 : std_logic;
   signal Q4 : std_logic;
   signal Q5 : std_logic;
   signal Q6 : std_logic;
   signal Q7 : std_logic;
   
begin
--Unit Under Testing 
uut: decoder3_8 PORT MAP (
          Q0 => Q0,
          Q1 => Q1,
          Q2 => Q2,
          Q3 => Q3,
          Q4 => Q4,
          Q5 => Q5,
          Q6 => Q6,
          Q7 => Q7,
          
          A0 => A0,
          A1 => A1,
          A2 => A2
          
        ); 
stim_proc: process
    begin		
		wait for 10ns;
		A0 <= '0';
		A1 <= '0';
		A2 <= '0';
		

		wait for 10ns;
		A0 <= '0';
		A1 <= '0';
		A2 <= '1';
		
		
		wait for 10ns;
		A0 <= '0';
		A1 <= '1';
		A2 <= '0';
		
		
		wait for 10ns;
		A0 <= '0';
		A1 <= '1';
		A2 <= '1';
		
	   wait for 10ns;
		A0 <= '1';
		A1 <= '0';
		A2 <= '0';
		

		wait for 10ns;
		A0 <= '1';
		A1 <= '0';
		A2 <= '1';
		
		
		wait for 10ns;
		A0 <= '1';
		A1 <= '1';
		A2 <= '0';
		
		
		wait for 10ns;
		A0 <= '1';
		A1 <= '1';
		A2 <= '1';
		
	
    end process;
end Behavioral;
