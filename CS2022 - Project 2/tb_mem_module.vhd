LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_mem_module IS
END tb_mem_module;
 
ARCHITECTURE behavior OF tb_mem_module IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Memory
    Port (  
            data_in : in std_logic_vector(15 downto 0);
            address_in : in std_logic_vector(15 downto 0);
            mw: in std_logic;
            data_out : out std_logic_vector(15 downto 0)
            );
    END COMPONENT;
    

   --Inputs
   signal address_in : std_logic_vector(15 downto 0) := (others => '0');
   signal data_in : std_logic_vector(15 downto 0) := (others => '0');
   signal mw : std_logic := '0';

 	--Outputs
   signal data_out : std_logic_vector(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Memory PORT MAP (
          address_in => address_in,
          data_in => data_in,
          mw => mw,
          data_out => data_out
        );

   -- Stimulus process
   stim_proc: process
   begin		
		wait for 10ns;
		mw <='1';
		data_in <= x"0E00";
		address_in <= x"0000";
		
		wait for 10 ns;
		mw <= '0';
		wait for 200ns;
		
		address_in <= x"0001";
		
		wait for 200ns;
		address_in <= x"0006";
		
		wait for 200ns;
		address_in <= x"0007";

      wait;
   end process;

END;
