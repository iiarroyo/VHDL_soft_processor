
----------------------------------------------------------------------------------
-- Company:        ITESM - Campus Qro.        
-- Engineer:       A01706424 - José Miguel Luna Vega
-- 
-- Create Date:    06/03/2021
-- Module Name:    CtrlUnit 
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
		  -- 
	Output<= "100001001000" when Oper = "0000" else --  add
				"100011001000" when Oper = "0001" else --  sub
				"100101001000" when Oper = "0010" else --  and
				"100111001000" when Oper = "0011" else --  or
				"101001001000" when Oper = "0100" else --  xor
				"101011001000" when Oper = "0101" else --  not
				"101101001000" when Oper = "0110" else --  shl
				"101111001000" when Oper = "0111" else --  shr
			 
				"00ZZZ1001000" when Oper = "1000" else --  ld
				"01ZZZ1001000" when Oper = "1001" else --  spc
				"00001000Z100" when Oper = "1010" else --  beq
				"00ZZZ000Z010" when Oper = "1011" else --  ji
				"ZZZZZ000Z001" when Oper = "1100" else --  jr
				"ZZZZZ0101000" when Oper = "1101" else --  w7seg
				"ZZZZZ0011000" when Oper = "1110" else --  wleds
				"11ZZZ1001000" when Oper = "1111" else --  rsw
			 
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

