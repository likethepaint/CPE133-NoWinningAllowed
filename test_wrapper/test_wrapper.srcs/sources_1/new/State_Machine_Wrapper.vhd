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
        raw_input : in STD_LOGIC_VECTOR(2 downto 0));--this is the button input from the user
        
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
             initialize_game : out STD_LOGIC);
    end component;
    
    component button_fsm is
        Port ( middle_button : in STD_LOGIC;--button input(2)
               left_button : in STD_LOGIC;--button_input(1)
               right_button : in STD_LOGIC;--button_input(3)
               activate : in STD_LOGIC;--initialize input to put FSM into first state
               clk : in STD_LOGIC;
               selected_difficulty : out STD_LOGIC_VECTOR (2 downto 0));--output used for the game
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
    
    signal active_buttons_wire,difficulty_select_wire,game_difficulty : STD_LOGIC_VECTOR(2 downto 0);
    signal current_state,id_wire : STD_LOGIC_VECTOR(3 downto 0);
    signal initialize_game_wire,activate_difficulty_state_machine_wire,game_over_wire : STD_LOGIC;
    signal selected_difficulty_wire : STD_LOGIC;
begin
    button_module : button_splitter port map(raw_input =>raw_input,
                                             clk => clk, 
                                             output => active_buttons_wire);
    button_press_driver : button_input port map(current_state =>current_state,
                                                active_buttons => active_buttons_wire,
                                                difficulty_select => difficulty_select_wire,
                                                initialize_game => initialize_game_wire);
    Game: Game_State_Machine port map(reset=>reset,
                                      clk => clk,
                                      initialize_button_in => initialize_game_wire,
                                      activate_difficulty_select => activate_difficulty_state_machine_wire,
                                      game_over => game_over_wire,
                                      selected_difficulty => selected_difficulty_wire,
                                      state_id => id_wire);
     
    dif_select: button_fsm port map(
                                      clk => clk,
                                      left_button => difficulty_select_wire(0)  ,
                                      right_button => difficulty_select_wire(1) ,
                                      middle_button => difficulty_select_wire(2) ,
                                      activate => activate_difficulty_state_machine_wire ,
                                      selected_difficulty => game_difficulty );

end Behavioral;
