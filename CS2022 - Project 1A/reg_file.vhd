library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity reg_file is
Port ( 
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

end reg_file;

architecture Behavioral of reg_file is

COMPONENT reg16
PORT(

D : IN std_logic_vector(15 downto 0);
load : IN std_logic;
Clk : IN std_logic;
Q : OUT std_logic_vector(15 downto 0)
);

END COMPONENT;

COMPONENT mux8_16
PORT(

In0 : IN std_logic_vector(15 downto 0);
In1 : IN std_logic_vector(15 downto 0);
In2 : IN std_logic_vector(15 downto 0);
In3 : IN std_logic_vector(15 downto 0);
In4 : IN std_logic_vector(15 downto 0);
In5 : IN std_logic_vector(15 downto 0);
In6 : IN std_logic_vector(15 downto 0);
In7 : IN std_logic_vector(15 downto 0);

S0 : IN std_logic;
S1 : IN std_logic;
S2 : IN std_logic;
Z : OUT std_logic_vector(15 downto 0)
);
END COMPONENT;  

COMPONENT mux2_16
PORT(

In0 : IN std_logic_vector(15 downto 0);
In1 : IN std_logic_vector(15 downto 0);
s : IN std_logic;
Z : OUT std_logic_vector(15 downto 0)
);
END COMPONENT;

COMPONENT decoder3_8
PORT(

A0 : IN std_logic;
A1 : IN std_logic;
A2 : IN std_logic;
Q0 : OUT std_logic;
Q1 : OUT std_logic;
Q2 : OUT std_logic;
Q3 : OUT std_logic;
Q4 : OUT std_logic;
Q5 : OUT std_logic;
Q6 : OUT std_logic;
Q7 : OUT std_logic
);
END COMPONENT;

signal load_reg0, load_reg1, load_reg2, load_reg3, load_reg4, load_reg5, load_reg6, load_reg7 : std_logic;
signal reg0_q, reg1_q, reg2_q, reg3_q, reg4_q, reg5_q, reg6_q, reg7_q, data_src_mux_out, src_reg : std_logic_vector(15 downto 0);


begin

reg00: reg16 PORT MAP(

D => data_src_mux_out,
load => load_reg0,
Clk => Clk,
Q => reg0_q

);

reg01: reg16 PORT MAP(

D => data_src_mux_out,
load => load_reg1,
Clk => Clk,
Q => reg1_q

);

reg02: reg16 PORT MAP(

D => data_src_mux_out,
load => load_reg2,
Clk => Clk,
Q => reg2_q

);

reg03: reg16 PORT MAP(

D => data_src_mux_out,
load => load_reg3,
Clk => Clk,
Q => reg3_q

);

reg04: reg16 PORT MAP(

D => data_src_mux_out,
load => load_reg4,
Clk => Clk,
Q => reg4_q

);

reg05: reg16 PORT MAP(

D => data_src_mux_out,
load => load_reg5,
Clk => Clk,
Q => reg5_q

);

reg06: reg16 PORT MAP(

D => data_src_mux_out,
load => load_reg6,
Clk => Clk,
Q => reg6_q

);

reg07: reg16 PORT MAP(

D => data_src_mux_out,
load => load_reg7,
Clk => Clk,
Q => reg7_q

);

decoder_3_8: decoder3_8 PORT MAP(

A0 => des_A0,
A1 => des_A1,
A2 => des_A2,

Q0 => load_reg0,
Q1 => load_reg1,
Q2 => load_reg2,
Q3 => load_reg3,
Q4 => load_reg4,
Q5 => load_reg5,
Q6 => load_reg6,
Q7 => load_reg7

);

data_src_mux2_16bit: mux2_16 PORT MAP(

In0 => data,
In1 => src_reg,
s => data_src,
Z => data_src_mux_out

);

Inst_mux2_16bit: mux8_16 PORT MAP(

In0 => reg0_q,
In1 => reg1_q,
In2 => reg2_q,
In3 => reg3_q,
In4 => reg4_q,
In5 => reg5_q,
In6 => reg6_q,
In7 => reg7_q,

S0 => src_s0,
S1 => src_s1,
S2 => src_s2,
Z => src_reg

);
reg0 <= reg0_q;
reg1 <= reg1_q;
reg2 <= reg2_q;
reg3 <= reg3_q;
reg4 <= reg4_q;
reg5 <= reg5_q;
reg6 <= reg6_q;
reg7 <= reg7_q;

end Behavioral;