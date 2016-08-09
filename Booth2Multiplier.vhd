-------------------------------------------------------------------------------
-- File name : Booth2.vhdl
-- Purpose   : A digital multiplier that implements Booth 2 algorithm
--           :
-- Library   : IEEE
-- Author(s) : Matteo Rotundo

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity Booth2Multiplier is
	generic(N : integer := 4; 																			  														
            M : integer := 4   
       );
	port (
	x : in  std_logic_vector(N-1 downto 0); 	-- x is the multiplicand
	y : in  std_logic_vector(M-1 downto 0);		-- y is the multiplier
	z : out	std_logic_vector(N+M-1 downto 0)	-- z is the result of the multiplication
		);
end Booth2Multiplier; 

architecture behavioural of Booth2Multiplier is
   	
type array_vector is array (0 to (M/2)-1) of signed(N+M-1 downto 0);
type array_vector2 is array (0 to (M/2)-1) of std_logic_vector(2 downto 0);  
begin
	
	process(x,y)
	
	variable zout : signed(N+M-1 downto 0) := (others =>'0'); 
	variable control_bits : array_vector2; 
	variable k : integer := -2 ;
	variable x_ext : signed(N+M-1 downto 0);
	
	variable pp : array_vector;
	begin
	-- Initialization
	zout := (others => '0');
	k := -2;
	
	-- Extending x  in order to do the correct assignments with pp
	for i in N to N+M-1 loop
		x_ext(i) := (x(N-1));	
		x_ext(N-1 downto 0) := signed(x);
	end loop;	
			 
	-- Taking the bits needed to generate partial products
	for i in 0 to (M/2)-1 loop
		k:= k+2;
		if ( k=0 ) then
			control_bits(i) := y(1 downto 0) & '0';
		else
			control_bits(i):= y(k+1 downto k-1);
		end if;	
	end loop;		
	
	-- Generating partial products
	for i in 0 to (M/2)-1 loop		
	
		case control_bits(i) is
		when "000" 	=> pp(i) :=	(others =>'0');
		when "001" 	=> pp(i) := x_ext;
		when "010" 	=> pp(i) := x_ext;
		when "011" 	=> pp(i) := x_ext(N+M-2 downto 0) & '0';
		when "100" 	=> pp(i) := not(x_ext(N+M-2 downto 0) & '0')+ 1;
		when "101" 	=> pp(i) := not(x_ext)+1;
		when "110" 	=> pp(i) := not(x_ext)+1;
		when "111" 	=> pp(i) :=	(others =>'0');
		when others => pp(i) :=	x_ext;
		
		end case;
	 	
	end loop;
	k:=2;
	-- The first partial product must not be shifted
	zout := zout + pp(0);
	for i in 1 to (M/2)-1 loop
		-- Shifting the partial product i by k bits
		pp(i)(N+M-1 downto k):=pp(i)(N+M-1-k downto 0); 
		pp(i)(k-1 downto 0) := (others =>'0');
		-- Adding the partial product i with the previous
		zout := zout + pp(i);
		k := k + 2;
	end loop;
	
	-- Updating the output
	z <= std_logic_vector(zout);

	end process;	
		
		
end behavioural;