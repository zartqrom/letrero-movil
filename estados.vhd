--contador
library ieee;
use ieee.std_logic_1164.all;

entity estados is
	port (
		clk			: in std_logic;
		dato		: in std_logic_vector(6 downto 0);
		display1 	: buffer std_logic_vector(6 downto 0);
		display2 	: buffer std_logic_vector(6 downto 0);
		display3 	: buffer std_logic_vector(6 downto 0);
		display4 	: buffer std_logic_vector(6 downto 0);
		display5 	: buffer std_logic_vector(6 downto 0);
		display6 	: buffer std_logic_vector(6 downto 0);
		display7 	: buffer std_logic_vector(6 downto 0);
		display8 	: buffer std_logic_vector(6 downto 0)
	);
end entity;

architecture arqestados of estados is
begin
	display1 <= dato;
	process(clk) 
	begin
		if rising_edge(clk) then
			display2 <= display1;
			display3 <= display2;
			display4 <= display3;
			display5 <= display4;
			display6 <= display5;
			display7 <= display6;
			display8 <= display7;
		end if;	
	end process;
end arqestados;