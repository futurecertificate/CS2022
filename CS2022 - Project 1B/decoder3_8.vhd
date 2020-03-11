library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity decoder3_8 is
Port ( 
LE : in std_logic;
A0 : in std_logic;
A1 : in std_logic;
A2 : in std_logic;

Q0 : out std_logic;
Q1 : out std_logic;
Q2 : out std_logic;
Q3 : out std_logic;
Q4 : out std_logic;
Q5 : out std_logic;
Q6 : out std_logic;
Q7 : out std_logic);

end decoder3_8;
architecture Behavioral of decoder3_8 is
begin
Q0<= ((not A0) and (not A1) and (not A2)) and LE ;
Q1<= ((not A0) and (not A1) and A2) and LE ;
Q2<= ((not A0) and A1 and (not A2)) and LE ;
Q3<= ((not A0) and A1 and A2) and LE  ;
Q4<= (A0 and (not A1) and (not A2)) and LE;
Q5<= (A0 and (not A1) and A2) and LE ;
Q6<= (A0 and A1 and (not A2)) and LE ;
Q7<= (A0 and A1 and A2) and LE ;

end Behavioral;


