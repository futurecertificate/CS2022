library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity mux2_1 is
    Port (  
            in0 : in  std_logic_vector(7 downto 0);
            in1 : in  std_logic_vector(7 downto 0);
            mc: in std_logic;
            z : out std_logic_vector(7 downto 0));
end mux2_1;

architecture Behavioral of mux2_1 is
begin
    z <=    in0 after 5 ns when mc = '0' else
            in1 after 5 ns when mc = '1' else
            x"00" after 5 ns;
end Behavioral;