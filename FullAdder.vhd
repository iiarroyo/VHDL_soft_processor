Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.numeric_std.all;

Entity FullAdder is
Port ( 
       InA,InB : in unsigned(7 downto 0);
	    S       : out unsigned(7 downto 0)
		);
		
End FullAdder;


Architecture a of FullAdder is

signal S_emb: unsigned (7 downto 0);

Begin
  S_emb <= InA + InB;
  S <= S_emb;
End a;