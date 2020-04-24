library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CAR is
	Port(	Cmux : in STD_LOGIC_VECTOR(7 downto 0);
			Smux, reset, Clk : in STD_LOGIC;
			car_out : out STD_LOGIC_VECTOR(7 downto 0)
			);
end CAR;

architecture Behavioral of CAR is

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

	process(reset, Cmux, Clk)
	variable car : STD_LOGIC_VECTOR(7 downto 0);
	
	begin
	if rising_edge(Clk) then
		if(reset = '1') then car := x"C0";
		elsif(Smux = '1') then car := Cmux;
		elsif(Smux = '0') then
			
			GS <= x"1";
			Ain <= x"00" & Cmux;
			Bin <= x"0000";
			car := ALUout(7 downto 0);
			
		end if;
		car_out <= car after 20ns;
	end if;
	end process;
end Behavioral;

