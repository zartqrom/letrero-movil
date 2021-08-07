library ieee;
use ieee.std_logic_1164.all;
entity bcdvga is
port(	bcd : in std_logic_vector(6 downto 0);
		led : out std_logic_vector(6 downto 0)
);
end bcdvga;
architecture arqbcdvga of bcdvga is
begin
	with bcd select
	led <=		"0111111" when "1000000",
				"0000110" when "1111001",
				"1011011" when "0100100",
				"1001111" when "0110000",
				"1100110" when "0011001",
				"1101101" when "0010010",
				"1111101" when "0000010",
				"0000111" when "1111000",
				"1111111" when "0000000",
				"1100111" when "0011000",
				"1000000" when others;
end arqbcdvga;