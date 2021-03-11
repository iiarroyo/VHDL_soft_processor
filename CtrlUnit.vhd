
----------------------------------------------------------------------------------
-- Company:        ITESM - Campus Qro.        
-- Engineers:      A01706424 - José Miguel Luna Vega
--                 A01701466 - Carlos Emilio Magana Arias
--                 A01706190 - Israel Ivan Arroyo Parada
-- 
-- Create Date:    06/03/2021
-- Module Name:    CtrlUnit
-- Project Name:   RISC Processor Design 
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

entity CtrlUnit is
   Port ( 
		Oper              : in std_logic_vector(3 downto 0);
      RegSrc_Op,JiJr_Op : out std_logic_vector(1 downto 0);
      ALUOp_Op          : out std_logic_vector(2 downto 0);
      RegWrite_Op,Write7Seg_Op,WriteLEDs_Op,PCInc_Op,Beq_Op : out std_logic
	);
end CtrlUnit;

architecture rlt of CtrlUnit is

signal Output : std_logic_vector(11 downto 0);

begin
		  --   RS   ALU   RW  7   L  PC   B   Ji
	Output<= "10"&"000"&'1'&'0'&'0'&'0'&'0'&"00" when Oper = "0000" else --  add
				"10"&"001"&'1'&'0'&'0'&'0'&'0'&"00" when Oper = "0001" else --  sub
				"10"&"010"&'1'&'0'&'0'&'0'&'0'&"00" when Oper = "0010" else --  and
				"10"&"011"&'1'&'0'&'0'&'0'&'0'&"00" when Oper = "0011" else --  or
				"10"&"100"&'1'&'0'&'0'&'0'&'0'&"00" when Oper = "0100" else --  xor
				"10"&"101"&'1'&'0'&'0'&'0'&'0'&"00" when Oper = "0101" else --  not
				"10"&"110"&'1'&'0'&'0'&'0'&'0'&"00" when Oper = "0110" else --  shl
				"10"&"111"&'1'&'0'&'0'&'0'&'0'&"00" when Oper = "0111" else --  shr
			 
				"00"&"000"&'1'&'0'&'0'&'0'&'0'&"00" when Oper = "1000" else --  ld
				"01"&"000"&'1'&'0'&'0'&'0'&'0'&"00" when Oper = "1001" else --  spc
				"00"&"001"&'0'&'0'&'0'&'0'&'1'&"00" when Oper = "1010" else --  beq
				"00"&"000"&'0'&'0'&'0'&'0'&'0'&"10" when Oper = "1011" else --  ji
				"00"&"000"&'0'&'0'&'0'&'0'&'0'&"01" when Oper = "1100" else --  jr
				"00"&"000"&'0'&'1'&'0'&'0'&'0'&"00" when Oper = "1101" else --  w7seg
				"00"&"000"&'0'&'0'&'1'&'0'&'0'&"00" when Oper = "1110" else --  wleds
				"11"&"000"&'1'&'0'&'0'&'0'&'0'&"00" when Oper = "1111" else --  rsw
			 
				"000000000000"; -- All off

	RegSrc_Op 	 <= output(11 downto 10);
	ALUOp_Op  	 <= output(9  downto 7 );
	RegWrite_Op  <= output(6);
	Write7Seg_Op <= output(5);
	WriteLEDs_Op <= output(4);
	PCInc_Op 	 <= output(3);
	Beq_Op 	    <= output(2);
	JiJr_Op 	    <= output(1 downto 0);
	
end rlt;

