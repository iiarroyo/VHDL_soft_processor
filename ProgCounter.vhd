
----------------------------------------------------------------------------------
-- Company:        ITESM - Campus Qro.        
-- Engineers:       A01706424 - José Miguel Luna Vega
--                  A01701466 - Carlos Emilio Magana Arias
--                 A01706190 - Israel Ivan Arroyo Parada
-- 
-- Create Date:    06/03/2021
-- Module Name:    ProgCounter
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
use IEEE.std_logic_unsigned.all;

entity ProgCounter is
	port(
		Clk	: in std_logic;
		Rst	: in std_logic;
		Cen	: in std_logic;
		PCIn	: in std_logic_vector(7 downto 0);
		PCOut	: out std_logic_vector(7 downto 0));
end ProgCounter;

architecture rtl of ProgCounter is

  signal Count: std_logic_vector(7 downto 0);
  
begin
	
	counter: process(Clk,Rst)
	begin
		if (Rst = '0') then
			Count <= (others => '0');
			PCOut <= Count;
		elsif (rising_edge(Clk)) then
			if (Cen = '1') then
				Count <= PCIn;
				PCOut <= Count;
			end if;
		end if;
	end process counter;
	
end rtl;