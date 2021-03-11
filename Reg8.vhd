----------------------------------------------------------------------------------
-- Company:        ITESM - Campus Qro.        
-- Engineers:      A01706424 - José Miguel Luna Vega
--                 A01701466 - Carlos Emilio Magana Arias
--                 A01706190 - Israel Ivan Arroyo Parada
-- 
-- Create Date:    06/03/2021
-- Module Name:    Reg8
-- Project Name:   RISC Processor Design 
-- Target Devices: FPGA DE10-Lite 
-- Tool versions:  Quartus Prime Lite 18.1
-- Description:    Register to give data to output devices 
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

entity Reg8 is
	port(
		Clk	: in std_logic;
		Rst	: in std_logic;
		Cen	: in std_logic;
		En		: in std_logic;
		Inrs	: in std_logic_vector(7 downto 0);
		OutD	: out std_logic_vector(7 downto 0));
end Reg8;

architecture rtl of Reg8 is
  
begin
	
	code: process(Clk,Rst,En)
	begin
		if (Rst = '0') then
			OutD <=  (others => '0');
		elsif (falling_edge(Clk)) then
			if (Cen = '1') and (En = '1') then
				OutD <= Inrs;
			end if;
		end if;
	end process code;
	
end rtl;