library IEEE;
use IEEE.std_logic_1164.all;

entity generador_imagen is
port (
    display_ena             : in std_logic;
    row                     : in integer;
    column                  : in integer;
    pixels_y                : in integer;
    pixels_x                : in integer;
    pix_out_x               : out integer;
    red                     : out std_logic_vector(3 downto 0);
    green                   : out std_logic_vector(3 downto 0);
    blue                    : out std_logic_vector(3 downto 0);
    led                     : in std_logic_vector(6 downto 0)
);
end entity generador_imagen;

architecture arqgenerador_imagen of generador_imagen is
begin
    generador_imagen: process(display_ena, row, column, led)
	begin
        if(display_ena = '1') then
            --barra de arriba
            if ((row > pixels_y and row < pixels_y+20) and (column > pixels_x and column < pixels_x+40) and led(0) ='1') THEN 
                red <= (OTHERS => '1');
                green<=(OTHERS => '1');
                blue<=(OTHERS => '1');
            --Laterales de arriba derecha
            elsif ((row > pixels_y+20 and row < pixels_y+60) and (column > pixels_x+40 and column < pixels_x+55) and led(1) = '1') THEN 
                red <= (OTHERS => '1');
                green<=(OTHERS => '1');
                blue<=(OTHERS => '1');
            --Laterales de abajo derecha
            elsif ((row > pixels_y+80 and row < pixels_y+120) and (column > pixels_x+40 and column < pixels_x+55) and led(2) = '1') THEN 
                red <= (OTHERS => '1');
                green<=(OTHERS => '1');
                blue<=(OTHERS => '1');
            --barra de abajo
            elsif ((row > pixels_y+120 and row < pixels_y+140) and (column > pixels_x and column < pixels_x+40) and led(3) = '1') THEN 
                red <= (OTHERS => '1');
                green<=(OTHERS => '1');
                blue<=(OTHERS => '1'); 
            --Laterales de abajo izquierda
            elsif ((row > pixels_y+80 and row < pixels_y+120) and (column > pixels_x-15 and column < pixels_x) and led(4) = '1') THEN 
                red <= (OTHERS => '1');
                green<=(OTHERS => '1');
                blue<=(OTHERS => '1');
            --Laterales de arriba izquierda                
            elsif ((row > pixels_y+20 and row < pixels_y+60) and (column > pixels_x-15 and column < pixels_x) and led(5) = '1') THEN 
                red <= (OTHERS => '1');
                green<=(OTHERS => '1');
                blue<=(OTHERS => '1');
            --barra de en medio
            elsif ((row > pixels_y+60 and row < pixels_y+80) and (column > pixels_x and column < pixels_x+40) and led(6) = '1') THEN 
                red <= (OTHERS => '1');
                green<=(OTHERS => '1');
                blue<=(OTHERS => '1');
            else
                red <= (OTHERS => '0');
                green<=(OTHERS => '0');
                blue<=(OTHERS => '0');
            end if;
            pix_out_x <= pixels_x + 90;
        end if;
	end process generador_imagen;
end architecture arqgenerador_imagen;
