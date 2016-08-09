-------------------------------------------------------------------------------
-- (Behavioral)
--
-- File name : dff.vhdl
-- Purpose   : D Edged Triggered Flip Flop 
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity dff is
   generic (N : integer:=4);
   port( d          : in  std_logic_VECTOR (N-1 downto 0);
         clk_dff        : in  std_logic;
         reset      : in  std_logic;
         q          : out std_logic_VECTOR (N-1 downto 0));
end dff;

architecture behavioural of dff is

begin
    DFF:process(clk_dff, reset)
	begin	 		
	  if (reset = '1') then
		 for i in 0 to N-1 loop
		 q(i) <= '0';
		 end loop;
         
       elsif (clk_dff'event and clk_dff='1') then       
		 q <= d;
      end if;
     end process DFF;

end behavioural;