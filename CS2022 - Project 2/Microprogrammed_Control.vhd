library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Microprogrammed_Control is
  Port (
            data_in: in std_logic_vector(15 downto 0);
            V: in std_logic;
            C: in std_logic;
            Z: in std_logic; --return 1 if 0
            N: in std_logic; --return MSB
            reset: in std_logic;
            Clk: in std_logic;
            pc_out: out std_logic_vector(15 downto 0);
            TD_DR: out std_logic_vector(3 downto 0);
            TA_SA: out std_logic_vector(3 downto 0);
            TB_SB: out std_logic_vector(3 downto 0);
            SB: out std_logic_vector(2 downto 0);
            mb: out std_logic;
            md: out std_logic;
            rw: out std_logic;
            mm: out std_logic;
            mw: out std_logic;
            fs: out std_logic_vector(4 downto 0)
  );
end Microprogrammed_Control;

architecture Behavioral of Microprogrammed_Control is

COMPONENT InstructionR Port(
	IR : in STD_LOGIC_VECTOR(15 downto 0);
	IL, Clk : in STD_LOGIC;
	OPCODE :  out STD_LOGIC_VECTOR(6 downto 0);
	DR, SA, SB : out STD_LOGIC_VECTOR(2 downto 0)
);
END COMPONENT;

COMPONENT E_PC  Port(
	SR_SB : in STD_LOGIC_VECTOR(5 downto 0);
	signed_extension : out STD_LOGIC_VECTOR(15 downto 0)
);
END COMPONENT;

COMPONENT mux2_1 Port (  
    in0 : in  std_logic_vector(7 downto 0);
    in1 : in  std_logic_vector(7 downto 0);
    mc: in std_logic;
    z : out std_logic_vector(7 downto 0)
 );
END COMPONENT;

COMPONENT mux8_1 port ( 
    MS : in std_logic_vector(2 downto 0);
    in0 : in std_logic;
    in1 : in std_logic;
    in2 : in std_logic;
    in3 : in std_logic;
    in4 : in std_logic;
    in5 : in std_logic;
    in6 : in std_logic;
    in7 : in std_logic;

    MUXS : out std_logic
);
END COMPONENT;

COMPONENT PCreg Port(	
    seAD : in STD_LOGIC_VECTOR(15 downto 0);
	PL, PI, reset, Clk : in STD_LOGIC;
	PC : out STD_LOGIC_VECTOR(15 downto 0)
);
END COMPONENT;

COMPONENT CAR Port(	
    Cmux : in STD_LOGIC_VECTOR(7 downto 0);
	Smux, reset, Clk : in STD_LOGIC;
	car_out : out STD_LOGIC_VECTOR(7 downto 0)
);
END COMPONENT;

COMPONENT ControlMemory Port(	
    in_car : in STD_LOGIC_VECTOR(7 downto 0);
	MW, MM, RW, MD, MB, TB, TA, TD, PL, PI, IL, MC : out STD_LOGIC;
	FS_cm : out STD_LOGIC_VECTOR(4 downto 0);
	MS_cm : out STD_LOGIC_VECTOR(2 downto 0);
	NA : out STD_LOGIC_VECTOR(7 downto 0)
);
END COMPONENT;


signal IL : std_logic;
signal PL : std_logic;
signal PI : std_logic;
signal MC : std_logic;
signal NA : std_logic_vector(7 downto 0);
signal MS : std_logic_vector(2 downto 0);
signal TD : std_logic;
signal TB : std_logic;
signal TA : std_logic;

signal notZ : std_logic;
signal notC : std_logic;
signal SR_SB : std_logic_vector(5 downto 0);
signal pad_OPCODE : std_logic_vector(7 downto 0);
signal CAR_in : std_logic_vector(7 downto 0);
signal OPCODE : STD_LOGIC_VECTOR(6 downto 0);
signal DRout : std_logic_vector(2 downto 0);
signal SAout : std_logic_vector(2 downto 0);
signal SBout : std_logic_vector(2 downto 0);
signal muxs_out : std_logic;
signal extended_pc : std_logic_vector(15 downto 0);
signal mem_in : std_logic_vector(7 downto 0);

begin

ir : InstructionR Port Map(
    IR=>data_in,
    IL=>IL,
    Clk=>Clk,
    OPCODE =>OPCODE,
    DR => DRout,
    SA => SAout,
    SB => SBout   
    

);
SR_SB <= DRout & SBout;
epc : E_PC Port Map(
    SR_SB => SR_SB,
    signed_extension => extended_pc
);

pc : PCreg Port Map(
    seAD =>extended_pc,
    PL => PL,
    PI => PI,
    Clk => Clk,
    reset => reset,
    PC => pc_out

);

pad_OPCODE <= '0' & OPCODE;
muxc : mux2_1 Port Map (
    In0 => NA,
    In1 => pad_OPCODE,
    mc => MC,
    z => CAR_in

);


notZ <= not Z;
notC <= not C;

muxs : mux8_1 Port Map (
    ms => MS,
    in0 => '0',
    in1 => '1',
    in2 => C,
    in3 => V,
    in4 => Z,
    in5 => N,
    in6 => notC,
    in7 => notZ,
    MUXS => muxs_out
    
);

car0 : CAR Port Map (
    Cmux =>CAR_in,
    Smux => muxs_out,
    reset => reset,
    Clk => Clk,
    car_out => mem_in
);


--MW, MM, RW, MD, MB, TB, TA, TD, PL, PI, IL, MC
cm : ControlMemory Port Map (
    in_car => mem_in,
    MW => mw,
    MM => mm,
    RW => rw,
    MB => mb,
    MD => md,
    TA => TA,
    TB => TB,
    TD => TD,
    PL => PL,
    PI => PI,
    IL => IL,
    MC => MC,
    FS_cm => fs,
    MS_cm => MS,
    NA =>NA

);
TD_DR(0) <= TD;
TD_DR(3 downto 1) <= DRout;

TA_SA(0) <= TA;
TA_SA(3 downto 1) <= SAout;

TB_SB(0) <= TB;
TB_SB(3 downto 1) <= SBout;

SB<= SBout;

end Behavioral;




