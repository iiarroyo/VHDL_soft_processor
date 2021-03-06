library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity Increm is
	port(
		InA	: in std_logic_vector(7 downto 0) := "00000001";
		InB	: in std_logic_vector(7 downto 0);
		Sel	: in std_logic;
		M		: out std_logic_vector(7 downto 0));
end Increm;

architecture rtl of Increm is

  signal c: std_logic_vector(7 downto 0);
  
begin
	
	increment: process(Sel)
	begin
		if Sel = '0' then
			c <= InA;
			M <= c;
		else
			c <= InB;
			M <= c;
		end if;
	end process increment;
	
end rtl;