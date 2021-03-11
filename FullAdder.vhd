----------------------------------------------------------------------------------
-- Company:        ITESM - Campus Qro.        
-- Engineers:      A01706424 - José Miguel Luna Vega
--                 A01701466 - Carlos Emilio Magana Arias
--                 A01706190 - Israel Ivan Arroyo Parada
-- 
-- Create Date:    06/03/2021
-- Module Name:    FullAdder
-- Project Name:   RISC Processor Design 
-- Target Devices: FPGA DE10-Lite 
-- Tool versions:  Quartus Prime Lite 18.1
-- Description:    Module to add to the Program Counter the correspondent increment 
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

Entity FullAdder is
Port ( 
       InA,InB : in std_logic_vector(7 downto 0);
	    S       : out std_logic_vector(7 downto 0)
		);
		
End FullAdder;


Architecture a of FullAdder is

signal S_emb: unsigned (7 downto 0);

Begin
  S_emb <= unsigned(InA) + unsigned(InB);
  S <= std_logic_vector(S_emb);
End a;