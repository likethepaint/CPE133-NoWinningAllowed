----------------------------------------------
-- Project : CPE 133 Final Project

-- Module Name : Pattern_Gen
-- Authors : Collin Kenner, Brett Glidden

-- Description : generates the pattern for the user
--      user to match based on the current count
--      of the system's 100 MHx clock
----------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- Pattern_Gen entity definition
-- Inputs
--      clk : Basys-3 100 Mhz clock
--      reset : reset which generates new pattern when pulled low
-- Outputs
--      pattern : the pattern that the user must now match
entity Pattern_Gen is
    Port (clk: in STD_LOGIC;
          reset: in STD_LOGIC;
          pattern: out STD_LOGIC_VECTOR(15 downto 0));
end Pattern_Gen;

architecture arch_Pattern_Gen of Pattern_Gen is
    
    -- the value of count will be the pattern
    -- cannot ever be 0000
    signal count : STD_LOGIC_VECTOR(15 downto 0) := x"0001";
    
begin

    -- Keep track of counter on clk
    simpleCounter : process (clk)
    begin
        if (rising_edge(clk)) then
            if (count = x"FFFF") then
                count <= x"0001";
            else
                count <= STD_LOGIC_VECTOR(unsigned(count) + 1);
            end if;
        end if;
    end process;

    -- Push out pattern on reset low
    setPattern : process (reset)
    begin
        if (falling_edge(reset)) then
            -- Make sure that pattern in never x"0000"
            pattern <= (count XOR x"1001") OR count;
        end if;
    end process;
       
end arch_Pattern_Gen;
