library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Memory is
    Port (  
            data_in : in std_logic_vector(15 downto 0);
            address_in : in std_logic_vector(15 downto 0);
            mw: in std_logic;
            data_out : out std_logic_vector(15 downto 0));
end Memory;

architecture Behavioral of Memory is
    type mem_array is array(0 to 511) of std_logic_vector(15 downto 0);
begin
    mem_process: process(address_in, data_in)
    variable data_mem: mem_array := (
    --M-0 
    x"0000", --0  
    x"0000", -- R0 <= 0
    x"0041", -- R1 <= 1
    x"0082", -- R2 <= 2
    x"00C3", -- R3 <= 3
    x"0104", -- R4 <= 4
    x"0145", -- R5 <= 5
    x"0186", -- R6 <= 6
    x"01C7", -- R7 <= 7
    b"0000110001010011", --9 ADD R1, R2, R3
    b"0000010100101000", --A R4 <= M[R5]    (LD)
    b"0000011000010011", --B R3 => M[R2]    (SR)
    b"0000001001010011", --C ADI R1, R2, #3
    b"0000100010010000", --D R2 = R2 + 1    (INC)
    b"0000101011011000", --E R2 = NOT R2 
    b"0000111010010001", --F B -> unconditional jump (B) to 010001 (11)
     
    --M-1 
    x"0C52", --0 R1 = R2 + R2 (ADD)
    b"0001000000000010", --1 BC -> conditional branch, z is set (BC)
    x"0E00", x"0000", 
    x"0000", x"0000", x"0000", x"0000", 
    x"0000", x"0000", x"0000", x"0000", 
    x"0000", x"0000", x"0000", x"0000",
    
    --M-2
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    --M-3
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    --M-4
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    --M-5
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    --M-6
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    --M-7
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    --M-8
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    --M-9
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    --M-A
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    --M-B
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    --M-C
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    --M-D
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    --M-E
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    --M-F
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    --M-10
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    --M-11
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    --M-12
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    --M-13
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    --M-14
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    --M-15
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    --M-16
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    --M-17
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    --M-18
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    --M-19
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    --M-1A
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    --M-1B
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    --M-1C
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    --M-1D
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    --M-1E
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    --M-1F
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000");


    variable addr:integer range 0 to 511;
    begin
    addr := conv_integer(address_in(8 downto 0));
    if mw = '1' then
        data_mem(addr) := data_in;
    end if;
    if mw = '0' then
        data_out <= data_mem(addr);
    end if;
    end process;
end Behavioral;