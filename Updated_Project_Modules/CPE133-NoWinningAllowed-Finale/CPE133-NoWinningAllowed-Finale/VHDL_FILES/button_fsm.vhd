--the finite state machine for the button module is shown below. 
-- This state machine is only active when the device enters the correct overarching state.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity button_fsm is
    Port ( middle_button : in STD_LOGIC;
           left_button : in STD_LOGIC;
           right_button : in STD_LOGIC;
           activate : in STD_LOGIC;
           clk : in STD_LOGIC;
           difficulty : out STD_LOGIC_VECTOR (15 downto 0);
           diff_selected : out STD_LOGIC;
           word_select : out STD_LOGIC_VECTOR(2 downto 0));
end button_fsm;

architecture Behavioral of button_fsm is
    --the difficulty of the game is selected
    -- depending on the state selected when the user hits the center button.
    type state_type is(easy, medium, hard);
    signal PS,NS : state_type;
    signal choice: STD_LOGIC_VECTOR(2 downto 0);
    signal easy_bitmask : STD_LOGIC_VECTOR(15 downto 0) := x"000F";
    signal medium_bitmask : STD_LOGIC_VECTOR(15 downto 0) := x"00FF";
    signal hard_bitmask : STD_LOGIC_VECTOR(15 downto 0) := x"FFFF";
    
begin
    sync_proc: process(clk,NS,activate)
    begin
        --handling the activation input
        --device always defaults to an easy difficulty.
        if(activate = '1') then
            PS <= easy;
        elsif(rising_edge(clk)) then
            PS <= NS;
        end if;
    end process sync_proc;
    
    comb_proc: process(PS,left_button,right_button,middle_button)
    begin
        choice <= "000";--output choice should always be 0 until the user selects a difficulty
        case PS is
            when easy =>
                word_select<="010";
                choice <= "001";
                --if user enters an invalid selection the device defaults back to easy.
                if(left_button = '1' AND right_button = '1') then
                    NS <= easy;
                elsif(left_button = '1') then
                    NS <= hard;
                elsif(right_button = '1') then
                    NS <= medium;
                else
                    NS <= easy; 
                end if;
            when medium =>
                word_select <= "011";
                choice <= "010";
                if(left_button = '1' AND right_button = '1') then
                    NS <= easy;
                elsif(left_button = '1') then
                    NS <= easy;
                elsif(right_button = '1') then
                    NS <= hard;
                else
                    NS <= medium; 
                end if;   
            when hard =>
                word_select <= "100";
                choice <= "100";
                if(left_button = '1' AND right_button = '1') then
                    NS <= easy;
                elsif(left_button = '1') then
                    NS <= medium;
                elsif(right_button = '1') then
                    NS <= easy;
                else
                    NS <= hard; 
                end if; 
            when others =>
                NS <= easy;
        end case;      
    if(middle_button='1') then
        if choice = "001" then
            difficulty <= easy_bitmask;
        elsif choice = "010" then
            difficulty <= medium_bitmask;
        elsif choice = "100" then
            difficulty <= hard_bitmask;
        else
            -- Error state
            difficulty <= x"0000";
        end if;
        diff_selected <= '1';
        else
            diff_selected <= '0';    
    end if;    
    end process comb_proc;
end Behavioral;
