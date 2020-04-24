LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
entity tb_top is
end tb_top;

architecture Behavioral of tb_top is

COMPONENT top_level Port (
            reset: in std_logic;
            Clk: in std_logic
  );
END COMPONENT;

signal Clk :std_logic := '0';
signal reset : std_logic := '0';

begin
   clk_process :process
   begin
		Clk <= '0';
		wait for 5ns;
		Clk <= '1';
		wait for 5ns;
   end process;
   
   uut: top_level PORT MAP (
        Clk=>Clk,
        reset=>reset
   );
   
   stim_proc: process
   begin
   wait for 200 ns;
   reset <= '0';
   
   wait for 200 ns ;
   reset <= '1';
   
   wait for 200 ns;
   reset <='0';
   
   end process;

end Behavioral;
