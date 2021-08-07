library IEEE;
use IEEE.std_logic_1164.all;

entity controlador_vga is
generic(	--constantes para monitor vga en 640x480
    constant h_pulse	:	integer	:=	96;
    constant h_bp	    :	integer	:=	48;
    constant h_pixels	:	integer	:=	640;
    constant h_fp	    :	integer	:=	16;
    constant v_pulse	:	integer	:=	2;
    constant v_bp	    :	integer	:=	33;
    constant v_pixels	:	integer	:=	480;
    constant v_fp	    :	integer	:=	10
);
port ( 	
    clkin    	: in std_logic;
    h_sync      : out std_logic;
	v_sync      : out std_logic;
	display_ena	: out std_logic;
	column		: out integer;
	row 		: out integer 
);
end entity controlador_vga;

architecture arqcontrolador_vga of controlador_vga is
    constant h_period : INTEGER := h_pulse + h_bp + h_pixels + h_fp;
    constant v_period : INTEGER := v_pulse + v_bp + v_pixels + v_fp;    
begin
    process(clkin)
    variable h_count  :  integer range 0 to h_period - 1 := 0;  --horizontal counter (counts the columns)
    variable v_count  :  integer range 0 to v_period - 1 := 0;  --vertical counter (counts the rows)
	begin
    -- 	if(reset_n = '0') then  --reset asserted
		--   h_count := 0;         --reset horizontal counter
		--   v_count := 0;         --reset vertical counter
		--   h_sync <= not h_pol;  --deassert horizontal sync
		--   v_sync <= not v_pol;  --deassert vertical sync
		--   display_ena <= '0';      --disable display
		--   column <= 0;          --reset column pixel coordinate
		--   row <= 0;             --reset row pixel coordinate
		if(clkin'event and clkin = '1') then
			--counters
			if(h_count < h_period - 1) then    --horizontal counter (pixels)
				h_count := h_count + 1;
			else
				h_count := 0;
				if(v_count < v_period - 1) then  --veritcal counter (rows)
					v_count := v_count + 1;
				else
					v_count := 0;
				end if;
			end if;
			
			--horizontal sync signal
			if(h_count > h_pixels + h_fp or h_count > h_pixels + h_fp + h_pulse) then
				h_sync <= '0';    --deassert horiztonal sync pulse
			else
				h_sync <= '1';        --assert horiztonal sync pulse
			end if;

			--vertical sync signal
			if(v_count > v_pixels + v_fp or v_count > v_pixels + v_fp + v_pulse) then
				v_sync <= '0';    --deassert vertical sync pulse
			else
				v_sync <= '1';        --assert vertical sync pulse
			end if;

			--set pixel coordinates
			if(h_count < h_pixels) then  --horiztonal display time
				column <= h_count;         --set horiztonal pixel coordinate
			end if;
			if(v_count < v_pixels) then  --vertical display time
				row <= v_count;            --set vertical pixel coordinate
			end if;

			--set display enable output
			if(h_count < h_pixels and v_count < v_pixels) then  --display time
				display_ena <= '1';                                  --enable display
			else                                                --blanking time
				display_ena <= '0';                                  --disable display
			end if;
		end if;
	end process;
end architecture arqcontrolador_vga;