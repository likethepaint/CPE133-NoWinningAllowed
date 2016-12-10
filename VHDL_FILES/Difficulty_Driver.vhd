----------------------------------------------
-- Project : CPE 133 Final Project

-- Module Name : Difficulty_Driver
-- Authors : Collin Kenner, Brett Glidden

-- Description : the difficulty driver is a state machine
--      representing the current difficulty (easy, medium, hard)
--      that the user is currently playing. Each state has a 
--      unique identifying bitmask for the difficulty and an 
--      associated word to display on the seven segment.
----------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Difficutly Driver entity definition
-- Inputs 
--      clk : 100 MHz Basys-3 clock signal
--      left_btn : 100 ms debounced signal from Basys-3 left button
--      right_btn : 100 ms debounced signal from Basys-3 right button
--      state : the current high level game state
-- Outputs
--      difficulty : 16 bit bitmask representing the current difficulty
--      sseg_out* : 6 bit value reprensenting character to display on seven segment
entity Difficulty_Driver is
  Port ( clk : in STD_LOGIC;
         left_btn : in STD_LOGIC;
         right_btn : in STD_LOGIC;
         state : in STD_LOGIC_VECTOR(3 downto 0);
         difficulty : out STD_LOGIC_VECTOR(15 downto 0); 
         sseg_out0 : out STD_LOGIC_VECTOR(5 downto 0);
         sseg_out1 : out STD_LOGIC_VECTOR(5 downto 0);
         sseg_out2 : out STD_LOGIC_VECTOR(5 downto 0);
         sseg_out3 : out STD_LOGIC_VECTOR(5 downto 0));
end Difficulty_Driver;

architecture arch_Difficulty_Driver of Difficulty_Driver is

    -- Bring in word dicitionary 
    component Display_Word is
      Port ( clk : in STD_LOGIC;
             bin_in : in STD_LOGIC_VECTOR(2 downto 0); 
             sseg_out0 : out STD_LOGIC_VECTOR(5 downto 0);
             sseg_out1 : out STD_LOGIC_VECTOR(5 downto 0);
             sseg_out2 : out STD_LOGIC_VECTOR(5 downto 0);
             sseg_out3 : out STD_LOGIC_VECTOR(5 downto 0));
    end component;

    -- Define 3 difficulty states and the default value
    type state_type is (easy, medium, hard);
    signal PS : state_type := easy;
    signal NS : state_type := easy;
    
    -- Signal to Display_Word that determines which word to display from dictionary
    signal difficulty_word_select : STD_LOGIC_VECTOR(2 downto 0);
   
    -- The difficulty bitmasks associated with each difficulty state
    signal easy_bitmask : STD_LOGIC_VECTOR(15 downto 0) := x"000F";
    signal medium_bitmask : STD_LOGIC_VECTOR(15 downto 0) := x"00FF";
    signal hard_bitmask : STD_LOGIC_VECTOR(15 downto 0) := x"FFFF";
    
begin
   
    -- FSM sync process
    sync_proc : process (clk, NS)
    begin
        if (rising_edge(clk)) then
            PS <= NS;
        end if;    
    end process;
   
    -- FSM state determination
    -- Only triggers on left or right button presses 
    comb_proc : process(right_btn, left_btn)
    begin
        -- check if the current high level game state is in difficulty select
        if (state = "0010") then
            case PS is
                -- define state transitions based on button presses and present state
                when easy =>
                    if (right_btn = '1') then
                        NS <= medium;
                    elsif (left_btn = '1') then
                        NS <= hard;
                    else
                        NS <= easy;
                        difficulty <= easy_bitmask;
                    end if;
                when medium =>
                    if (right_btn = '1') then
                        NS <= hard;
                    elsif (left_btn = '1') then
                        NS <= easy;
                    else
                        NS <= medium;
                        difficulty <= medium_bitmask;
                    end if;
                when hard =>
                    if (right_btn = '1') then
                        NS <= easy;
                    elsif (left_btn = '1') then
                        NS <= medium;
                    else
                        NS <= hard;
                        difficulty <= hard_bitmask;
                    end if;
                when others =>
                    NS <= easy;
                    difficulty <= hard_bitmask;
            end case;
        end if;
    end process;
    
    -- Define words associated with current difficulty
    with PS select
      difficulty_word_select <= "010" when easy,    -- Display EASY
                                "011" when medium,  -- Display FAIR
                                "100" when hard,    -- DISPLAY HARD
                                "010" when others;  -- DISPLAY EASY

    -- Display word on seven segment
    GenExpression : Display_Word port map (clk => clk,
                                           bin_in => difficulty_word_select,
                                           sseg_out0 => sseg_out0,
                                           sseg_out1 => sseg_out1,
                                           sseg_out2 => sseg_out2,
                                           sseg_out3 => sseg_out3); 
                                           
end arch_Difficulty_Driver;
