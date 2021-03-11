----------------------------------------------------------------------------------
-- Company:        ITESM - Campus Qro.        
-- Engineers:      A01706424 - José Miguel Luna Vega
--                 A01701466 - Carlos Emilio Magana Arias
--                 A01706190 - Israel Ivan Arroyo Parada
-- 
-- Create Date:    06/03/2021
-- Module Name:    DispOff
-- Project Name:   RISC Processor Design 
-- Target Devices: FPGA DE10-Lite 
-- Tool versions:  Quartus Prime Lite 18.1
-- Description:    Module to turn off the unused ports 
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

entity DispOff is
port ( 
		Turnoff    : out std_logic_vector(1 downto 0)
	);
end DispOff;


architecture a of DispOff is
begin		
	Turnoff <= (others => '0');
End a;