library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
Port (
A: in std_logic_vector(15 downto 0);
B: in std_logic_vector(15 downto 0);
GS: in std_logic_vector(3 downto 0);

G: out std_logic_vector(15 downto 0);

C: out std_logic;
V: out std_logic
);
end ALU;

architecture Behavioral of ALU is

COMPONENT bit_slice_alu
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
END COMPONENT;


signal G0, G1, G2, G3, G4, G5, G6, G7, G8, G9, G10, G11, G12, G13, G14, G15 : std_logic; -- G out 
signal C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16 : std_logic; -- Carries

begin


balu0: bit_slice_alu PORT MAP(
Cin => GS(0),
A => A(0),
B => B(0),
S0 => GS(1),
S1 => GS(2),
S2 => GS(3),
Cout => C1,
Gi => G0
);

balu1: bit_slice_alu PORT MAP(
Cin => C1,
A => A(1),
B => B(1),
S0 => GS(1),
S1 => GS(2),
S2 => GS(3),
Cout => C2,
Gi => G1
);

balu2: bit_slice_alu PORT MAP(
Cin => C2,
A => A(2),
B => B(2),
S0 => GS(1),
S1 => GS(2),
S2 => GS(3),
Cout => C3,
Gi => G2
);

balu3: bit_slice_alu PORT MAP(
Cin => C3,
A => A(3),
B => B(3),
S0 => GS(1),
S1 => GS(2),
S2 => GS(3),
Cout => C4,
Gi => G3
);

balu4: bit_slice_alu PORT MAP(
Cin => C4,
A => A(4),
B => B(4),
S0 => GS(1),
S1 => GS(2),
S2 => GS(3),
Cout => C5,
Gi => G4
);

balu5: bit_slice_alu PORT MAP(
Cin => C5,
A => A(5),
B => B(5),
S0 => GS(1),
S1 => GS(2),
S2 => GS(3),
Cout => C6,
Gi => G5
);

balu6: bit_slice_alu PORT MAP(
Cin => C6,
A => A(6),
B => B(6),
S0 => GS(1),
S1 => GS(2),
S2 => GS(3),
Cout => C7,
Gi => G6
);

balu7: bit_slice_alu PORT MAP(
Cin => C7,
A => A(7),
B => B(7),
S0 => GS(1),
S1 => GS(2),
S2 => GS(3),
Cout => C8,
Gi => G7
);

balu8: bit_slice_alu PORT MAP(
Cin => C8,
A => A(8),
B => B(8),
S0 => GS(1),
S1 => GS(2),
S2 => GS(3),
Cout => C9,
Gi => G8
);

balu9: bit_slice_alu PORT MAP(
Cin => C9,
A => A(9),
B => B(9),
S0 => GS(1),
S1 => GS(2),
S2 => GS(3),
Cout => C10,
Gi => G9
);

balu10: bit_slice_alu PORT MAP(
Cin => C10,
A => A(10),
B => B(10),
S0 => GS(1),
S1 => GS(2),
S2 => GS(3),
Cout => C11,
Gi => G10
);

balu11: bit_slice_alu PORT MAP(
Cin => C11,
A => A(11),
B => B(11),
S0 => GS(1),
S1 => GS(2),
S2 => GS(3),
Cout => C12,
Gi => G11
);

balu12: bit_slice_alu PORT MAP(
Cin => C12,
A => A(12),
B => B(12),
S0 => GS(1),
S1 => GS(2),
S2 => GS(3),
Cout => C13,
Gi => G12
);

balu13: bit_slice_alu PORT MAP(
Cin => C13,
A => A(13),
B => B(13),
S0 => GS(1),
S1 => GS(2),
S2 => GS(3),
Cout => C14,
Gi => G13
);

balu14: bit_slice_alu PORT MAP(
Cin => C14,
A => A(14),
B => B(14),
S0 => GS(1),
S1 => GS(2),
S2 => GS(3),
Cout => C15,
Gi => G14
);

balu15: bit_slice_alu PORT MAP(
Cin => C15,
A => A(15),
B => B(15),
S0 => GS(1),
S1 => GS(2),
S2 => GS(3),
Cout => C16,
Gi => G15
);

G <= G15 & G14 & G13 & G12 & G11 & G10 & G9 & G8 & G7 & G6 & G5 & G4 & G3 & G2 & G1 & G0 after 1 ns;
V <= C15 xor C16 after 1 ns;
C <= C16 after 1 ns;


end Behavioral;
