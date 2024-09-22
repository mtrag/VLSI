library ieee;
use ieee.std_logic_1164.all;

entity mux4to1_tb is
end mux4to1_tb;

architecture test of mux4to1_tb is
	--copy mux from mux4to1 to the test bench
	component mux
		port (
			a	: in std_logic;
			b 	: in std_logic;
			c 	: in std_logic;
			d 	: in std_logic;
			SEL : in std_logic_vector(1 downto 0);-- creating 2-bit SEL input
			y 	: out std_logic					  -- output
		);
	end component;

	--introduce signals and assign initial values to inputs
	signal a, b, c, d : std_logic;
	signal SEL		  : std_logic_vector(1 downto 0);
	signal y		  : std_logic;
	
	begin
		--configuring mux
		uut: mux port map (
			a => a,
			b => b,
			c => c,
			d => d,
			SEL => SEL,
			y => y
		);
		
		--stimulus process
		stimulus: process
		begin
			--applying test cases
			a <= '0'; b <= '1'; c <= '0'; d <= '1';
			
			SEL <= "00"; -- triggering a output
			wait for 10 ns;
			
			SEL <= "01"; -- triggering b output
			wait for 10 ns;
			
			SEL <= "10"; -- triggering c output
			wait for 10 ns;
			
			SEL <= "11"; -- triggering d output
			wait for 10 ns;
			
			-- simulation ends
			wait;
		end process;
end test;
			
	