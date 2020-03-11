library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity au_mux is
Port ( 
G1 : in std_logic;
G2 : in std_logic;
S2 : in std_logic;

G : out std_logic);
end au_mux;

architecture Behavioral of au_mux is

begin
G <= G1 when S2='0'else
G2 when S2='1'else
'0' after 5 ns;

end Behavioral;
