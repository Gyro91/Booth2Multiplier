

library IEEE;
use IEEE.std_logic_1164.all;

entity booth2_tbmodd IS

end booth2_tbmodd;

-- Test Odd Booth Multiplier 

architecture booth2_tbmodd of booth2_tbmodd is
	component OddBooth2Multiplier
  	generic(N : integer := 4; 
            M : integer := 4   
       );
	port (
	x : in  std_logic_vector(N-1 downto 0); 	-- x is the multiplicand
	y : in  std_logic_vector(M-1 downto 0);		-- y is the multiplier
	z : out	std_logic_vector(N+M-1 downto 0)	-- z is the result of the multiplication
		);
	end component; 
	
   constant MckPer  :  time     := 200 ns;  -- Master Clk period
	   
   signal   clk  : std_logic := '0';
   signal   x_in   	: std_logic_VECTOR (3 downto 0):="0000";
   signal   y_in    : std_logic_VECTOR (2 downto 0):="000";	
   signal   z_out   : std_logic_VECTOR (6 downto 0):="0000000";
   signal clk_cycle : integer;
   signal Testing: boolean := True;	
   signal z_correct   : std_logic_VECTOR (6 downto 0):="0000000";
   signal 	diff		: std_logic := '0';
begin 			 
	I: OddBooth2Multiplier generic map(N=>4, M=>3)
		port map(x=>x_in,y=>y_in, z=>z_out);
				
   clk <= not clk after MckPer/2 when Testing else '0';

   Test_Proc: process(clk)
   variable count: INTEGER:= 0;
   
   begin
     clk_cycle <= (count+1)/2;

     case clk_cycle is
 		when 0 => y_in <= "100"; x_in <= "1000"; z_correct<="0100000";
        when 1 => y_in <= "101"; x_in <= "1000"; z_correct<="0011000";
        when 2 => y_in <= "110"; x_in <= "1000"; z_correct<="0010000";
        when 3 => y_in <= "111"; x_in <= "1000"; z_correct<="0001000";
        when 4 => y_in <= "000"; x_in <= "1000"; z_correct<="0000000";
        when 5 => y_in <= "001"; x_in <= "1000"; z_correct<="1111000";
        when 6 => y_in <= "010"; x_in <= "1000"; z_correct<="1110000";
        when 7 => y_in <= "011"; x_in <= "1000"; z_correct<="1101000";
        when 8 => y_in <= "100"; x_in <= "1001"; z_correct<="0011100";
        when 9 => y_in <= "101"; x_in <= "1001"; z_correct<="0010101";
        when 10 => y_in <= "110"; x_in <= "1001"; z_correct<="0001110";
        when 11 => y_in <= "111"; x_in <= "1001"; z_correct<="0000111";
        when 12 => y_in <= "000"; x_in <= "1001"; z_correct<="0000000";
        when 13 => y_in <= "001"; x_in <= "1001"; z_correct<="1111001";
        when 14 => y_in <= "010"; x_in <= "1001"; z_correct<="1110010";
        when 15 => y_in <= "011"; x_in <= "1001"; z_correct<="1101011";
        when 16 => y_in <= "100"; x_in <= "1010"; z_correct<="0011000";
        when 17 => y_in <= "101"; x_in <= "1010"; z_correct<="0010010";
        when 18 => y_in <= "110"; x_in <= "1010"; z_correct<="0001100";
        when 19 => y_in <= "111"; x_in <= "1010"; z_correct<="0000110";
        when 20 => y_in <= "000"; x_in <= "1010"; z_correct<="0000000";
        when 21 => y_in <= "001"; x_in <= "1010"; z_correct<="1111010";
        when 22 => y_in <= "010"; x_in <= "1010"; z_correct<="1110100";
        when 23 => y_in <= "011"; x_in <= "1010"; z_correct<="1101110";
        when 24 => y_in <= "100"; x_in <= "1011"; z_correct<="0010100";
        when 25 => y_in <= "101"; x_in <= "1011"; z_correct<="0001111";
        when 26 => y_in <= "110"; x_in <= "1011"; z_correct<="0001010";
        when 27 => y_in <= "111"; x_in <= "1011"; z_correct<="0000101";
        when 28 => y_in <= "000"; x_in <= "1011"; z_correct<="0000000";
        when 29 => y_in <= "001"; x_in <= "1011"; z_correct<="1111011";
        when 30 => y_in <= "010"; x_in <= "1011"; z_correct<="1110110";
        when 31 => y_in <= "011"; x_in <= "1011"; z_correct<="1110001";
        when 32 => y_in <= "100"; x_in <= "1100"; z_correct<="0010000";
        when 33 => y_in <= "101"; x_in <= "1100"; z_correct<="0001100";
        when 34 => y_in <= "110"; x_in <= "1100"; z_correct<="0001000";
        when 35 => y_in <= "111"; x_in <= "1100"; z_correct<="0000100";
        when 36 => y_in <= "000"; x_in <= "1100"; z_correct<="0000000";
        when 37 => y_in <= "001"; x_in <= "1100"; z_correct<="1111100";
        when 38 => y_in <= "010"; x_in <= "1100"; z_correct<="1111000";
        when 39 => y_in <= "011"; x_in <= "1100"; z_correct<="1110100";
        when 40 => y_in <= "100"; x_in <= "1101"; z_correct<="0001100";
        when 41 => y_in <= "101"; x_in <= "1101"; z_correct<="0001001";
        when 42 => y_in <= "110"; x_in <= "1101"; z_correct<="0000110";
        when 43 => y_in <= "111"; x_in <= "1101"; z_correct<="0000011";
        when 44 => y_in <= "000"; x_in <= "1101"; z_correct<="0000000";
        when 45 => y_in <= "001"; x_in <= "1101"; z_correct<="1111101";
        when 46 => y_in <= "010"; x_in <= "1101"; z_correct<="1111010";
        when 47 => y_in <= "011"; x_in <= "1101"; z_correct<="1110111";
        when 48 => y_in <= "100"; x_in <= "1110"; z_correct<="0001000";
        when 49 => y_in <= "101"; x_in <= "1110"; z_correct<="0000110";
        when 50 => y_in <= "110"; x_in <= "1110"; z_correct<="0000100";
        when 51 => y_in <= "111"; x_in <= "1110"; z_correct<="0000010";
        when 52 => y_in <= "000"; x_in <= "1110"; z_correct<="0000000";
        when 53 => y_in <= "001"; x_in <= "1110"; z_correct<="1111110";
        when 54 => y_in <= "010"; x_in <= "1110"; z_correct<="1111100";
        when 55 => y_in <= "011"; x_in <= "1110"; z_correct<="1111010";
        when 56 => y_in <= "100"; x_in <= "1111"; z_correct<="0000100";
        when 57 => y_in <= "101"; x_in <= "1111"; z_correct<="0000011";
        when 58 => y_in <= "110"; x_in <= "1111"; z_correct<="0000010";
        when 59 => y_in <= "111"; x_in <= "1111"; z_correct<="0000001";
        when 60 => y_in <= "000"; x_in <= "1111"; z_correct<="0000000";
        when 61 => y_in <= "001"; x_in <= "1111"; z_correct<="1111111";
        when 62 => y_in <= "010"; x_in <= "1111"; z_correct<="1111110";
        when 63 => y_in <= "011"; x_in <= "1111"; z_correct<="1111101";
        when 64 => y_in <= "100"; x_in <= "0000"; z_correct<="0000000";
        when 65 => y_in <= "101"; x_in <= "0000"; z_correct<="0000000";
        when 66 => y_in <= "110"; x_in <= "0000"; z_correct<="0000000";
        when 67 => y_in <= "111"; x_in <= "0000"; z_correct<="0000000";
        when 68 => y_in <= "000"; x_in <= "0000"; z_correct<="0000000";
        when 69 => y_in <= "001"; x_in <= "0000"; z_correct<="0000000";
        when 70 => y_in <= "010"; x_in <= "0000"; z_correct<="0000000";
        when 71 => y_in <= "011"; x_in <= "0000"; z_correct<="0000000";
        when 72 => y_in <= "100"; x_in <= "0001"; z_correct<="1111100";
        when 73 => y_in <= "101"; x_in <= "0001"; z_correct<="1111101";
        when 74 => y_in <= "110"; x_in <= "0001"; z_correct<="1111110";
        when 75 => y_in <= "111"; x_in <= "0001"; z_correct<="1111111";
        when 76 => y_in <= "000"; x_in <= "0001"; z_correct<="0000000";
        when 77 => y_in <= "001"; x_in <= "0001"; z_correct<="0000001";
        when 78 => y_in <= "010"; x_in <= "0001"; z_correct<="0000010";
        when 79 => y_in <= "011"; x_in <= "0001"; z_correct<="0000011";
        when 80 => y_in <= "100"; x_in <= "0010"; z_correct<="1111000";
        when 81 => y_in <= "101"; x_in <= "0010"; z_correct<="1111010";
        when 82 => y_in <= "110"; x_in <= "0010"; z_correct<="1111100";
        when 83 => y_in <= "111"; x_in <= "0010"; z_correct<="1111110";
        when 84 => y_in <= "000"; x_in <= "0010"; z_correct<="0000000";
        when 85 => y_in <= "001"; x_in <= "0010"; z_correct<="0000010";
        when 86 => y_in <= "010"; x_in <= "0010"; z_correct<="0000100";
        when 87 => y_in <= "011"; x_in <= "0010"; z_correct<="0000110";
        when 88 => y_in <= "100"; x_in <= "0011"; z_correct<="1110100";
        when 89 => y_in <= "101"; x_in <= "0011"; z_correct<="1110111";
        when 90 => y_in <= "110"; x_in <= "0011"; z_correct<="1111010";
        when 91 => y_in <= "111"; x_in <= "0011"; z_correct<="1111101";
        when 92 => y_in <= "000"; x_in <= "0011"; z_correct<="0000000";
        when 93 => y_in <= "001"; x_in <= "0011"; z_correct<="0000011";
        when 94 => y_in <= "010"; x_in <= "0011"; z_correct<="0000110";
        when 95 => y_in <= "011"; x_in <= "0011"; z_correct<="0001001";
        when 96 => y_in <= "100"; x_in <= "0100"; z_correct<="1110000";
        when 97 => y_in <= "101"; x_in <= "0100"; z_correct<="1110100";
        when 98 => y_in <= "110"; x_in <= "0100"; z_correct<="1111000";
        when 99 => y_in <= "111"; x_in <= "0100"; z_correct<="1111100";
        when 100 => y_in <= "000"; x_in <= "0100"; z_correct<="0000000";
        when 101 => y_in <= "001"; x_in <= "0100"; z_correct<="0000100";
        when 102 => y_in <= "010"; x_in <= "0100"; z_correct<="0001000";
        when 103 => y_in <= "011"; x_in <= "0100"; z_correct<="0001100";
        when 104 => y_in <= "100"; x_in <= "0101"; z_correct<="1101100";
        when 105 => y_in <= "101"; x_in <= "0101"; z_correct<="1110001";
        when 106 => y_in <= "110"; x_in <= "0101"; z_correct<="1110110";
        when 107 => y_in <= "111"; x_in <= "0101"; z_correct<="1111011";
        when 108 => y_in <= "000"; x_in <= "0101"; z_correct<="0000000";
        when 109 => y_in <= "001"; x_in <= "0101"; z_correct<="0000101";
        when 110 => y_in <= "010"; x_in <= "0101"; z_correct<="0001010";
        when 111 => y_in <= "011"; x_in <= "0101"; z_correct<="0001111";
        when 112 => y_in <= "100"; x_in <= "0110"; z_correct<="1101000";
        when 113 => y_in <= "101"; x_in <= "0110"; z_correct<="1101110";
        when 114 => y_in <= "110"; x_in <= "0110"; z_correct<="1110100";
        when 115 => y_in <= "111"; x_in <= "0110"; z_correct<="1111010";
        when 116 => y_in <= "000"; x_in <= "0110"; z_correct<="0000000";
        when 117 => y_in <= "001"; x_in <= "0110"; z_correct<="0000110";
        when 118 => y_in <= "010"; x_in <= "0110"; z_correct<="0001100";
        when 119 => y_in <= "011"; x_in <= "0110"; z_correct<="0010010";
        when 120 => y_in <= "100"; x_in <= "0111"; z_correct<="1100100";
        when 121 => y_in <= "101"; x_in <= "0111"; z_correct<="1101011";
        when 122 => y_in <= "110"; x_in <= "0111"; z_correct<="1110010";
        when 123 => y_in <= "111"; x_in <= "0111"; z_correct<="1111001";
        when 124 => y_in <= "000"; x_in <= "0111"; z_correct<="0000000";
        when 125 => y_in <= "001"; x_in <= "0111"; z_correct<="0000111";
        when 126 => y_in <= "010"; x_in <= "0111"; z_correct<="0001110";
        when 127 => y_in <= "011"; x_in <= "0111"; z_correct<="0010101";

        when 128 =>   Testing <= False;
        when others => null;
     end case;
	 if (z_out = z_correct) then diff <= '0'; else diff <= '1'; end if;
     	count:= count + 1;
   end process Test_Proc;
end booth2_tbmodd;
