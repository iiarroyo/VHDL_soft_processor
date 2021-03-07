Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.numeric_std.all;

Entity Mux4to1 is
port 
(
	InA,InB,InC,InD : in  std_logic_vector(7 downto 0);
	Sel             : in  std_logic_vector(1 downto 0);
	M               : out std_logic_vector(7 downto 0)
);
end Mux4to1;

architecture a of Mux4to1 is
begin
	Process(InA,InB)
	begin
		case Sel is
			when "00" =>
				M <= InA;
         when "01" =>
            M <= InB;
         when "10" =>
            M <= InC;
         when "11" =>
            M <= InD;
         when others =>
            M <= (others => '0');
        end case;
	end process;
	
end a;
		
			