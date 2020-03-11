library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity full_adder is
Port ( X : in std_logic;
Y : in std_logic;
Cin : in std_logic;

Gi : out std_logic;
Cout : out std_logic);

end full_adder;
architecture Behavioral of full_adder is

signal AXORB, ABANDCin, AANDB: std_logic;
begin

AXORB <= X xor Y after 1 ns;
Gi <= AXORB xor Cin after 1 ns;
ABANDCin <= AXORB and Cin after 1 ns;
AANDB <= X and Y after 1 ns;
Cout <= AANDB or ABANDCin after 1 ns;

end Behavioral;

