library ieee;
use ieee.std_logic_1164.all;


--Creating entity for D Flip-Flop
entity dflipflop is
	port(
		D: in std_logic;		--input for DATA
		CLK: in std_logic;		--CLOCK, periodic and used to determine when d can influence q
		Q: out std_logic;		--OUTPUT based on d,clk
		invQ: out std_logic		--inverse of Q
	);
end dflipflop;

--architecture module describes the logic that determines the outputs based on inputs
architecture behave of dflipflop is
begin
	--process will be initiated each time that there is a change in the variable CLK
	process(CLK)
	begin
		--checking if the change in CLK is do to a rising edge or falling edge
		if rising_edge(CLK) then
			--the state of D is set equal to Q rising_edge condition is true
			Q <= D;
			invQ <= not D;
		end if;
	end process;
end behave;