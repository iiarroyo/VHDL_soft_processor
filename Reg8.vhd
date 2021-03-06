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

  signal c: std_logic_vector(7 downto 0);
  
begin
	
	code: process(Clk,Rst,En)
	begin
		if (Rst = '0') then
			c <= (others => '0');
			OutD <= c;
		elsif (rising_edge(Clk)) then
			if (Cen = '1') and (En = '1') then
				c <= Inrs;
				OutD <= c;
			end if;
		end if;
	end process code;
	
end rtl;