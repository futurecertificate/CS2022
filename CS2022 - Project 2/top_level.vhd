library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity top_level is
  Port (
            reset: in std_logic;
            Clk: in std_logic
  );
end top_level;

architecture Behavioral of top_level is

COMPONENT Microprogrammed_Control Port(
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
END COMPONENT;

COMPONENT datapath_1B Port (

SB: in std_logic_vector(2 downto 0);
AS0: in std_logic;
AS1: in std_logic;
AS2: in std_logic;
AS3: in std_logic;

BS0: in std_logic;
BS1: in std_logic;
BS2: in std_logic;
BS3: in std_logic;

des_A0: in std_logic;
des_A1: in std_logic;
des_A2: in std_logic;
des_A3: in std_logic;

MB_Select: in std_logic;
MD_Select: in std_logic;

Clk: in std_logic;

LE: in std_logic;
FS: in std_logic_vector(4 downto 0);
Data_in: in std_logic_vector(15 downto 0);

MM: in std_logic;
pc_in: in std_logic_vector(15 downto 0);

Add_out : out std_logic_vector(15 downto 0); --Address out
B_out : out std_logic_vector(15 downto 0); --Data Out

V: out std_logic;
C: out std_logic;
Z: out std_logic;
N: out std_logic
);
END COMPONENT;

COMPONENT Memory port (
            data_in : in std_logic_vector(15 downto 0);
            address_in : in std_logic_vector(15 downto 0);
            mw: in std_logic;
            Clk: in std_logic;
            data_out : out std_logic_vector(15 downto 0)
);

END COMPONENT;


--MC outputs



    signal pc_out:  std_logic_vector(15 downto 0);
    signal TD_DR:  std_logic_vector(3 downto 0);
    signal TA_SA:  std_logic_vector(3 downto 0);
    signal TB_SB:  std_logic_vector(3 downto 0);
    signal SB: std_logic_vector(2 downto 0);
    signal mb:  std_logic;
    signal md:  std_logic;
    signal rw:  std_logic;
    signal mm:  std_logic;
    signal mw:  std_logic;
    signal fs:  std_logic_vector(4 downto 0);
   
--Datapath outputs

    signal Add_out :  std_logic_vector(15 downto 0);
    signal B_out :  std_logic_vector(15 downto 0);

    signal V:  std_logic;
    signal C:  std_logic;
    signal Z:  std_logic;
    signal N:  std_logic;

--Memory Outputs
    signal data_out : std_logic_vector(15 downto 0);


begin

mc : Microprogrammed_Control Port Map(
    Clk =>Clk,
    reset => reset,
    data_in =>data_out,
    V=>V,
    C=>C,
    Z=>Z,
    N=>N,
    pc_out=>pc_out,
    TD_DR => TD_DR,
    TA_SA=>TA_SA,
    TB_SB =>TB_SB,
    SB=>SB,
    mb=>mb,
    md =>md,
    rw=>rw,
    mm=>mm,
    mw=>mw,
    fs=>fs
);

dpb : datapath_1B Port Map(
    Clk =>Clk,
    Add_out => Add_out,
    B_out => B_out,
    V=>V,
    C=>C,
    Z=>Z,
    N=>N,
    SB=>SB,
    AS0=>TA_SA(0),
    AS1=>TA_SA(1),
    AS2=>TA_SA(2),
    AS3=>TA_SA(3),
    BS0=>TB_SB(0),
    BS1=>TB_SB(1),
    BS2=>TB_SB(2),
    BS3=>TB_SB(3),
    des_a0=>TD_DR(0),
    des_a1=>TD_DR(1),
    des_a2=>TD_DR(2),
    des_a3=>TD_DR(3),
    mb_select=>mb,
    md_select=>md,
    le=>rw,
    fs=>fs,
    data_in=>data_out,
    mm=>mm,
    pc_in=>pc_out
);

mem : Memory Port Map (
    Clk => Clk,
    address_in =>Add_out,
    data_in=>B_out,
    mw=>mw,
    data_out =>data_out
);
end Behavioral;




