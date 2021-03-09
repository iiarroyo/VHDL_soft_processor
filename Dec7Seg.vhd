

----------------------------------------------------------------------------------
-- Company:        ITESM - Campus Qro.        
-- Engineers:       A01706424 - José Miguel Luna Vega
--                  A01701466 - Carlos Emilio Magana Arias
--                 A01706190 - Israel Ivan Arroyo Parada
-- 
-- Create Date:    06/03/2021
-- Module Name:    Dec7Seg
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

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Dec7Seg is
   Port ( 
		D   : in  std_logic_vector(3 downto 0);
		Seg : out std_logic_vector(7 downto 0)
	);
end Dec7Seg;

architecture rlt of Dec7Seg is

begin
		  -- 0123456
	Seg <= "00000011" when D = "0000" else -- 0
			 "10011111" when D = "0001" else -- 1
			 "00100101" when D = "0010" else -- 2
			 "00001101" when D = "0011" else -- 3
			 "10011001" when D = "0100" else -- 4
			 "01001001" when D = "0101" else -- 5
			 "01000001" when D = "0110" else -- 6
			 "00011111" when D = "0111" else -- 7
			 "00000001" when D = "1000" else -- 8
			 "00001001" when D = "1001" else -- 9
			 "00010011" when D = "1010" else -- A
			 "11000001" when D = "1011" else -- b
			 "01100011" when D = "1100" else -- C
			 "10000101" when D = "1101" else -- d
			 "01100001" when D = "1110" else -- E
			 "01110001" when D = "1111" else -- F
			 "11111111"; -- All off

end rlt;

