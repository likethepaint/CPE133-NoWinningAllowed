----------------------------------------------
-- Project : CPE 133 Final Project

-- Module Name : Button 
-- Authors : Collin Kenner, Brett Glidden

-- Description : debounces the button inputs to 100 ms
----------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- Button entity definition
-- Inputs
--      raw_input : direct connection to button
--      clk : Basys-3 10 Mhz clock
-- Outputs
--      debounced_output : debounced button state output
entity Button is
    Port (raw_input : in STD_LOGIC;
          clk : in STD_LOGIC;
          debounced_output : out STD_LOGIC);
end Button;

architecture arch_Button of Button is
    -- Current state of debounced_output for sampling
    signal control_out : STD_LOGIC := '0';

    -- Counter for debounce timing
    signal count : STD_LOGIC_VECTOR(23 downto 0):= x"000000";
begin
    
    -- Valid button press must be longer than 100 ms
    debounce : process(clk) 
    begin
        if rising_edge(clk) then
            
            if control_out = '1' then
                control_out <= '0';
            end if;
            
            if (raw_input = '0') then
                count <= count XOR count;
            elsif (unsigned(count) = x"989680") then
                control_out <= '1';
                count <= x"FFFFFF";  -- put count in hold state, will reset when button is released
            elsif (count /= x"FFFFFF") then
                -- Increment count when not in hold state
                count <= STD_LOGIC_VECTOR(unsigned(count) + 1);
            end if;
            
        end if;
    end process;
    
    debounced_output <= control_out;
        
end arch_Button;
