LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_ir IS
END tb_ir;
 
ARCHITECTURE behavior OF tb_ir IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT InstructionR
    Port(	IR : in STD_LOGIC_VECTOR(15 downto 0);
			IL, Clk : in STD_LOGIC;
			OPCODE :  out STD_LOGIC_VECTOR(6 downto 0);
			DR, SA, SB : out STD_LOGIC_VECTOR(2 downto 0)
			);
    END COMPONENT;
    

   --Inputs
   signal IR : std_logic_vector(15 downto 0) := (others => '0');
   signal IL : std_logic := '0';
   signal Clk : std_logic := '0';
 	--Outputs
   signal OPCODE : std_logic_vector(6 downto 0);
   signal DR : std_logic_vector(2 downto 0);
   signal SA : std_logic_vector(2 downto 0);
   signal SB : std_logic_vector(2 downto 0);
 
BEGIN
 clk_process :process
   begin
		Clk <= '0';
		wait for 5ns;
		Clk <= '1';
		wait for 5ns;
   end process;
	-- Instantiate the Unit Under Test (UUT)
   uut: InstructionR PORT MAP (
          IR => IR,
          IL => IL,
          OPCODE => OPCODE,
          DR => DR,
          SA => SA,
          SB => SB,
          Clk => Clk
        );
		  
   -- Stimulus process
   stim_proc: process
   begin		
		wait for 10ns;
		IR <= "1111111000010001";
		
		wait for 5ns;
		IL <= '1';
		
		wait for 10ns;
		IR <= "0000000100010000";
		IL <= '0';
		
		wait for 5ns;
		IL <= '1';

      wait;
   end process;

END;
