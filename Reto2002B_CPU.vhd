
----------------------------------------------------------------------------------
-- Company:        ITESM - Campus Qro.        
-- Engineer:       A01706424 - José Miguel Luna Vega
-- 
-- Create Date:    06/03/2021
-- Module Name:    Reto2002B_CPU (TOP) 
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

entity Reto2002B_CPU is

   Port ( 
		-- CtrlUnit
		
		--For Dec7Seg
		D    : in  std_logic_vector(7 downto 0);
		SegH : out std_logic_vector(7 downto 0);
		SegL : out std_logic_vector(7 downto 0)
	);
end Reto2002B_CPU;

architecture rlt of Reto2002B_CPU is

	component Dec7Seg
	port (
		D   : in  std_logic_vector(3 downto 0);
		Seg : out std_logic_vector(7 downto 0)
	);
	end component;
 
	component CtrlUnit
	   Port ( 
		Oper              : in std_logic_vector(3 downto 0);
      RegSrc_Op,JiJr_Op : out std_logic_vector(1 downto 0);
      ALUOp_Op          : out std_logic_vector(2 downto 0);
      RegWrite_Op,Write7Seg_Op,WriteLEDs_Op,PCInc_Op,Beq_Op : out std_logic
	);
	end component;

	signal Opcode      : std_logic_vector(3 downto 0);
	
   signal RegSrc,JiJr : std_logic_vector(1 downto 0);
   signal ALUOp       : std_logic_vector(2 downto 0);
   signal RegWrite,Write7Seg,WriteLEDs,PCInc,Beq :  std_logic;
 
begin

	C03 : CtrlUnit
	port map (
		Oper         => Opcode,
		RegSrc_OP    => RegSrc,
      JiJr_Op      => JiJr,
      ALUOp_Op     => ALUOp, 
      RegWrite_Op  => RegWrite,
		Write7Seg_Op => Write7Seg,
		WriteLEDs_Op => WriteLEDs,
		PCInc_Op     => PCInc,
		Beq_Op       => Beq
	);

   C13 : Dec7Seg
	port map (
		D   => D(7 downto 4),
		Seg => SegH  
	);
	
	C14 : Dec7Seg
	port map (
		D   => D(3 downto 0),
		Seg => SegL 
	);  
	
end rlt;

