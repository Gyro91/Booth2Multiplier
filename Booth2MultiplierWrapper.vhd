library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity Booth2MultiplierWrapper is
	generic(N : integer := 4; 																			  														
            M : integer := 4   
       );
	port (
	clk: in std_logic;
	reset: in std_logic;
	x : in  std_logic_vector(N-1 downto 0); 	-- x is the multiplicand
	y : in  std_logic_vector(M-1 downto 0);		-- y is the multiplier
	z : out	std_logic_vector(N+M-1 downto 0)	-- z is the result of the multiplication
		);
end Booth2MultiplierWrapper;

architecture behavioural of Booth2MultiplierWrapper is
	component dff
		generic (N : integer:=4);
   		port( d     : in  std_logic_VECTOR (N-1 downto 0);
         clk_dff    : in  std_logic;
         reset      : in  std_logic;
         q          : out std_logic_VECTOR (N-1 downto 0));
	end component;
	
	component Booth2Multiplier
		generic(N : integer := 4; 																			  														
           	    M : integer := 4   
        );
	port (
	x : in  std_logic_vector(N-1 downto 0); 	-- x is the multiplicand
	y : in  std_logic_vector(M-1 downto 0);		-- y is the multiplier
	z : out	std_logic_vector(N+M-1 downto 0)	-- z is the result of the multiplication
		);
	end component;
	signal xs : std_logic_vector(N-1 downto 0);
	signal ys : std_logic_vector(M-1 downto 0);
	signal zs : std_logic_vector(N+M-1 downto 0);
begin
	dff_x : dff generic map(N=>N)
		port map(d=>x, clk_dff=>clk, reset=>reset, q=>xs);
	dff_y : dff generic map(N=>M)
		port map(d=>y, clk_dff=>clk, reset=>reset, q=>ys);
	dff_z : dff generic map(N=>(N+M))
		port map(d=>zs, clk_dff=>clk, reset=>reset, q=>z);
	B2: Booth2Multiplier generic map(N=>N, M=>M)
		port map(x=>xs,y=>ys, z=>zs);
	
end behavioural;