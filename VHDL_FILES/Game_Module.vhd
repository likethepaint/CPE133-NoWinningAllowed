----------------------------------------------
-- Project : CPE 133 Final Project

-- Module Name : Game_Driver
-- Authors : Collin Kenner, Brett Glidden

-- Description : drives the logic for the actual countdown
--      and pattern matching portion of the game by mapping
--      all game components together
----------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Define Game_Driver entity
-- Inputs
--      clk : 100 MHz Basys-3 clock
--      state : current high level system state
--      difficulty : bitmask representing current difficulty
--      user_input : Basys-3 switch positions
-- Outputs
--      sseg_out* : character output to seven segment
--      win : HIGH if win condition is met
--      lose : HIGH if lose condition is met
--      pattern : the generated pattern to be used in debug mode
--      buzz : the piezo buzzer for the countdown
entity Game_Driver is
    Port (clk : in STD_LOGIC;
          state : in STD_LOGIC_VECTOR(3 downto 0);
          difficulty : in STD_LOGIC_VECTOR(15 downto 0);
          user_input : in STD_LOGIC_VECTOR(15 downto 0);
          sseg_out0 : out STD_LOGIC_VECTOR(5 downto 0);
          sseg_out1 : out STD_LOGIC_VECTOR(5 downto 0);
          sseg_out2 : out STD_LOGIC_VECTOR(5 downto 0);
          sseg_out3 : out STD_LOGIC_VECTOR(5 downto 0);
          win : out STD_LOGIC;
          lose : out STD_LOGIC;
          pattern : out STD_LOGIC_VECTOR(15 downto 0);
          buzz : out STD_LOGIC);
end Game_Driver;

architecture arch_Game_Driver of Game_Driver is

component Pattern_Gen is
    Port (clk: in STD_LOGIC;
          reset: in STD_LOGIC;
          pattern: out STD_LOGIC_VECTOR(15 downto 0));
end component;

component Trap is
    Port (reset : in STD_LOGIC;
          clk: in STD_LOGIC;
          user_input: in unsigned(15 downto 0);
          bitmask : in unsigned(15 downto 0); 
          pattern : in unsigned(15 downto 0);
          clk_out: out STD_LOGIC);
end component;

component Comparator is
    Port (reset : in STD_LOGIC;
          user_input : in STD_LOGIC_VECTOR(15 downto 0);
          pattern : in STD_LOGIC_VECTOR(15 downto 0);
          bitmask : in STD_LOGIC_VECTOR(15 downto 0);
          result : out STD_LOGIC);
end component;

component Binary_to_BCD is
    Port (clk : in STD_LOGIC;
          binary_in : STD_LOGIC_VECTOR(11 downto 0);
          ones : out STD_LOGIC_VECTOR(5 downto 0);
          tens : out STD_LOGIC_VECTOR(5 downto 0);
          hundreds : out STD_LOGIC_VECTOR(5 downto 0);
          thousands : out STD_LOGIC_VECTOR(5 downto 0));
end component;

component Timer is 
    Port (clk : in STD_LOGIC;
          reset : in STD_LOGIC;
          difficulty : in STD_LOGIC_VECTOR(15 downto 0);
          time_remaining : out STD_LOGIC_VECTOR(11 downto 0);
          out_of_time : out STD_LOGIC);
end component;

component Buzzer is
    Port (clk: in STD_LOGIC;
          countdown : in STD_LOGIC;
          reset: in STD_LOGIC;
          buzz: out STD_LOGIC);
end component;


signal reset : STD_LOGIC;
signal pattern_adj : STD_LOGIC_VECTOR(15 downto 0);
signal trap_clk_out : STD_LOGIC;
signal ones, tens, hundreds, thousands : STD_LOGIC_VECTOR(5 downto 0);
signal time_remaining : STD_LOGIC_VECTOR(11 downto 0);



begin

    ValidState : process (clk)
    begin
        if (rising_edge(clk)) then
            if ((state = "0100")) then
                reset <= '0';
            else 
                reset <= '1';
            end if;
        end if;
    end process;
    
    PatternSystem : Pattern_Gen port map (clk => clk, reset => reset, pattern => pattern_adj);
    TrapSystem : Trap port map (reset => reset, clk => clk, user_input => unsigned(user_input), bitmask => unsigned(difficulty), pattern => unsigned(pattern_adj), clk_out => trap_clk_out); 
    CompareSystem : Comparator port map (reset => reset, user_input => user_input, pattern => pattern_adj, bitmask => difficulty, result => win);
    ConvertToBCD : Binary_To_BCD port map (clk =>  clk, binary_in => time_remaining, ones => ones, tens => tens, hundreds => hundreds, thousands => thousands); 
    CountdownTimer : Timer port map (clk => trap_clk_out, reset => reset, difficulty => difficulty, time_remaining => time_remaining, out_of_time => lose);
    CountdownBuzzer : Buzzer port map(clk => clk, countdown => trap_clk_out, reset => reset, buzz => buzz);
    
    
    sseg_out0 <= ones;
    sseg_out1 <= tens;
    sseg_out2 <= hundreds;
    sseg_out3 <= thousands;
    
    pattern <= pattern_adj AND difficulty;
    
end arch_Game_Driver;
