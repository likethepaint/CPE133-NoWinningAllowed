----------------------------------------------
-- Project : CPE 133 Final Project

-- Module Name : State_Controller 
-- Authors : Collin Kenner, Brett Glidden

-- Description : determines the top level state of
--      the game based on the center button and the
--      game over signal from the sub modules
----------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Define State_Controller entity
-- Inputs
--      clk : 100 MHz Basys-3 clock
--      reset : reset signal
--      center_btn : debounced center button signal
--      game_over : game_over signal from Game_Module
-- Outputs
--      state : the high level system state
entity State_Controller is
  Port ( clk : in STD_LOGIC;
         reset : in STD_LOGIC;
         center_btn : in STD_LOGIC;
         game_over : in STD_LOGIC;
         state : out STD_LOGIC_VECTOR(3 downto 0));
end State_Controller;

architecture arch_State_Controller of State_Controller is  
    
    -- Define the system states and assign an initial state
    type state_type is (init, difficulty, game, finish);
    signal PS: state_type := init;
    signal NS: state_type := init;
    
begin
    
    sync_proc : process (clk, NS, reset)
    begin
        if (reset = '1') then
           PS <= init; 
        elsif (rising_edge(clk)) then
            PS <= NS;
        end if;
    end process;
   
    -- Choose NS based on center_btn press and game_over signal
    comb_proc : process (center_btn, game_over)
    begin
        case PS is
            when init =>
                if (center_btn = '1') then
                    NS <= difficulty;
                else
                    NS <= init;
                end if;
            when difficulty =>
                if (center_btn = '1') then
                    NS <= game;
                else
                    NS <= difficulty;
                end if;
            when game =>
                if (game_over = '1') then
                    NS <= finish;
                else
                    NS <= game;
                end if;
            when finish =>
                if (center_btn = '1') then
                    NS <= difficulty;
                else 
                    NS <= finish;
                end if;
            when others =>
                NS <= init;
        end case;
    end process;
   
    -- Assign state signal based on PS
    with PS select 
        state <= "0001" when init,
                 "0010" when difficulty,
                 "0100" when game,
                 "1000" when finish,
                 "0001" when others;
 
end arch_State_Controller;
