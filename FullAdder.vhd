Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.numeric_std.all;

Entity FullAdder is
Port ( 
       InA,InB : in std_logic_vector(7 downto 0);
	    S       : out std_logic_vector(7 downto 0)
		);
		
End FullAdder;


Architecture a of FullAdder is

signal S_emb: unsigned (7 downto 0);

Begin
  S_emb <= unsigned(InA) + unsigned(InB);
  S <= std_logic_vector(S_emb);
End a;