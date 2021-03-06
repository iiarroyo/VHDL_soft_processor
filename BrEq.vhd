library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity BrEq is
	port(
		InA	: in std_logic;
		InB	: in std_logic;
		Sel	: in std_logic;
		M		: out std_logic);
end BrEq;

architecture rtl of BrEq is

  signal c: std_logic;
  
begin
	
	BrEqent: process(Sel)
	begin
		if Sel = '0' then
			c <= InA;
			M <= c;
		else
			c <= InB;
			M <= c;
		end if;
	end process BrEqent;
	
end rtl;