----------------------------------------------
-- Project : CPE 133 Final Project

-- Module Name : Buzzer
-- Authors : Collin Kenner, Brett Glidden

-- Description : implements the piezo buzzer which will
--      which will be tied to the countdown timer
----------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- Define Buzzer entity
-- Inputs
--      clk : 100 MHz Basys-3 system clock
--      countdown : current clock rate of the countdown timer
--      reset : reset input
-- Outputs
--      buzz : 'x' frequency output to drive the buzzer
entity Buzzer is
    Port (clk: in STD_LOGIC;
          countdown : in STD_LOGIC;
          reset: in STD_LOGIC;
          buzz: out STD_LOGIC);
end Buzzer;

architecture arch_Buzzer of Buzzer is

-- Counter for the buzz frequency clock divider
signal count : STD_LOGIC_VECTOR(23 downto 0) := x"000000";

-- Tied to buzz in order to sample the current output
signal buzz_out : STD_LOGIC := '0';

-- 100 ms max sound duration
signal count_ext : STD_LOGIC_VECTOR(23 downto 0) := x"000000";

begin

    -- Drives the sound of the piezo buzzer
    GenBuzz : process (clk) 
    begin
        -- Game is not active
        if (reset = '1') then
            buzz_out <= '0';
            count <= x"000000";

        -- Game is active
        elsif (rising_edge(clk)) then
            -- check if current countdown timer clock cycle is high
            if (countdown = '1') then
                -- only drive buzzer while total sound duration is less than ~100 ms
                if (count_ext /= x"97FA18") then
                    if (count = x"0101A8") then
                        count <= x"000000";
                        buzz_out <= not buzz_out;
                    else
                        count <= STD_LOGIC_VECTOR(unsigned(count) + 1);
                    end if;
                    count_ext <= STD_LOGIC_VECTOR(unsigned(count_ext) + 1);
                end if;
            else
                -- reset all values
                count <= x"000000";
                count_ext <= x"000000";
                buzz_out <= '0';
            end if;
        end if;
    end process;
   
    -- Connect buzz to the buzz_out signal
    buzz <= buzz_out;
    
    
end arch_Buzzer;
