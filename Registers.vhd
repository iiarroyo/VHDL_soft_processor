
----------------------------------------------------------------------------------
-- Company:        ITESM - Campus Qro.        
-- Engineer:       A01706424 - José Miguel Luna Vega
-- 
-- Create Date:    06/03/2021
-- Module Name:    Registers
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

entity Registers is
   port ( 
		SelA  : in  std_logic_vector(2 downto 0); 
		SelB	: in  std_logic_vector(2 downto 0);
		SelWR : in  std_logic_vector(2 downto 0); 
		Data  : in  std_logic_vector(7 downto 0);
		Clk   : in  std_logic;
		Cen   : in  std_logic;
		Rst   : in  std_logic;
		WE    : in  std_logic;
		OutA  : out std_logic_vector(7 downto 0);
		OutB  : out std_logic_vector(7 downto 0)
	);
end Registers;

architecture rlt of Registers is

begin

end rlt;
