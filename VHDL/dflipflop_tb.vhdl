library ieee;
use ieee.std_logic_1164.all;

--Defining the test bench
entity dflipflop_tb is
end dflipflop_tb;
	
architecture test of dflipflop_tb is 
	--Declare component of the D Flip Flop
	component dflipflop
		port 
		(
			D 	 : in std_logic;
			CLK  : in std_logic;
			Q    : out std_logic;
			invQ : out std_logic
		);
	end component;
	
	--Declare signals for test bench, signals at start of simulation
	signal D	:	std_logic := '0';
	signal CLK	: 	std_logic := '0';
	signal Q	:	std_logic;
	signal invQ :	std_logic;
	
	begin
		-- Unit under test UUT, used to create an instance of the flip flop
		d_flip_flip: dflipflop port map(D => D, CLK => CLK, Q => Q, invQ => invQ);
		
		-- Generating clock, 50MHZ = 20ns period
		CLK_GEN: process begin	
			for i in 0 to 80 loop --loops 80 times
				--cycles every 10ns between 0 and 1 values for CLK
				CLK <= '0';
				wait for 10 ns;
				CLK <= '1';
				wait for 10 ns;
			end loop;
			
		end process;
		
		--Stimulating D by applying inputs, observing behavior of Q and invQ
		STIMULUS: process
		begin
			-- Initializing D
			D <= '0';
			wait for 25 ns; -- waiting after first clock cycles
			
			--Setting D to '1' for first test
			D <= '1';
			wait for 20 ns;
			
			--Setting D to '0' for next test
			D <= '0';
			wait for 20 ns;
			
			--Simulation Ends
		wait;
		end process;		
end test;
	
	