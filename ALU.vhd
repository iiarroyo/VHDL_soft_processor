
----------------------------------------------------------------------------------
-- Company:        ITESM - Campus Qro.        
-- Engineers:       A01706424 - José Miguel Luna Vega
--                  A01701466 - Carlos Emilio Magana Arias
--                 A01706190 - Israel Ivan Arroyo Parada
-- 
-- Create Date:    06/03/2021
-- Module Name:    ALU
-- Project Name:   
-- Target Devices: FPGA DE10-Lite 
-- Tool versions:  Quartus Prime Lite 18.1
-- Description:     
--
-- Dependencies:   
-- Revision: v1
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------

Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.numeric_std.all;

Entity ALU is
Port ( 
		Sel     : in  std_logic_vector(2 downto 0);
		InA,InB : in  std_logic_vector(7 downto 0);
		Oper    : out std_logic_vector(7 downto 0);
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
				Oper_signal <= unsigned(InA) + unsigned(InB);
				Zero <= '0';
			when "001" => -- sub
				Oper_signal <= unsigned(InA) - unsigned(InB);
				if(Oper_signal = "00000000") then
					Zero <= '1';
				else
					Zero <= '0';
				end if;
			when "010" => -- and
				Oper_signal <= unsigned(InA) and unsigned(InB);
				Zero <= '0';	
			when "011" => -- or
				Oper_signal <= unsigned(InA) or unsigned(InB);
				Zero <= '0';
			when "100" => -- xor
			   Oper_signal <= unsigned(InA) xor unsigned(InB);
				Zero <= '0';
			when "101" => -- not
				Oper_signal <= not(unsigned(InA));
				Zero <= '0';
			when "110" => -- shl
				Oper_signal <= unsigned(InA(6 downto 0)) & '0';
				Zero <= '0';
			when "111" => -- shr
				Oper_signal <= '0' & unsigned(InA (7 downto 1));
				Zero <= '0';
			when others => 
				Oper_signal <= (others => '0');
				Zero <= '0';
							  
		end case;
end process;
			
Oper <= std_logic_vector(Oper_signal);

	
End a;