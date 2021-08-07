--divisor de frecuencia
library ieee;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;

entity relojlento is
    port(
        clk     : in std_logic;
        boton   : in std_logic;
        sw      : in std_logic_vector(1 downto 0);
		led     : buffer std_logic:= '0' 
	);
end relojlento;

architecture arqrelojlento of relojlento is
    signal cuenta   : integer range 0 to 25000000;
    signal n        : integer range 0 to 25000000;

begin
    with sw select
        n <=    25000000    when "00",
                2500000     when "01",
                250000      when "10",
                5000        when "11",
                25000000    when others;
    reloj: process(clk)
    begin
        if(clk' event and clk='1') then
            if(cuenta = n) then
                cuenta <= 0;
                led <= not(led);
            elsif boton = '1' then
                cuenta <= cuenta;
            else
                cuenta <= cuenta + 1;
            end if;
        end if;
    end process reloj;
end arqrelojlento;