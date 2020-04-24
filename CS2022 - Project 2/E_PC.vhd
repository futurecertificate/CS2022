library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity E_PC is
	Port(	SR_SB : in STD_LOGIC_VECTOR(5 downto 0);
			signed_extension : out STD_LOGIC_VECTOR(15 downto 0)
			);
end E_PC;

architecture Behavioral of E_PC is
	signal extended_signal : STD_LOGIC_VECTOR(15 downto 0);
begin
	extended_signal(5 downto 0) <= SR_SB;
	extended_signal(15 downto 6) <= "0000000000" when SR_SB(5) = '0' else "1111111111";
	signed_extension <= extended_signal;

end Behavioral;

