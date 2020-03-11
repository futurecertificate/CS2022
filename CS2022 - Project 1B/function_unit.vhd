library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity function_unit is
Port (
A: in std_logic_vector(15 downto 0);
B: in std_logic_vector(15 downto 0);
FS: in std_logic_vector(4 downto 0);

V: out std_logic;
C: out std_logic;
Z: out std_logic; --return 1 if 0
N: out std_logic; --return MSB
F: out std_logic_vector(15 downto 0)
);
end function_unit;

architecture Behavioral of function_unit is

COMPONENT shifter is
Port (
B: in std_logic_vector(15 downto 0);
HS: in std_logic_vector(1 downto 0);
IL: in std_logic;
IR: in std_logic;

H: out std_logic_vector(15 downto 0) 
);
END COMPONENT;

COMPONENT ALU is
Port (
A: in std_logic_vector(15 downto 0);
B: in std_logic_vector(15 downto 0);
GS: in std_logic_vector(3 downto 0);

G: out std_logic_vector(15 downto 0);
C: out std_logic;
V: out std_logic
);

END COMPONENT;

COMPONENT mux_2_16 is
port ( 
In0 : in std_logic_vector(15 downto 0);
In1 : in std_logic_vector(15 downto 0);
s : in std_logic;
Z : out std_logic_vector(15 downto 0)
);

END COMPONENT;

signal G1, H1: std_logic_vector(15 downto 0);

begin



alu0: ALU PORT MAP(
A => A,
B => B,
GS =>FS(3 downto 0),
G => G1,
C => C,
V => V
);

shifter0: shifter PORT MAP(
B => B,
HS => FS(3 downto 2),
IL => '0',
IR => '0',
H => H1
);

mux: mux_2_16 PORT MAP(
In0 => H1,
In1 => G1,
s =>FS(4),
Z => F
);

N <= G1(15);
Z <= '1' after 5 ns when G1="0000000000000000"else
'0' after 5 ns;

end Behavioral;
