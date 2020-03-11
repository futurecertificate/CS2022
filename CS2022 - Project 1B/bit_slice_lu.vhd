library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity bit_slice_lu is
Port ( 
S0 : in std_logic;
S1 : in std_logic;
A : in std_logic;
B : in std_logic;

G: out std_logic
);

end bit_slice_lu;
architecture Behavioral of bit_slice_lu is
begin
G <= (A and B) after 1 ns when S0='0' and S1='0'  else
(A or B) after 1 ns when S0='0' and S1='1' else
(A xor B) after 1 ns when S0='1' and S1='0' else
(not A) after 1 ns when S0='1' and S1='1'  else
'0' after 5 ns;
end Behavioral;