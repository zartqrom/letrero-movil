LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY gen25MHz IS
	PORT(	
		clkin : in std_logic;
		clkout : inout std_logic
	);
END gen25MHz;

ARCHITECTURE arqgen25MHz OF gen25MHz IS
begin
	relojpixel: process (clkin) is
	begin
		if rising_edge(clkin) then
			clkout <= not clkout;
		end if;
	end process relojpixel; -- 25mhz
END arqgen25MHz;
