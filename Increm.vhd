
----------------------------------------------------------------------------------
-- Company:        ITESM - Campus Qro.        
-- Engineers:      A01706424 - José Miguel Luna Vega
--                 A01701466 - Carlos Emilio Magana Arias
--                 A01706190 - Israel Ivan Arroyo Parada
-- 
-- Create Date:    06/03/2021
-- Module Name:    Increm
-- Project Name:   RISC Processor Design 
-- Target Devices: FPGA DE10-Lite 
-- Tool versions:  Quartus Prime Lite 18.1
-- Description:    Multiplexor used to control the increment
--                 in the Program Counter
-- Dependencies:   
-- Revision: v1
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity Increm is
	port(
		InA	: in std_logic_vector(7 downto 0);
		InB	: in std_logic_vector(7 downto 0);
		Sel	: in std_logic;
		M		: out std_logic_vector(7 downto 0));
end Increm;

architecture rtl of Increm is

  signal c: std_logic_vector(7 downto 0);
  
begin
	
	increment: process(Sel,InA,InB)
	begin
		if Sel = '0' then
			c <= InA;
			M <= c;
		else
			c <= InB;
			M <= c;
		end if;
	end process increment;
	
end rtl;