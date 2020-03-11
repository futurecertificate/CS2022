library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity b_logic_mux is
Port ( 
S0 : in std_logic;
S1 : in std_logic;
B : in std_logic;

Y : out std_logic);

end b_logic_mux;
architecture Behavioral of b_logic_mux is
begin
Y <= ((S0 and B) or (S1 and (not B))) after 1 ns;

end Behavioral;

