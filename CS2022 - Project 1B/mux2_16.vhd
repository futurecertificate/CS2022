library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity mux_2_16 is
port ( 
In0 : in std_logic_vector(15 downto 0);
In1 : in std_logic_vector(15 downto 0);
s : in std_logic;
Z : out std_logic_vector(15 downto 0));

end mux_2_16;
architecture Behavioral of mux_2_16 is
begin
Z <= In0 after 5 ns when S='0' else
In1 after 5 ns when S='1'else
"0000000000000000" after 5 ns;

end Behavioral;


