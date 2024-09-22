library ieee;
use ieee.std_logic_1164.all;

-- Creating ports for mux
entity mux is
    port (
        a    : in  std_logic;  
        b    : in  std_logic;  
        c    : in  std_logic;  
        d    : in  std_logic;  --
        SEL  : in  std_logic_vector(1 downto 0); -- creating 2-bit SEL input
        y    : out std_logic   -- output
    );
end mux;

--mux logic
architecture behave of mux is
begin
    -- describing behavior of MUX
    process (a, b, c, d, SEL)
    begin
        case SEL is
            when "00" =>
                y <= a;  -- when sel is 00, a is sent to the output
            when "01" =>
                y <= b;  -- when sel is 01, a is sent to the output
            when "10" =>
                y <= c;  -- when sel is 10, a is sent to the output
            when "11" =>
                y <= d;  -- when sel is 11, a is sent to the output
            when others =>
                y <= 'X';  --ambigous case
        end case;
    end process;
end behave;
