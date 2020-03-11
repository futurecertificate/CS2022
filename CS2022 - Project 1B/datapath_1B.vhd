library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity datapath_1B is
Port (
AS0: in std_logic;
AS1: in std_logic;
AS2: in std_logic;

BS0: in std_logic;
BS1: in std_logic;
BS2: in std_logic;

des_A0: in std_logic;
des_A1: in std_logic;
des_A2: in std_logic;

MB_Select: in std_logic;
MD_Select: in std_logic;

Clk: in std_logic;

LE: in std_logic;
FS: in std_logic_vector(4 downto 0);
Data_in: in std_logic_vector(15 downto 0);

Constant_In: in std_logic_vector(15 downto 0);

A_out : out std_logic_vector(15 downto 0);
B_out : out std_logic_vector(15 downto 0);

V: out std_logic;
C: out std_logic;
Z: out std_logic;
N: out std_logic
);
end datapath_1B;

architecture Behavioral of datapath_1B is

COMPONENT reg_file PORT( 
LE : in std_logic;

AS0 : in std_logic;
AS1 : in std_logic;
AS2 : in std_logic;

BS0 : in std_logic;
BS1 : in std_logic;
BS2 : in std_logic;

des_A0 : in std_logic;
des_A1 : in std_logic;
des_A2 : in std_logic;

Clk : in std_logic;

D_data : in std_logic_vector(15 downto 0);
B_data : out std_logic_vector(15 downto 0);
A_data : out std_logic_vector(15 downto 0)

);
END COMPONENT;

COMPONENT function_unit
Port (
A: in std_logic_vector(15 downto 0);
B: in std_logic_vector(15 downto 0);
FS: in std_logic_vector(4 downto 0);

V: out std_logic;
C: out std_logic;
Z: out std_logic; --return 1 if 0
N: out std_logic; --return MSB
F: out std_logic_vector(15 downto 0)
);

END COMPONENT;

COMPONENT mux_2_16
port ( 
In0 : in std_logic_vector(15 downto 0);
In1 : in std_logic_vector(15 downto 0);
s : in std_logic;
Z : out std_logic_vector(15 downto 0)
);
END COMPONENT;

signal A_data, B_data, B_data_mux_src : std_logic_vector(15 downto 0); --Data coming from register file
signal FZ, D: std_logic_vector(15 downto 0); --Data coming from function unit (relatively)


begin

fu: function_unit PORT MAP(
A=> A_data,
B=> B_data_mux_src,
FS => FS,
V => V,
C => C,
Z => Z,
N => N,
F=>FZ
);

muxB: mux_2_16 PORT MAP(
In0 => B_data,
In1 => Constant_In,
s => MB_Select,
Z => B_data_mux_src
);

muxD: mux_2_16 PORT MAP(
In0 => FZ,
In1 => Data_in,
s => MD_Select,
Z => D
);

regf: reg_file PORT MAP(
LE => LE,
AS0 => AS0,
AS1 => AS1,
AS2 => AS2,

BS0 => BS0,
BS1 => BS1,
BS2 => BS2,

des_A0 => des_A0,
des_A1 => des_A1,
des_A2 => des_A2,

Clk => Clk,
D_Data => D,
A_Data => A_Data,
B_Data => B_Data
);

A_Out <= A_data after 1 ns; 
B_Out <= B_data_mux_src after 1 ns;
end Behavioral;
