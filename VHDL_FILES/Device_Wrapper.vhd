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
         sseg_out0 : out STD_LOGIC_VECTOR(5 downto 0);
         sseg_out1 : out STD_LOGIC_VECTOR(5 downto 0);
         sseg_out2 : out STD_LOGIC_VECTOR(5 downto 0);
         sseg_out3 : out STD_LOGIC_VECTOR(5 downto 0));
end Device_Wrapper;

architecture arch_Device_Wrapper of Device_Wrapper is  

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
              pattern : out STD_LOGIC_VECTOR(15 downto 0));
    end component;
    
    component Button is
        Port (raw_input : in STD_LOGIC;
              clk : in STD_LOGIC;
              debounced_output : out STD_LOGIC);
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
    signal pattern_debug : STD_LOGIC_VECTOR(15 downto 0);
    
begin

    -- Start button instance definitions
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
                                       pattern => pattern_debug);
                                       
end arch_Device_Wrapper;