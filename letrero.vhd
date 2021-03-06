library ieee;
use ieee.std_logic_1164.all;
entity letrero is
port(
    clk         : in std_logic;
    boton       : in std_logic;
    sw          : in std_logic_vector(1 downto 0);
    reset       : in  STD_LOGIC;
    red         : out std_logic_vector(3 DOWNTO 0);
    green       : out std_logic_vector(3 downto 0);
    blue        : out std_logic_vector(3 DOWNTO 0);
    h_sync      : out std_logic;
    v_sync      : out std_logic;
    d1          : out std_logic_vector(6 downto 0);
    d2          : out std_logic_vector(6 downto 0);
    d3          : out std_logic_vector(6 downto 0);
    d4          : out std_logic_vector(6 downto 0);
    d5          : out std_logic_vector(6 downto 0);
    d6          : out std_logic_vector(6 downto 0)
);
end letrero;

architecture arqletrero of letrero is
    signal clk_lento        : std_logic;
    signal bus_direcciones  : std_logic_vector(3 downto 0);
    signal bus_datos        : std_logic_vector(3 downto 0);
    signal bcd              : std_logic_vector(6 downto 0);
    signal display1         : std_logic_vector(6 downto 0);
    signal display2         : std_logic_vector(6 downto 0);
    signal display3         : std_logic_vector(6 downto 0);
    signal display4         : std_logic_vector(6 downto 0);
    signal display5         : std_logic_vector(6 downto 0);
    signal display6         : std_logic_vector(6 downto 0);
    signal display7         : std_logic_vector(6 downto 0);
    signal display8         : std_logic_vector(6 downto 0);
begin
    d1 <= display1;
    d2 <= display2;
    d3 <= display3;
    d4 <= display4;
    d5 <= display5;
    d6 <= display6;
    u1 : entity work.relojlento(arqrelojlento) port map (clk, boton, sw, clk_lento);
    u2 : entity work.contador(arqcontador) port map (clk_lento, reset, bus_direcciones);
    u3 : entity work.rom(arqrom) port map (bus_direcciones, '1', bus_datos);
    u4 : entity work.bcd7seg(arqbcd7seg) port map (bus_datos, bcd);
    u5 : entity work.estados(arqestados) port map (clk_lento, bcd, display1, display2, display3, display4, display5, display6, display7, display8);
    u6 : entity work.VGA(arqVGA) port map (clk, reset, red, green, blue, h_sync, v_sync, display1, display2, display3, display4, display5, display6);
end arqletrero;