LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

ENTITY tbreg_file IS
END tbreg_file;
 
ARCHITECTURE behavior OF tbreg_file IS 
 
    
    COMPONENT reg_file
    PORT(
        src_s0 : in std_logic;
        src_s1 : in std_logic;
        src_s2 : in std_logic;

        des_A0 : in std_logic;
        des_A1 : in std_logic;
        des_A2 : in std_logic;

        Clk : in std_logic;
        data_src : in std_logic;

        data : in std_logic_vector(15 downto 0);
        reg0 : out std_logic_vector(15 downto 0);
        reg1 : out std_logic_vector(15 downto 0);
        reg2 : out std_logic_vector(15 downto 0);
        reg3 : out std_logic_vector(15 downto 0);
        reg4 : out std_logic_vector(15 downto 0);
        reg5 : out std_logic_vector(15 downto 0);
        reg6 : out std_logic_vector(15 downto 0);
        reg7 : out std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    
        
        --Inputs
        signal src_s0 : std_logic := '0';
        signal src_s1 : std_logic := '0';
        signal src_s2 : std_logic := '0';
        
        signal des_A0 : std_logic := '0';
        signal des_A1 : std_logic := '0';
        signal des_A2 : std_logic := '0';
        
        signal data_src : std_logic := '0';
        signal clk : std_logic := '0';
        signal data : std_logic_vector(15 downto 0) := (others => '0');
        
        --Outputs
        signal reg0 : std_logic_vector(15 downto 0);
        signal reg1 : std_logic_vector(15 downto 0);
        signal reg2 : std_logic_vector(15 downto 0);
        signal reg3 : std_logic_vector(15 downto 0);
        signal reg4 : std_logic_vector(15 downto 0);
        signal reg5 : std_logic_vector(15 downto 0);
        signal reg6 : std_logic_vector(15 downto 0);
        signal reg7 : std_logic_vector(15 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reg_file PORT MAP (
          src_s0 => src_s0,
          src_s1 => src_s1,
          src_s2 => src_s2,
          
          des_A0 => des_A0,
          des_A1 => des_A1,
          des_A2 => des_A2,
          
          data_src => data_src,
          Clk => clk,
          data => data,
          
          reg0 => reg0,
          reg1 => reg1,
          reg2 => reg2,
          reg3 => reg3,
          reg4 => reg4,
          reg5 => reg5,
          reg6 => reg6,
          reg7 => reg7
          
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for 5ns;
		clk <= '1';
		wait for 5ns;
   end process;

   -- Stimulus process
   stim_proc: process
   begin		
		wait for 10ns;
		des_a0 <= '0';
		des_a1 <= '0';
		des_a2 <= '0';
		data <= x"0000";
		
		wait for 10ns;
		des_a0 <= '0';
		des_a1 <= '0';
		des_a2 <= '1';
		data <= x"1111";
		
		wait for 10ns;
		des_a0 <= '0';
		des_a1 <= '1';
		des_a2 <= '0';
		data <= x"2222";
		
		wait for 10ns;
		des_a0 <= '0';
		des_a1 <= '1';
		des_a2 <= '1';
		data <= x"3333";
		
		wait for 10ns;
		des_a0 <= '1';
		des_a1 <= '0';
		des_a2 <= '0';
		data <= x"4444";
		
		wait for 10ns;
		des_a0 <= '1';
		des_a1 <= '0';
		des_a2 <= '1';
		data <= x"5555";
		
		wait for 10ns;
		des_a0 <= '1';
		des_a1 <= '1';
		des_a2 <= '0';
		data <= x"6666";
		
		wait for 10ns;
		des_a0 <= '1';
		des_a1 <= '1';
		des_a2 <= '1';
		data <= x"7777";
		
		wait for 10ns;
		des_a0 <= '0';
		des_a1 <= '0';
		des_a2 <= '0';
		data <= x"8888";
		
		wait for 10ns;
		des_a0 <= '0';
		des_a1 <= '0';
		des_a2 <= '1';
		data <= x"9999";
		
		wait for 10ns;
		des_a0 <= '0';
		des_a1 <= '1';
		des_a2 <= '0';
		data <= x"AAAA";
		
		wait for 10ns;
		des_a0 <= '0';
		des_a1 <= '1';
		des_a2 <= '1';
		data <= x"BBBB";
		
		wait for 10ns;
		des_a0 <= '1';
		des_a1 <= '0';
		des_a2 <= '0';
		data <= x"CCCC";
		
		wait for 10ns;
		des_a0 <= '1';
		des_a1 <= '0';
		des_a2 <= '1';
		data <= x"DDDD";
		
		wait for 10ns;
		des_a0 <= '1';
		des_a1 <= '1';
		des_a2 <= '0';
		data <= x"EEEE";
		
		wait for 10ns;
		des_a0 <= '1';
		des_a1 <= '1';
		des_a2 <= '1';
		data <= x"FFFF";
   end process;

END;