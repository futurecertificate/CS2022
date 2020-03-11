library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity shifter is
Port (
B: in std_logic_vector(15 downto 0);
HS: in std_logic_vector(1 downto 0);
IL: in std_logic;
IR: in std_logic;

H: out std_logic_vector(15 downto 0) 
);
end shifter;

architecture Behavioral of shifter is

COMPONENT shifter_mux is
Port (
    I0: in std_logic;
    I1: in std_logic;
    I2: in std_logic;
    HS: in std_logic_vector(1 downto 0);
    H: out std_logic
);

END COMPONENT;

signal H0, H1, H2, H3, H4, H5, H6, H7, H8, H9, H10, H11, H12, H13, H14, H15: std_logic;

begin

m0: shifter_mux PORT MAP(I0 => B(0), I1 => B(1), I2 => IL, HS => HS, H=>H0 ); --0 1 IL
m1: shifter_mux PORT MAP(I0 => B(1), I1 => B(2), I2 => B(0), HS => HS, H=>H1 ); --1 2 0
m2: shifter_mux PORT MAP(I0 => B(2), I1 => B(3), I2 => B(1), HS => HS, H=>H2 ); -- 2 3 1
m3: shifter_mux PORT MAP(I0 => B(3), I1 => B(4), I2 => B(2), HS => HS, H=>H3 ); -- 3 4 2
m4: shifter_mux PORT MAP(I0 => B(4), I1 => B(5), I2 => B(3), HS => HS, H=>H4 ); -- 4 5 3
m5: shifter_mux PORT MAP(I0 => B(5), I1 => B(6), I2 => B(4), HS => HS, H=>H5 ); -- 5 6 4
m6: shifter_mux PORT MAP(I0 => B(6), I1 => B(7), I2 => B(5), HS => HS, H=>H6 ); -- 6 7 5
m7: shifter_mux PORT MAP(I0 => B(7), I1 => B(8), I2 => B(6), HS => HS, H=>H7 ); -- 7 8 6
m8: shifter_mux PORT MAP(I0 => B(8), I1 => B(9), I2 => B(7), HS => HS, H=>H8 ); -- 8 9 7
m9: shifter_mux PORT MAP(I0 => B(9), I1 => B(10), I2 => B(8), HS => HS, H=>H9 ); -- 9 10 8
m10: shifter_mux PORT MAP(I0 => B(10), I1 => B(11), I2 => B(9), HS => HS, H=>H10 ); -- 10 11 9
m11: shifter_mux PORT MAP(I0 => B(11), I1 => B(12), I2 => B(10), HS => HS, H=>H11 ); -- 11 12 10
m12: shifter_mux PORT MAP(I0 => B(12), I1 => B(13), I2 => B(11), HS => HS, H=>H12 ); -- 12 13 11
m13: shifter_mux PORT MAP(I0 => B(13), I1 => B(14), I2 => B(12), HS => HS, H=>H13 ); -- 13 14 12
m14: shifter_mux PORT MAP(I0 => B(14), I1 => B(15), I2 => B(13), HS => HS, H=>H14 ); -- 14 15 13
m15: shifter_mux PORT MAP(I0 => B(15), I1 => IR, I2 => B(14), HS => HS, H=>H15 ); -- 15 IR 14

H <= H15 & H14 & H13 & H12 & H11 & H10 & H9 & H8 & H7 & H6 & H5 & H4 & H3 & H2 & H1 & H0; 

end Behavioral;
