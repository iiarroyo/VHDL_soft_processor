----------------------------------------------------------------------------------
-- Company:        ITESM - Campus Qro.
-- Engineer:       A01706424 - José Miguel Luna Vega
-- 
-- Create Date:    02/22/2021 
-- Design Name: 
-- Module Name:    ClkDiv 
-- Project Name:   
-- Target Devices: FPGA DE10-Lite 
-- Tool versions:  Quartus Prime Lite 18.1
-- Description:    Frequency Divider to convert 50MHz Clock embebed to 1Hz 
--
-- Dependencies:   None
--
-- Revision: v1.0
-- Revision 0.01 - File Created
-- Additional Comments: This code is totally based on profressor Rick Swenson's code 
--                      teached in class
--
----------------------------------------------------------------------------------

-- Library and Package declaration (commonly used)
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity ClkDiv is 	
	port (
		Clkin  : in std_logic;
		Rst    : in std_logic;
		Clkout : out std_logic
	);
end ClkDiv;


architecture rtl of ClkDiv is

  -- Define a value that contains the desired Frequency
  constant DesiredFreq : natural := 1;  -- Once per second changes in the FSM
  -- Frequency for a DE2-Lite board is 50MHz
  constant BoardFreq   : natural := 50_000_000;
  -- Calculate the value the counter should reach to obtain desired Freq.
  constant MaxOscCount : natural := BoardFreq / DesiredFreq;
  -- Pulse counter for the oscillator
  signal OscCount      : natural range 0 to MaxOscCount;
 
begin

	Freq_div: process(rst,Clkin)
	begin 
		if (rst = '0') then
			OscCount <= 0;
		elsif (rising_edge(Clkin)) then
			if(OscCount = MaxOscCount) then
				Clkout   <= '1';
				OscCount <= 0;
			else
				Clkout   <= '0';
				OscCount <= OscCount + 1;
			end if;
		end if;
	end process Freq_div;
end rtl;

