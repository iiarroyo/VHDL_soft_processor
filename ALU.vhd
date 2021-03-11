----------------------------------------------------------------------------------
-- Company:        ITESM - Campus Qro.        
-- Engineers:       A01706424 - José Miguel Luna Vega
--                  A01701466 - Carlos Emilio Magana Arias
--                 A01706190 - Israel Ivan Arroyo Parada
-- 
-- Create Date:    06/03/2021
-- Module Name:    ALU
-- Project Name:   RISC Processor Design 
-- Target Devices: FPGA DE10-Lite 
-- Tool versions:  Quartus Prime Lite 18.1
-- Description:    Arithmetic Logic Unit with 8 operations and a Zero flag
--
-- Dependencies:   
-- Revision: v1
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------

Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
Entity ALU is
Port ( 
		Sel     : in  std_logic_vector(2 downto 0);
		InA,InB : in  std_logic_vector(7 downto 0);
		Oper    : out std_logic_vector(7 downto 0);
		Zero    : out std_logic
		);
End ALU;


Architecture a of ALU is

signal aux : std_logic_vector(7 downto 0);

Begin

process(Sel,InA,InB)
begin
		case Sel is
			when "000" => -- add
				Oper <= InA + InB;
				Zero <= '0';
			when "001" => -- sub
				Oper <= InA - InB;
				aux <= InA - InB;
				if(aux = "00000000") then
					Zero <= '1';
				else
					Zero <= '0';
				end if;
			when "010" => -- and
				Oper <= InA and InB;
				Zero <= '0';	
			when "011" => -- or
				Oper <= InA or InB;
				Zero <= '0';
			when "100" => -- xor
			   Oper <= InA xor InB;
				Zero <= '0';
			when "101" => -- not
				Oper <= not(InA);
				Zero <= '0';
			when "110" => -- shl
				Oper <= InA(6 downto 0) & '0';
				Zero <= '0';
			when "111" => -- shr
				Oper <= '0' & InA (7 downto 1);
				Zero <= '0';
			when others => 
				Oper <= (others => '0');
				Zero <= '0';
		end case;
		
end process;
	
End a;