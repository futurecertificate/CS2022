library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PCreg is
	Port(	seAD : in STD_LOGIC_VECTOR(15 downto 0);
			PL, PI, reset, Clk : in STD_LOGIC;
			PC : out STD_LOGIC_VECTOR(15 downto 0)
			);
end PCreg;

architecture Behavioral of PCreg is

COMPONENT ALU
Port (
    A: in std_logic_vector(15 downto 0);
    B: in std_logic_vector(15 downto 0);
    GS: in std_logic_vector(3 downto 0);
    
    G: out std_logic_vector(15 downto 0);

    C: out std_logic;
    V: out std_logic
    );
END COMPONENT;

    signal Ain, Bin, ALUout : std_logic_vector(15 downto 0);
    signal GS : std_logic_vector(3 downto 0);

begin

alu_op: ALU PORT MAP(
A => Ain,
B => Bin,
GS => GS,

G => ALUout
);


	process(Clk, reset, PL, PI)
	variable PCv : STD_LOGIC_VECTOR(15 downto 0);
	
	begin
	if(rising_edge(Clk)) then
		if(reset = '1') then PCv := x"0000";
		elsif(PL = '1') then
		    GS  <= x"2";
		    Ain <= PCv; 
		    Bin <= seAD;
			PCv := ALUout;
		elsif(PI = '1') then
			GS <= x"1";
			Ain <= PCv;
			Bin <= x"0000";
			PCv := ALUout;
			
		end if;
		PC <= PCv after 2ns;
	end if;
	end process;

end Behavioral;

