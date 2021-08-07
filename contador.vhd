library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity contador is
    port ( 
        clk     : in  std_logic;
        reset   : in  std_logic;
        salida  : out  std_logic_vector(3 downto 0)
    );
end contador;

architecture arqcontador of contador is
begin
    process (reset, clk)
    variable cuenta: std_logic_vector (3 downto 0):= "0000";
    begin
        if rising_edge (clk) then
            if cuenta = "1000" then
                cuenta := "0000";
            else
                cuenta := cuenta + 1;
            end if;
        end if;
        if reset = '1' then
            cuenta:= "0000";
        end if;
        salida <= cuenta;
    end process;
end arqcontador;
