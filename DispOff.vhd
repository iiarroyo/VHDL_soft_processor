

----------------------------------------------------------------------------------
-- Company:        ITESM - Campus Qro.        
-- Engineers:       A01706424 - José Miguel Luna Vega
--                  A01701466 - Carlos Emilio Magana Arias
--                 A01706190 - Israel Ivan Arroyo Parada
-- 
-- Create Date:    06/03/2021
-- Module Name:    DispOff
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

Entity DispOff is
Port ( 
		Turnoff    : out std_logic_vector(1 downto 0)
		);
End DispOff;


Architecture a of DispOff is
Begin		
Turnoff <= (others => '0');
End a;