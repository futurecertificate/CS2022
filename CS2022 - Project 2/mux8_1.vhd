library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity mux8_1 is
port ( 
MS : in std_logic_vector(2 downto 0);
in0 : in std_logic;
in1 : in std_logic;
in2 : in std_logic;
in3 : in std_logic;
in4 : in std_logic;
in5 : in std_logic;
in6 : in std_logic;
in7 : in std_logic;

MUXS : out std_logic);

end mux8_1;
architecture Behavioral of mux8_1 is
begin
MUXS <= in0 after 1 ns when MS(2) ='0' and MS(1) ='0' and MS(0) ='0' else
in1 after 1 ns when MS(2) ='0' and MS(1) ='0' and MS(0) ='1' else
in2 after 1 ns when MS(2) ='0' and MS(1) ='1' and MS(0) ='0' else
in3 after 1 ns when MS(2) ='0' and MS(1) ='1' and MS(0) ='1' else
in4 after 1 ns when MS(2) ='1' and MS(1) ='0' and MS(0) ='0' else
in5 after 1 ns when MS(2) ='1' and MS(1) ='0' and MS(0) ='1' else
in6 after 1 ns when MS(2) ='1' and MS(1) ='1' and MS(0) ='0' else
in7 after 1 ns when MS(2) ='1' and MS(1) ='1' and MS(0) ='1' else
'0' after 1 ns;
end Behavioral;
