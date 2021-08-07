LIBRARY ieee;
use ieee.std_logic_1164.all;

entity VGA is
    port (
        input_clk                           : in  std_logic;
        reset                               : in  std_logic;
        red                                 : out std_logic_vector(3 DOWNTO 0);
        green                               : out std_logic_vector(3 downto 0);
        blue                                : out std_logic_vector(3 DOWNTO 0);
        h_sync                              : out std_logic;
        v_sync                              : out std_logic;
        display1, display2, display3        : in std_logic_vector(6 downto 0);
        display4, display5, display6        : in std_logic_vector(6 downto 0)
    );
end entity;

architecture arqVGA of VGA is
    constant pixels_y               : integer range 0 to 480:= 170;
    constant pixels_x               : integer range 0 to 640:= 40;
    signal pix_clk, disp_ena        : std_logic;
    signal column, row              : integer;
    signal r1,r2,r3,r4,r5,r6        : std_logic_vector(3 downto 0);
    signal g1,g2,g3,g4,g5,g6        : std_logic_vector(3 downto 0);
    signal b1,b2,b3,b4,b5,b6        : std_logic_vector(3 downto 0);
	signal pixels_out_x1            : integer;
	signal pixels_out_x2            : integer;
	signal pixels_out_x3            : integer;
	signal pixels_out_x4            : integer;
	signal pixels_out_x5            : integer;
    signal pixels_out_x6            : integer;
    signal led1                     : std_logic_vector(6 downto 0);
    signal led2                     : std_logic_vector(6 downto 0);
    signal led3                     : std_logic_vector(6 downto 0);
    signal led4                     : std_logic_vector(6 downto 0);
    signal led5                     : std_logic_vector(6 downto 0);
    signal led6                     : std_logic_vector(6 downto 0);
begin
    u1 : entity work.gen25MHz(arqgen25MHz) port map (input_clk, pix_clk);
    u2 : entity work.controlador_vga(arqcontrolador_vga) port map (pix_clk, h_sync, v_sync, disp_ena, column, row);
    u3 : entity work.bcdVGA(arqbcdVGA) port map (display1, led1);
    u4 : entity work.bcdVGA(arqbcdVGA) port map (display2, led2);
    u5 : entity work.bcdVGA(arqbcdVGA) port map (display3, led3);
    u6 : entity work.bcdVGA(arqbcdVGA) port map (display4, led4);
    u7 : entity work.bcdVGA(arqbcdVGA) port map (display5, led5);
    u8 : entity work.bcdVGA(arqbcdVGA) port map (display6, led6);
    u9 : entity work.generador_imagen(arqgenerador_imagen) port map (disp_ena, row, column, pixels_y, pixels_x, pixels_out_x1, r1,g1,b1, led6);
    u10 : entity work.generador_imagen(arqgenerador_imagen) port map (disp_ena, row, column, pixels_y, pixels_out_x1, pixels_out_x2, r2,g2,b2, led5);
    u11 : entity work.generador_imagen(arqgenerador_imagen) port map (disp_ena, row, column, pixels_y, pixels_out_x2, pixels_out_x3, r3,g3,b3, led4);
    u12 : entity work.generador_imagen(arqgenerador_imagen) port map (disp_ena, row, column, pixels_y, pixels_out_x3, pixels_out_x4, r4,g4,b4, led3);
    u13 : entity work.generador_imagen(arqgenerador_imagen) port map (disp_ena, row, column, pixels_y, pixels_out_x4, pixels_out_x5, r5,g5,b5, led2);
    u14 : entity work.generador_imagen(arqgenerador_imagen) port map (disp_ena, row, column, pixels_y, pixels_out_x5, pixels_out_x6, r6,g6,b6, led1);
    u15 : entity work.uni_color_VGA(arquni_color_VGA) port map (r1,r2,r3,r4,r5,r6,g1,g2,g3,g4,g5,g6,b1,b2,b3,b4,b5,b6,red,green,blue);
end architecture;