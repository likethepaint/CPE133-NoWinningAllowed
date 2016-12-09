library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity Device_Wrapper is
  Port ( clk : in STD_LOGIC;
         reset : in STD_LOGIC;
         switches : in STD_LOGIC_VECTOR(15 downto 0);
         btn_top : in STD_LOGIC;
         btn_bottom : in STD_LOGIC;
         btn_left : in STD_LOGIC;
         btn_right : in STD_LOGIC;
         btn_center : in STD_LOGIC;
         pattern_debug : out STD_LOGIC_VECTOR(15 downto 0);
         sseg_cat : out STD_LOGIC_VECTOR(7 downto 0);
         sseg_an : out STD_LOGIC_VECTOR(3 downto 0);
         buzz : out STD_LOGIC);
end Device_Wrapper;

architecture arch_Device_Wrapper of Device_Wrapper is  

    component Init_Driver is
      Port ( clk : in STD_LOGIC;
             sseg_out0 : out STD_LOGIC_VECTOR(5 downto 0);
             sseg_out1 : out STD_LOGIC_VECTOR(5 downto 0);
             sseg_out2 : out STD_LOGIC_VECTOR(5 downto 0);
             sseg_out3 : out STD_LOGIC_VECTOR(5 downto 0));
    end component;
    
    component State_Controller is
      Port ( clk : in STD_LOGIC;
             reset : in STD_LOGIC;
             center_btn : in STD_LOGIC;
             game_over : in STD_LOGIC;
             state : out STD_LOGIC_VECTOR(3 downto 0));
    end component;
    
    component Difficulty_Driver is
      Port ( clk : in STD_LOGIC;
             left_btn : in STD_LOGIC;
             right_btn : in STD_LOGIC;
             state : in STD_LOGIC_VECTOR(3 downto 0);
             difficulty : out STD_LOGIC_VECTOR(15 downto 0); 
             sseg_out0 : out STD_LOGIC_VECTOR(5 downto 0);
             sseg_out1 : out STD_LOGIC_VECTOR(5 downto 0);
             sseg_out2 : out STD_LOGIC_VECTOR(5 downto 0);
             sseg_out3 : out STD_LOGIC_VECTOR(5 downto 0));
    end component;
    
    component End_Driver is
      Port ( clk : in STD_LOGIC;
             win : in STD_LOGIC;
             lose : in STD_LOGIC;
             state : in STD_LOGIC_VECTOR(3 downto 0); 
             sseg_out0 : out STD_LOGIC_VECTOR(5 downto 0);
             sseg_out1 : out STD_LOGIC_VECTOR(5 downto 0);
             sseg_out2 : out STD_LOGIC_VECTOR(5 downto 0);
             sseg_out3 : out STD_LOGIC_VECTOR(5 downto 0));
    end component;
    
    component Game_Driver is
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
    end component;
    
    component Button is
        Port (raw_input : in STD_LOGIC;
              clk : in STD_LOGIC;
              debounced_output : out STD_LOGIC);
    end component;

    component SSEG_Select is
        Port (clk : in STD_LOGIC;
              state : in STD_LOGIC_VECTOR(3 downto 0);
              init_sseg0 : in STD_LOGIC_VECTOR(5 downto 0);
              init_sseg1 : in STD_LOGIC_VECTOR(5 downto 0);
              init_sseg2 : in STD_LOGIC_VECTOR(5 downto 0);
              init_sseg3 : in STD_LOGIC_VECTOR(5 downto 0);
              difficulty_sseg0 : in STD_LOGIC_VECTOR(5 downto 0);
              difficulty_sseg1 : in STD_LOGIC_VECTOR(5 downto 0);
              difficulty_sseg2 : in STD_LOGIC_VECTOR(5 downto 0);
              difficulty_sseg3 : in STD_LOGIC_VECTOR(5 downto 0);
              game_sseg0 : in STD_LOGIC_VECTOR(5 downto 0);
              game_sseg1 : in STD_LOGIC_VECTOR(5 downto 0);
              game_sseg2 : in STD_LOGIC_VECTOR(5 downto 0);
              game_sseg3 : in STD_LOGIC_VECTOR(5 downto 0);
              end_sseg0 : in STD_LOGIC_VECTOR(5 downto 0);
              end_sseg1 : in STD_LOGIC_VECTOR(5 downto 0);
              end_sseg2 : in STD_LOGIC_VECTOR(5 downto 0);
              end_sseg3 : in STD_LOGIC_VECTOR(5 downto 0);
              to_display0 : out STD_LOGIC_VECTOR(5 downto 0);
              to_display1 : out STD_LOGIC_VECTOR(5 downto 0);
              to_display2 : out STD_LOGIC_VECTOR(5 downto 0);
              to_display3 : out STD_LOGIC_VECTOR(5 downto 0));
    end component;

    component SSEG_Driver is
      Port (   clk : in STD_LOGIC;
               sseg_in0 : in STD_LOGIC_VECTOR(5 downto 0);
               sseg_in1 : in STD_LOGIC_VECTOR(5 downto 0);
               sseg_in2 : in STD_LOGIC_VECTOR(5 downto 0);
               sseg_in3 : in STD_LOGIC_VECTOR(5 downto 0); 
               sseg_an : out STD_LOGIC_VECTOR(3 downto 0);
               sseg_cat : out STD_LOGIC_VECTOR(7 downto 0));
    end component;

    signal btn_valid_top, btn_valid_bottom, btn_valid_right, btn_valid_left, btn_valid_center : STD_LOGIC;
    
    -- State Controller signals
    signal state : STD_LOGIC_VECTOR(3 downto 0);   -- State signal from State Controller
    
    -- Difficulty driver signals
    signal difficulty : STD_LOGIC_VECTOR(15 downto 0);  -- Difficulty bitmask 
    signal difficulty_sseg0, difficulty_sseg1, difficulty_sseg2, difficulty_sseg3 : STD_LOGIC_VECTOR(5 downto 0);
    
    -- Game Driver signals
    signal game_over : STD_LOGIC;   -- Game over signal from game driver
    signal win : STD_LOGIC;
    signal lose : STD_LOGIC;
    signal game_sseg0, game_sseg1, game_sseg2, game_sseg3 : STD_LOGIC_VECTOR(5 downto 0); 
    --signal pattern_debug : STD_LOGIC_VECTOR(15 downto 0);
    
    -- Init Driver signals
    signal init_sseg0, init_sseg1, init_sseg2, init_sseg3 : STD_LOGIC_VECTOR(5 downto 0);
    
    -- End Driver signals
    signal end_sseg0, end_sseg1, end_sseg2, end_sseg3 : STD_LOGIC_VECTOR(5 downto 0);
    
    -- SSEG Select signals
    signal to_display0, to_display1, to_display2, to_display3 : STD_LOGIC_VECTOR(5 downto 0);
    
    
    signal pattern : STD_LOGIC_VECTOR(15 downto 0);
    signal debug_flag : STD_LOGIC := '0';
