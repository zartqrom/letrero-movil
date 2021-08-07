library IEEE;
use IEEE.std_logic_1164.all;

entity uni_color_VGA is
port (
    r1,r2,r3,r4,r5,r6   : in std_logic_vector(3 downto 0);
    g1,g2,g3,g4,g5,g6   : in std_logic_vector(3 downto 0);
    b1,b2,b3,b4,b5,b6   : in std_logic_vector(3 downto 0);
    red, green, blue    : out std_logic_vector(3 downto 0)
);
end entity uni_color_VGA;

architecture arquni_color_VGA of uni_color_VGA is
begin
    red     <= r1 or r2 or r3 or r4 or r5 or r6;
    green   <= g1 or g2 or g3 or g4 or g5 or g6;
    blue    <= b1 or b2 or b3 or b4 or b5 or b6;
end architecture arquni_color_VGA;