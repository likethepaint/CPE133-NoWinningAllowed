library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity State_Controller is
  Port ( clk : in STD_LOGIC;
         reset : in STD_LOGIC;
         center_btn : in STD_LOGIC;
         game_over : in STD_LOGIC;
         state : out STD_LOGIC_VECTOR(3 downto 0));
end State_Controller;

architecture arch_State_Controller of State_Controller is  
    
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
                    NS <= init;
                else 
                    NS <= finish;
                end if;
            when others =>
                NS <= init;
        end case;
    end process;
    
    with PS select 
        state <= "0001" when init,
                 "0010" when difficulty,
                 "0100" when game,
                 "1000" when finish,
                 "0001" when others;
 
end arch_State_Controller;