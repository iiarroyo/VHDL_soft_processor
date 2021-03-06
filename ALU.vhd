Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.numeric_std.all;

Entity ALU is
Port ( 
		Sel     : in  unsigned(2 downto 0);
		InA,InB : in  unsigned(7 downto 0);
		Oper    : out unsigned(7 downto 0);
		Zero    : out std_logic
		);
End ALU;


Architecture a of ALU is
signal Oper_signal: unsigned (7 downto 0);

Begin

--rd_aux<=rd_signal_1706190;

process(Sel,InA,InB)
begin
		case Sel is
			when "000" => -- add
				Oper_signal <= InA + InB;
				Zero <= '0';
			when "001" => -- sub
				Oper_signal <= InA - InB;
				if(Oper_signal = "00000000") then
					Zero <= '1';
				else
					Zero <= '0';
				end if;
			when "010" => -- and
				Oper_signal <= InA and InB;
				Zero <= '0';	
			when "011" => -- or
				Oper_signal <= InA or InB;
				Zero <= '0';
			when "100" => -- xor
			   Oper_signal <= InA xor InB;
				Zero <= '0';
			when "101" => -- not
				Oper_signal <= not(InA);
				Zero <= '0';
			when "110" => -- shl
				Oper_signal <= InA(6 downto 0) & '0';
				Zero <= '0';
			when "111" => -- shr
				Oper_signal <= '0' & InA(7 downto 1);
				Zero <= '0';
			when others => 
				Oper_signal <= (others => '0');
				Zero <= '0';
							  
		end case;
end process;
			
Oper <= Oper_signal;

	
End a;