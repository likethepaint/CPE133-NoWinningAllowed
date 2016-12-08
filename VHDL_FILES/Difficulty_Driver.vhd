library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

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

    component Display_Word is
      Port ( clk : in STD_LOGIC;
             bin_in : in STD_LOGIC_VECTOR(2 downto 0); 
             sseg_out0 : out STD_LOGIC_VECTOR(5 downto 0);
             sseg_out1 : out STD_LOGIC_VECTOR(5 downto 0);
             sseg_out2 : out STD_LOGIC_VECTOR(5 downto 0);
             sseg_out3 : out STD_LOGIC_VECTOR(5 downto 0));
    end component;

    type state_type is (easy, medium, hard);
    signal PS, NS : state_type;
    
    signal difficulty_word_select : STD_LOGIC_VECTOR(2 downto 0);
    
    signal easy_bitmask : STD_LOGIC_VECTOR(15 downto 0) := x"000F";
    signal medium_bitmask : STD_LOGIC_VECTOR(15 downto 0) := x"00FF";
    signal hard_bitmask : STD_LOGIC_VECTOR(15 downto 0) := x"FFFF";
    
begin
    
    sync_proc : process (clk, NS)
    begin
        if (state /= "0010") then
            PS <= easy;
        elsif (rising_edge(clk)) then
            PS <= NS;
        end if;    
    end process;
    
    comb_proc : process(PS, right_btn, left_btn)
    begin
        case PS is
            when easy =>
                if (right_btn = '1') then
                    NS <= medium;
                elsif (left_btn = '1') then
                    NS <= hard;
                end if;
            when medium =>
                if (right_btn = '1') then
                    NS <= hard;
                elsif (left_btn = '1') then
                    NS <= easy;
                end if;
            when hard =>
                if (right_btn = '1') then
                    NS <= easy;
                elsif (left_btn = '1') then
                    NS <= medium;
                end if;
            when others =>
                NS <= easy;
        end case;
    end process;
    
    with PS select
        difficulty <= easy_bitmask when easy,
                      medium_bitmask when medium,
                      hard_bitmask when hard,
                      easy_bitmask when others;
    
    with PS select
          difficulty_word_select <= "010" when easy,    -- Display EASY
                                    "011" when medium,  -- Display MEDIUM
                                    "100" when hard,    -- DISPLAY HARD
                                    "010" when others;  -- DISPLAY EASY

    GenExpression : Display_Word port map (clk => clk,
                                           bin_in => difficulty_word_select,
                                           sseg_out0 => sseg_out0,
                                           sseg_out1 => sseg_out1,
                                           sseg_out2 => sseg_out2,
                                           sseg_out3 => sseg_out3); 
                                           
end arch_Difficulty_Driver;