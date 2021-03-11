
----------------------------------------------------------------------------------
-- Company:        ITESM - Campus Qro.        
-- Engineers:      A01706424 - José Miguel Luna Vega
--                 A01701466 - Carlos Emilio Magana Arias
--                 A01706190 - Israel Ivan Arroyo Parada
-- 
-- Create Date:    06/03/2021
-- Module Name:    BrEq
-- Project Name:   RISC Processor Design 
-- Target Devices: FPGA DE10-Lite 
-- Tool versions:  Quartus Prime Lite 18.1
-- Description:    Multiplexor used to detect the control 
--                 signals for Program Counter
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

entity BrEq is
	port(
		InA	: in std_logic;
		InB	: in std_logic;
		Sel	: in std_logic;
		M		: out std_logic);
end BrEq;

architecture rtl of BrEq is

  signal c: std_logic;
  
begin
	
	BrEqent: process(Sel,InA,InB)
	begin
		if Sel = '0' then
			c <= InA;
			M <= c;
		else
			c <= InB;
			M <= c;
		end if;
	end process BrEqent;
	
end rtl;