
----------------------------------------------------------------------------------
-- Company:        ITESM - Campus Qro.        
-- Engineers:      A01706424 - José Miguel Luna Vega
--                 A01701466 - Carlos Emilio Magana Arias
--                 A01706190 - Israel Ivan Arroyo Parada
-- 
-- Create Date:    06/03/2021
-- Module Name:    Mux4to1
-- Project Name:   RISC Processor Design 
-- Target Devices: FPGA DE10-Lite 
-- Tool versions:  Quartus Prime Lite 18.1
-- Description:    Multiplexor used in different data buses of the processor 
--
-- Dependencies:   
-- Revision: v1
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------

library ieee;
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
	Process(Sel,InA,InB)
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

        end case;
	end process;
	
end a;
		