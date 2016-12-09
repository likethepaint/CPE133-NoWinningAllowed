----------------------------------------------------------------------------------
-- CPE 133 Final Project
-- Collin Kenner, Brett Glidden

-- Game State Module
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Game_Module is
    Port (clk : in STD_LOGIC;
          current_state : in STD_LOGIC_VECTOR(3 downto 0);
          bitmask : in STD_LOGIC_VECTOR(15 downto 0);
          user_input : in STD_LOGIC_VECTOR(15 downto 0);
          timer_out_0 : out STD_LOGIC_VECTOR(5 downto 0);
          timer_out_1 : out STD_LOGIC_VECTOR(5 downto 0);
          timer_out_2 : out STD_LOGIC_VECTOR(5 downto 0);
          timer_out_3 : out STD_LOGIC_VECTOR(5 downto 0);
          win : out STD_LOGIC;
          lose : out STD_LOGIC;
          game_over : out STD_LOGIC;
          pattern_adj : out STD_LOGIC_VECTOR(15 downto 0));
end Game_Module;

architecture arch_Game_Module of Game_Module is

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
          thousands : out STD_LOGIC_VECTOR(5 downto 0);
          sseg_enable : out STD_LOGIC);
end component;

component Timer is 
    Port (clk : in STD_LOGIC;
          reset : in STD_LOGIC;
          difficulty : in STD_LOGIC_VECTOR(15 downto 0);
          time_remaining : out STD_LOGIC_VECTOR(11 downto 0);
          out_of_time : out STD_LOGIC);
end component;

signal reset : STD_LOGIC;
signal pattern : STD_LOGIC_VECTOR(15 downto 0);
signal trap_clk_out : STD_LOGIC;
signal sseg_enable : STD_LOGIC;
signal ones, tens, hundreds, thousands : STD_LOGIC_VECTOR(5 downto 0);
signal time_remaining : STD_LOGIC_VECTOR(11 downto 0);
signal win_state, lose_state : STD_LOGIC;

begin

    initGame : process (current_state) 
    begin
        if (current_state = "0100") then
            reset <= '0';
        else
            reset <= '1';
        end if;
    end process;
    
-- NEED TO KNOW HOW SSEG DISPLAY DRIVER WILL WORK
    PatternSystem : Pattern_Gen port map (clk => clk, reset => reset, pattern => pattern);
    TrapSystem : Trap port map (reset => reset, clk => clk, user_input => unsigned(user_input), bitmask => unsigned(bitmask), pattern => unsigned(pattern), clk_out => trap_clk_out); 
    CompareSystem : Comparator port map (reset => reset, user_input => user_input, pattern => pattern, bitmask => bitmask, result => win_state);
    ConvertToBCD : Binary_To_BCD port map (clk =>  clk, binary_in => time_remaining, ones => ones, tens => tens, hundreds => hundreds, thousands => thousands, sseg_enable => sseg_enable); 
    CountdownTimer : Timer port map (clk => trap_clk_out, reset => reset, difficulty => bitmask, time_remaining => time_remaining, out_of_time => lose_state);
    
    timer_out_0 <= ones;
    timer_out_1 <= tens;
    timer_out_2 <= hundreds;
    timer_out_3 <= thousands;
    
    pattern_adj <= pattern AND bitmask;
    
    game_over <= win_state OR lose_state;
    win <= win_state;
    lose <= lose_state;

end arch_Game_Module;
