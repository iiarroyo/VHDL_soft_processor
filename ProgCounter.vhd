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