----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:    
-- Project Name: 
-- Target Devices: MAX10 LITe-10 FPGA board
-- Tool versions: Quartus Prime Lite 18.1
-- Description: 
--
-- Dependencies: 
--
--
----------------------------------------------------------------------------------
-- Library and Package declaration (commonly used)
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity Top is
  port (
     Clk   : in  STD_LOGIC;
	  Rst   : in  STD_LOGIC);
end top;

architecture a of Top is

 component 	FullAdder
   port (
		 InA,InB : in unsigned(7 downto 0);
	    S       : out unsigned(7 downto 0)
		);
 end component;
	
begin
	 
end a;
