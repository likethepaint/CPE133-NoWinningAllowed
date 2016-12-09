----------------------------------------------------------------------------------
-- CPE 133 Final Project
-- Collin Kenner, Brett Glidden

-- User Input Comparator Module

-- synchronous?
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- Define comparator module
-- reset : hard comparator reset
-- user_input : user switch positions
-- pattern : pattern to match from pattern generation module
-- bitmask : bitmask based on user difficulty
-- result : the output of (user_input == pattern)
entity Comparator is
    Port (reset : in STD_LOGIC;
          user_input : in STD_LOGIC_VECTOR(15 downto 0);
          pattern : in STD_LOGIC_VECTOR(15 downto 0);
          bitmask : in STD_LOGIC_VECTOR(15 downto 0);
          result : out STD_LOGIC);
end Comparator;

architecture arch_Comparator of Comparator is
    
    signal cmp_flag : STD_LOGIC := '0';
    signal adjusted_input : STD_LOGIC_VECTOR(15 downto 0);
    signal adjusted_pattern : STD_LOGIC_VECTOR(15 downto 0);
    
begin
    -- Bitmask user inputs for difficutly
    adjusted_input <= user_input AND bitmask;
    adjusted_pattern <= pattern AND bitmask;
    
    compareInputs : process (adjusted_input, adjusted_pattern, reset) 
    begin
        if (reset = '1') then
            cmp_flag <= '0';
        elsif (adjusted_input = adjusted_pattern) then
            cmp_flag <= '1';
        else
            cmp_flag <= '0';
        end if;
    end process;

    result <= cmp_flag;
       
    
end arch_Comparator;
