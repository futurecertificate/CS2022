library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity shifter_mux is
Port (
    I0: in std_logic;
    I1: in std_logic;
    I2: in std_logic;
    HS: in std_logic_vector(1 downto 0);
    H: out std_logic
);
end shifter_mux;

architecture Behavioral of shifter_mux is

begin
H <= I0 after 5 ns when HS="00" else
I1 after 5 ns when HS= "01" else
I2 after 5 ns when HS = "10" else
'0' after 5 ns;

end Behavioral;
