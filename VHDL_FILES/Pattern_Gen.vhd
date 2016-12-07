----------------------------------------------------------------------------------
-- CPE 133 Final Project
-- Collin Kenner, Brett Glidden

-- Pattern Creator module
--     setup for D Flip Flops
--     can be pulsed for JK Flip Flops

-- TODO: Change to LFSR based generator
--       Implement reset?
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- Button entity definition
-- clk : Basys-3 10 Mhz clock
-- cen : chip enable to generate new pattern
-- pattern : the pattern that the user must now match
entity Pattern_Gen is
    Port (clk: in STD_LOGIC;
          reset: in STD_LOGIC;
          pattern: out STD_LOGIC_VECTOR(15 downto 0));
end Pattern_Gen;

architecture arch_Pattern_Gen of Pattern_Gen is
    
    -- the value of count will be the pattern
    signal count : STD_LOGIC_VECTOR(15 downto 0) := x"0000";
    
begin

    simpleCounter : process (clk)
    begin
        if (rising_edge(clk)) then
            count <= STD_LOGIC_VECTOR(unsigned(count) + 1);
        end if;
    end process;

    -- When the user starts the game, the chip will be enabled
    -- and the pattern is set from the value of count.
    -- The only way to cheat the system is to have the amazing ability
    -- to time things at 10 Mhz in your head.
    setPattern : process (reset)
    begin
        if (falling_edge(reset)) then
            pattern <= count;
        end if;
    end process;
       
end arch_Pattern_Gen;
