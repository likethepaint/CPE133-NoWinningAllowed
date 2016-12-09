----------------------------------------------------------------------------------
--By Collin Kenner and Brett Glidden
-- Test Bench for State Machines
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity State_Machine_Wrapper is
  Port ( 
        reset : in STD_LOGIC;--defined hard reset button
        clk : in STD_LOGIC;
        debug_leds_input : in STD_LOGIC;
        raw_input : in STD_LOGIC_VECTOR(2 downto 0);
        user_input : in STD_LOGIC_VECTOR(15 downto 0);
        sseg_an : out STD_LOGIC_VECTOR(3 downto 0);
        sseg_cat : out STD_LOGIC_VECTOR(7 downto 0);
        debug_pattern_adj : out STD_LOGIC_VECTOR(15 downto 0));--this is the button input from the user
        
end State_Machine_Wrapper;

architecture Behavioral of State_Machine_Wrapper is
    component button_splitter
    Port (    
          raw_input : in STD_LOGIC_VECTOR(2 downto 0);--this maps to the raw input value from the buttons in the state machine wrapper
          clk : in STD_LOGIC;
          output : out STD_LOGIC_VECTOR(2 downto 0));--if button presses were valid these outputs will go high
    end component;
    
    component button_input is
       Port (
 --depending on which state the user is in this will change, this allows the hardware to determine where modules are getting their inputs from.
             current_state : in STD_LOGIC_VECTOR(3 downto 0);
 --active buttons are the valid buttons from the button splitter, if in the correct state they are mapped too difficulty select.            
             active_buttons : in STD_LOGIC_VECTOR(2 downto 0);
             difficulty_select: out STD_LOGIC_VECTOR(2 downto 0);
 --if any button is high, and the state machine is in the initial state, this goes high signifying the beginning of the game.
             initialize_game : out STD_LOGIC;
             init_word_select : out STD_LOGIC_VECTOR(2 downto 0);--output word for this state
             clk : in STD_LOGIC);
    end component;
    
    component Game_Module
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
    end component;
    
    component End_Driver
         Port ( 
            win : in STD_LOGIC;
            lose : in STD_LOGIC;
            current_state : in STD_LOGIC_VECTOR(3 downto 0); 
            end_word_select : out STD_LOGIC_VECTOR(2 downto 0));
    end component;
    
    component button_fsm is
        Port ( middle_button : in STD_LOGIC;--button input(2)
               left_button : in STD_LOGIC;--button_input(1)
               right_button : in STD_LOGIC;--button_input(3)
               activate : in STD_LOGIC;--initialize input to put FSM into first state
               clk : in STD_LOGIC;
               difficulty : out STD_LOGIC_VECTOR (15 downto 0);--output used for the game
               diff_selected : out STD_LOGIC;
               word_select : out STD_LOGIC_VECTOR(2 downto 0));
    end component;
    
    component SSEG_Select is
       Port (current_state : in STD_LOGIC_VECTOR(3 downto 0);
              clk : in STD_LOGIC;
              init_word0 : in STD_LOGIC_VECTOR(5 downto 0);
              init_word1 : in STD_LOGIC_VECTOR(5 downto 0);
              init_word2 : in STD_LOGIC_VECTOR(5 downto 0);
              init_word3 : in STD_LOGIC_VECTOR(5 downto 0);
              dif_word0 : in STD_LOGIC_VECTOR(5 downto 0);
              dif_word1 : in STD_LOGIC_VECTOR(5 downto 0);
              dif_word2 : in STD_LOGIC_VECTOR(5 downto 0);
              dif_word3 : in STD_LOGIC_VECTOR(5 downto 0);
              game_word0 : in STD_LOGIC_VECTOR(5 downto 0);
              game_word1 : in STD_LOGIC_VECTOR(5 downto 0);
              game_word2 : in STD_LOGIC_VECTOR(5 downto 0);
              game_word3 : in STD_LOGIC_VECTOR(5 downto 0);
              end_word0 : in STD_LOGIC_VECTOR(5 downto 0);
              end_word1 : in STD_LOGIC_VECTOR(5 downto 0);
              end_word2 : in STD_LOGIC_VECTOR(5 downto 0);
              end_word3 : in STD_LOGIC_VECTOR(5 downto 0);
              to_display0 : out STD_LOGIC_VECTOR(5 downto 0);
              to_display1 : out STD_LOGIC_VECTOR(5 downto 0);
              to_display2 : out STD_LOGIC_VECTOR(5 downto 0);
              to_display3 : out STD_LOGIC_VECTOR(5 downto 0));
    end component;
    
    component Game_State_Machine is
          Port ( 
                reset : in STD_LOGIC;--initalize input to begin game
                clk : in STD_LOGIC;
                initialize_button_in: in STD_LOGIC;--goes high when user pushes any one of the three menu buttons
                activate_difficulty_select : out STD_LOGIC;--initializes the difficulty select state machine
                game_over : in STD_LOGIC;
                selected_difficulty : in STD_LOGIC;--goes high when the difficulty select state gets a selected value
                state_id : out STD_LOGIC_VECTOR (3 downto 0));--tells the rest of the device which state the program currently is in
    end component;
    
    component Generate_Word is
      Port ( clk : in STD_LOGIC;
             cen : in STD_LOGIC;
             bin_in : in STD_LOGIC_VECTOR(2 downto 0); 
             to_display0 : out STD_LOGIC_VECTOR(5 downto 0);
             to_display1 : out STD_LOGIC_VECTOR(5 downto 0);
             to_display2 : out STD_LOGIC_VECTOR(5 downto 0);
             to_display3 : out STD_LOGIC_VECTOR(5 downto 0));
    end component;
    
    component Display_Key is
      Port (   clk : in STD_LOGIC;
               cen : in STD_LOGIC;
               bin_in1 : in STD_LOGIC_VECTOR(5 downto 0);
               bin_in2 : in STD_LOGIC_VECTOR(5 downto 0);
               bin_in3 : in STD_LOGIC_VECTOR(5 downto 0);
               bin_in4 : in STD_LOGIC_VECTOR(5 downto 0); 
               sseg_an : out STD_LOGIC_VECTOR(3 downto 0);
               sseg_cat : out STD_LOGIC_VECTOR(7 downto 0));
    end component;
    
    signal active_buttons_wire,difficulty_select_wire : STD_LOGIC_VECTOR(2 downto 0);
    signal id_wire : STD_LOGIC_VECTOR(3 downto 0);
    signal initialize_game_wire,activate_difficulty_state_machine_wire,game_over_wire : STD_LOGIC;
    signal selected_difficulty_wire : STD_LOGIC;--wire from the button FSM to the game state determining whether the user has picked a difficulty
    signal game_difficulty,real_pattern_wire : STD_LOGIC_VECTOR(15 downto 0);
    signal timer_out_0_wire,timer_out_1_wire,timer_out_2_wire,timer_out_3_wire : STD_LOGIC_VECTOR(5 downto 0);
    signal win_or_lose: STD_LOGIC_VECTOR(1 downto 0);
    signal init_word0_wire, init_word1_wire, init_word2_wire, init_word3_wire : STD_LOGIC_VECTOR(5 downto 0);
    signal dif_word0_wire, dif_word1_wire, dif_word2_wire, dif_word3_wire : STD_LOGIC_VECTOR(5 downto 0);
    signal end_word0_wire, end_word1_wire, end_word2_wire, end_word3_wire : STD_LOGIC_VECTOR(5 downto 0);
    signal to_display0_wire,to_display1_wire,to_display2_wire,to_display3_wire : STD_LOGIC_VECTOR(5 downto 0);
    signal dif_word_select, init_word_select, end_word_select : STD_LOGIC_VECTOR (2 downto 0); 
    signal pattern_adj : STD_LOGIC_VECTOR(15 downto 0);
    signal leds : STD_LOGIC;
    
