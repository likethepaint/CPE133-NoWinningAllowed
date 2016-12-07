----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/06/2016 11:44:09 PM
-- Design Name: 
-- Module Name: Game_State_Machine - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Game_State_Machine is
      Port ( 
            reset : in STD_LOGIC;
            clk : in STD_LOGIC;
            initialize_button_in: in STD_LOGIC;--goes high when user pushes any one of the three menu buttons
            activate_difficulty_select : out STD_LOGIC;--initializes the difficulty select state machine
            game_over : in STD_LOGIC;
            selected_difficulty : in STD_LOGIC;--goes high when the difficulty select state gets a selected value
            state_id : out STD_LOGIC_VECTOR (3 downto 0));--tells the rest of the device which state the program currently is in
end Game_State_Machine;

architecture Behavioral of Game_State_Machine is
    type state_type is(initialize, difficulty_select, game_mode, game_end);
    signal PS,NS : state_type;
   -- signal state_machine_begin : STD_LOGIC;
begin
    sync_proc: process(clk,NS,reset)
    begin
        --handling the activation input
        --device always defaults to an easy difficulty.
        if(reset = '1') then
            PS <= initialize;
            --state_machine_begin <= '1';
        elsif(rising_edge(clk)) then
            PS <= NS;
        end if;
    end process sync_proc;
    
    comb_proc: process(PS,clk)
        variable counter : integer range 0 to 1000000000 := 0;
        begin
            case PS is
                when initialize =>
                    state_id <= "0001";
                    if(initialize_button_in = '1') then
                        NS <= difficulty_select;
                    else
                        NS <= initialize;
                    end if;
                when difficulty_select =>
                    state_id <= "0010";
                    if(selected_difficulty = '1') then
                        NS <= game_mode; 
                    else
                        NS <= difficulty_select;
                    end if;
                when game_mode =>
                    state_id <= "0100";
                    if(game_over = '1') then
                        NS <= game_end;
                    else
                        NS <= game_mode; 
                    end if; 
                when game_end =>
                    state_id <= "1000";
                    if((rising_edge(clk))) then                       
                        if(counter = 1000000000) then
                            NS <= initialize;
                        else
                            NS <= game_mode; 
                        end if;   
                    counter := counter + 1;   
                    end if;                 
                when others =>
                    NS <= initialize;
            end case;            
        end process comb_proc;


end Behavioral;
