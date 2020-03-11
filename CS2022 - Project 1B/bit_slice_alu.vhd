library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity bit_slice_alu is
Port (
 Cin: in std_logic;
 A: in std_logic;
 B: in std_logic;
 S0: in std_logic;
 S1: in std_logic;
 S2: in std_logic;
 
 Cout: out std_logic;
 Gi: out std_logic 
);
end bit_slice_alu;

architecture Behavioral of bit_slice_alu is

COMPONENT bit_slice_au
Port ( 
S0: in std_logic;
S1: in std_logic;
A: in std_logic;
B: in std_logic;
Cin: in std_logic;

Gi: out std_logic;
Cout: out std_logic
);
END COMPONENT;

COMPONENT bit_slice_lu
Port ( 
S0 : in std_logic;
S1 : in std_logic;
A : in std_logic;
B : in std_logic;

G: out std_logic
);
END COMPONENT;

COMPONENT au_mux
Port ( 
G1 : in std_logic;
G2 : in std_logic;
S2 : in std_logic;

G : out std_logic);
END COMPONENT;

signal G1, G2 : std_logic;

begin

au: bit_slice_au PORT MAP(
S0 => S0,
S1 => S1,
A => A,
B => B,
Cin => Cin,
Gi => G1,
Cout => Cout
);

lu: bit_slice_lu PORT MAP(
S0 => S0,
S1 => S1,
A => A,
B => B,
G => G2
);

mux: au_mux PORT MAP(
G1=> G1,
G2=> G2,
S2=> S2,
G=>Gi
);



end Behavioral;