begin

    GameResult : process (state, btn_valid_top, debug_flag) 
    begin
        if (rising_edge(btn_valid_top)) then
            debug_flag <= not debug_flag;
        end if;
        if (debug_flag = '1') then
            pattern_debug <= pattern;
        elsif (state = "1000") then
            pattern_debug <= pattern;
        else
            pattern_debug <= x"0000";
        end if;
    end process;
    
    -- Intermediate logic between signals
    game_over <= win OR lose;
    
    -- Begin button instance definitions
    TopButton : Button port map (raw_input => btn_top,
                                 clk => clk,
                                 debounced_output => btn_valid_top);
    BottomButton : Button port map (raw_input => btn_bottom,
                                    clk => clk,
                                    debounced_output => btn_valid_bottom);
    CenterButton : Button port map (raw_input => btn_center,
                                    clk => clk,
                                    debounced_output => btn_valid_center); 
    LeftButton : Button port map (raw_input => btn_left,
                                    clk => clk,
                                    debounced_output => btn_valid_left);
    RightButton : Button port map (raw_input => btn_right,
                                    clk => clk,
                                    debounced_output => btn_valid_right);
    -- End button instance definitions --
    
    -- Begin State Controller instance --
    StateController : State_Controller port map (clk => clk,
                                                 reset => btn_valid_bottom,
                                                 center_btn => btn_valid_center,
                                                 game_over => game_over,
                                                 state => state);
    -- End State Controller instance --
    
    -- Begin Difficulty Driver instance --
    DifficultyDriver : Difficulty_Driver port map (clk => clk,
                                                   left_btn => btn_valid_left,
                                                   right_btn => btn_valid_right,
                                                   state => state,
                                                   difficulty => difficulty,
                                                   sseg_out0 => difficulty_sseg0,
                                                   sseg_out1 => difficulty_sseg1,
                                                   sseg_out2 => difficulty_sseg2,
                                                   sseg_out3 => difficulty_sseg3);
    -- End Difficulty Driver instance --
    
    -- Begin Game Driver instance --
    GameDriver : Game_Driver port map (clk => clk,
                                       state => state,
                                       difficulty => difficulty,
                                       user_input => switches,
                                       sseg_out0 => game_sseg0,
                                       sseg_out1 => game_sseg1,
                                       sseg_out2 => game_sseg2,
                                       sseg_out3 => game_sseg3,
                                       win => win,
                                       lose => lose,
                                       pattern => pattern,
                                       buzz => buzz);
    -- End Game Driver instance --
    
    -- Begin Init Driver instance --
    InitDriver : Init_Driver port map (clk => clk,
                                       sseg_out0 => init_sseg0,
                                       sseg_out1 => init_sseg1,
                                       sseg_out2 => init_sseg2,
                                       sseg_out3 => init_sseg3);
    -- End Init Driver instance --
    
    -- Begin End Driver instance --
    EndDriver : End_Driver port map (clk => clk,
                                     win => win,
                                     lose => lose,
                                     state => state,
                                     sseg_out0 => end_sseg0,
                                     sseg_out1 => end_sseg1,
                                     sseg_out2 => end_sseg2,
                                     sseg_out3 => end_sseg3);
    -- End End Driver instance -- haha
    
    -- Begin SSEG Select instance --
    SSEGSelect : SSEG_Select port map (clk => clk,
                                       state => state,
                                       init_sseg0 => init_sseg0,
                                       init_sseg1 => init_sseg1,
                                       init_sseg2 => init_sseg2,
                                       init_sseg3 => init_sseg3,
                                       difficulty_sseg0 => difficulty_sseg0,
                                       difficulty_sseg1 => difficulty_sseg1,
                                       difficulty_sseg2 => difficulty_sseg2,
                                       difficulty_sseg3 => difficulty_sseg3,
                                       game_sseg0 => game_sseg0,
                                       game_sseg1 => game_sseg1,
                                       game_sseg2 => game_sseg2,
                                       game_sseg3 => game_sseg3,
                                       end_sseg0 => end_sseg0,
                                       end_sseg1 => end_sseg1,
                                       end_sseg2 => end_sseg2,
                                       end_sseg3 => end_sseg3,
                                       to_display0 => to_display0,
                                       to_display1 => to_display1,
                                       to_display2 => to_display2,
                                       to_display3 => to_display3);
    -- End SSEG Select instance --
    
    -- Begin SSEG Driver instance --
    SSEGDriver : SSEG_Driver port map (clk => clk,
                                       sseg_in0 => to_display0,
                                       sseg_in1 => to_display1,
                                       sseg_in2 => to_display2,
                                       sseg_in3 => to_display3,
                                       sseg_an => sseg_an,
                                       sseg_cat => sseg_cat);
    -- End SSEG Drive instance --

end arch_Device_Wrapper;