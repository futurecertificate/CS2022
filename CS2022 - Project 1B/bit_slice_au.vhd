library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity bit_slice_au is
Port ( 
S0: in std_logic;
S1: in std_logic;
A: in std_logic;
B: in std_logic;
Cin: in std_logic;

Gi: out std_logic;
Cout: out std_logic
);

end bit_slice_au;

architecture Behavioral of bit_slice_au is

COMPONENT b_logic_mux
Port (
S0 : in std_logic;
S1 : in std_logic;
B : in std_logic;
Y : out std_logic
);
END COMPONENT;

COMPONENT full_adder
Port ( 
X : in std_logic;
Y : in std_logic;
Cin : in std_logic;

Gi : out std_logic;
Cout : out std_logic
);
END COMPONENT;

signal Yi : std_logic;

begin

b_logic: b_logic_mux PORT MAP(
S0 => S0,
S1 => S1,
Y => Yi,
B => B
);

fa: full_adder PORT MAP(
X => A,
Y => Yi,
Cin => Cin,
Gi => Gi,
Cout => Cout
);

end Behavioral;