begin
    
    DebugLeds : process (debug_leds_input)
    begin
        if (debug_leds_input = '1') then
            debug_pattern_adj <= pattern_adj;
        else
            debug_pattern_adj <= x"0000";
        end if;
    end process;
    
    
     
    button_module : button_splitter port map(raw_input =>raw_input,
                                             clk => clk, 
                                             output => active_buttons_wire);
                                              
    button_press_driver : button_input port map(current_state =>id_wire,
                                                active_buttons => active_buttons_wire,
                                                difficulty_select => difficulty_select_wire,
                                                initialize_game => initialize_game_wire,
                                                init_word_select => init_word_select,
                                                clk => clk);
    
    actual_game_module : Game_Module port map(clk =>clk,-------------------------------------working on this 
                                       current_state =>id_wire,
                                       bitmask => game_difficulty,
                                       user_input => user_input,
                                       timer_out_0 => timer_out_0_wire,
                                       timer_out_1 => timer_out_1_wire,
                                       timer_out_2 => timer_out_2_wire,
                                       timer_out_3 => timer_out_3_wire,
                                       win => win_or_lose(1),
                                       lose => win_or_lose(0),
                                       game_over => game_over_wire,
                                       pattern_adj => pattern_adj);

    
    Seven_Segment_Driver : SSEG_Select port map(current_state => id_wire,
                                                clk => clk,
                                                init_word0 => init_word0_wire,
                                                init_word1 => init_word1_wire,
                                                init_word2 => init_word2_wire,
                                                init_word3 => init_word3_wire,
                                                dif_word0 => dif_word0_wire,
                                                dif_word1 =>  dif_word1_wire,
                                                dif_word2 => dif_word2_wire,
                                                dif_word3 => dif_word3_wire,
                                                game_word0 => timer_out_0_wire,
                                                game_word1 => timer_out_1_wire,
                                                game_word2 => timer_out_2_wire,
                                                game_word3 => timer_out_3_wire,
                                                end_word0 =>  end_word0_wire,
                                                end_word1 =>  end_word1_wire,
                                                end_word2 =>  end_word2_wire,
                                                end_word3 =>  end_word3_wire,
                                                to_display0 => to_display0_wire,
                                                to_display1 => to_display1_wire,
                                                to_display2 => to_display2_wire,
                                                to_display3 => to_display3_wire);                                                                           
                                        
                                       
                                        
                                        
                                        
    game: Game_State_Machine port map(reset=>reset,
                                      clk => clk,
                                      initialize_button_in => initialize_game_wire,
                                      activate_difficulty_select => activate_difficulty_state_machine_wire,
                                      game_over => game_over_wire,
                                      selected_difficulty => selected_difficulty_wire,
                                      state_id => id_wire);
     
    dif_select: button_fsm port map(
                                      clk => clk,
                                      left_button => difficulty_select_wire(0)  ,
                                      right_button => difficulty_select_wire(2) ,
                                      middle_button => difficulty_select_wire(1) ,
                                      activate => activate_difficulty_state_machine_wire ,
                                      difficulty => game_difficulty,
                                      diff_selected => selected_difficulty_wire,
                                      word_select => dif_word_select);
                                      
    end_state_driver : End_Driver port map(
                                           win => win_or_lose(1),
                                           lose => win_or_lose(0),
                                           current_state => id_wire,
                                           end_word_select => end_word_select);
    
    
    

    
    
    
    Generate_Word_Init : Generate_Word port map ( clk => clk,
                                                  cen => '1',
                                                  bin_in => init_word_select,
                                                  to_display0 => init_word0_wire,
                                                  to_display1 => init_word1_wire,
                                                  to_display2 => init_word2_wire,
                                                  to_display3 => init_word3_wire);
                                                  
     Generate_Word_Dif : Generate_Word port map ( clk => clk,
                                                  cen => '1',
                                                  bin_in => dif_word_select,
                                                  to_display0 => dif_word0_wire,
                                                  to_display1 => dif_word1_wire,
                                                  to_display2 => dif_word2_wire,
                                                  to_display3 => dif_word3_wire);
    
    Generate_Word_End : Generate_Word port map ( clk => clk,
                                                 cen => '1',
                                                 bin_in => end_word_select,
                                                 to_display0 => end_word0_wire,
                                                 to_display1 => end_word1_wire,
                                                 to_display2 => end_word2_wire,
                                                 to_display3 => end_word3_wire);

    SSEG_Display : Display_Key port map (clk => clk, 
                                         cen => '1',
                                         bin_in1 => to_display0_wire,
                                         bin_in2 => to_display1_wire,
                                         bin_in3 => to_display2_wire,
                                         bin_in4 => to_display3_wire,
                                         sseg_cat => sseg_cat,
                                         sseg_an => sseg_an);

end Behavioral;
