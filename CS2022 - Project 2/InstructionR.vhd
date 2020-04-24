library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity InstructionR is
	Port(	IR : in STD_LOGIC_VECTOR(15 downto 0);
			IL, Clk : in STD_LOGIC;
			OPCODE :  out STD_LOGIC_VECTOR(6 downto 0);
			DR, SA, SB : out STD_LOGIC_VECTOR(2 downto 0)
			);
end InstructionR;

architecture Behavioral of InstructionR is

begin
    process(Clk)
    begin
    if(rising_edge(Clk)) then
        if IL = '1' then
	        OPCODE <= IR(15 downto 9) after 1ns;
	        DR <= IR(8 downto 6) after 1ns;
	        SA <= IR(5 downto 3) after 1ns;
            SB <= IR(2 downto 0) after 1ns;
        end if;
     end if;
     end process;
end Behavioral;

