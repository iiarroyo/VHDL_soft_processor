Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.numeric_std.all;

Entity DispOff is
Port ( 
		Turnoff    : out std_logic_vector(1 downto 0)
		);
End DispOff;


Architecture a of DispOff is
Begin		
Turnoff <= (others => '0');
End a;