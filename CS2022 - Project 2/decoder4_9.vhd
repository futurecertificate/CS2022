library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity decoder4_9 is
Port ( 
LE : in std_logic;
A0 : in std_logic;
A1 : in std_logic;
A2 : in std_logic;
A3 : in std_logic;


Q0 : out std_logic;
Q1 : out std_logic;
Q2 : out std_logic;
Q3 : out std_logic;
Q4 : out std_logic;
Q5 : out std_logic;
Q6 : out std_logic;
Q7 : out std_logic;
Q8 : out std_logic
);

end decoder4_9;
architecture Behavioral of decoder4_9 is
begin
Q0<=((not A0)and (not A1)and (not A2)and(not A3)) and LE;
Q1<=((not A0)and (not A1)and (not A2)and(A3)) and LE;
Q2<=((not A0)and (not A1)and (A2)and(not A3)) and LE;
Q3<=((not A0)and (not A1)and (A2)and(A3)) and LE;
Q4<=((not A0)and (A1)and (not A2)and(not A3)) and LE;
Q5<=((not A0)and (A1)and (not A2)and(A3)) and LE;
Q6<=((not A0)and (A1)and (A2)and(not A3)) and LE;
Q7<=((not A0)and (A1)and (A2)and(A3)) and LE;
Q8<=((A0)and (not A1)and (not A2)and(not A3)) and LE;

end Behavioral;


