----------------------------------------------
-- Project : CPE 133 Final Project

-- Module Name : Trap 
-- Authors : Collin Kenner, Brett Glidden

-- Description : determines if a trap should be set
--      based off of user inputs and if so, increases
--      the clock rate sent to the timer
----------------------------------------------



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- Define Trap entity
-- Inputs
--      clk : Basys-3 clock signal
--      bitmask : bitmask based on difficulty
--      pattern : generated pattern to match
--      user_input : switch positions on basys board
-- Outputs
--      clk_out : countdown timer clk signal 
entity Trap is
    Port (reset : in STD_LOGIC;
          clk: in STD_LOGIC;
          user_input: in unsigned(15 downto 0);
          bitmask : in unsigned(15 downto 0); 
          pattern : in unsigned(15 downto 0);
          clk_out: out STD_LOGIC);
end Trap;

architecture arch_Trap of Trap is
    
    signal error_magnitude : unsigned(15 downto 0);
    signal error_sum : unsigned(4 downto 0) := "00000";
    
    -- setup a counter ceiling that will create a 1 second clock pulse
    signal clk_out_top : STD_LOGIC_VECTOR(27 downto 0) := x"2FAF080";
    --signal clk_out_top : STD_LOGIC_VECTOR(27 downto 0) := x"0100000";
    --signal clk_out_top : STD_LOGIC_VECTOR(27 downto 0) := x"000000A";
    signal clk_out_flag : STD_LOGIC := '0';
    signal clk_out_count : STD_LOGIC_VECTOR(27 downto 0) := x"0000000";
    

begin
    -- Generates a bus containing all erroneous high inputs
    error_magnitude <= ((user_input and bitmask) or pattern) xor pattern;
    error_sum <= "00000" + error_magnitude(0 downto 0) +
                 error_magnitude(1 downto 1) +
                 error_magnitude(2 downto 2) +
                 error_magnitude(3 downto 3) +
                 error_magnitude(4 downto 4) +
                 error_magnitude(5 downto 5) +
                 error_magnitude(6 downto 6) +
                 error_magnitude(7 downto 7) +
                 error_magnitude(8 downto 8) +
                 error_magnitude(9 downto 9) +
                 error_magnitude(10 downto 10) +
                 error_magnitude(11 downto 11) +
                 error_magnitude(12 downto 12) +
                 error_magnitude(13 downto 13) +
                 error_magnitude(14 downto 14) +
                 error_magnitude(15 downto 15);

    
    -- Simple clock divider
    genClkOut : process (clk, reset)
        variable prev_error_sum : unsigned(4 downto 0);
    begin
        if (reset = '1') then
                    clk_out_count <= x"0000000";
                    --clk_out_top <= x"0100000";
                    clk_out_top <= x"2FAF080";
        elsif rising_edge(clk) then
           -- trigger trap if user has 2 or more bad switch positions
           if (error_sum >= 2 AND prev_error_sum < error_sum) then
                    clk_out_top <= STD_LOGIC_VECTOR(unsigned(clk_out_top) srl 1);
                    clk_out_count <= x"0000000";
           elsif (clk_out_count = clk_out_top) then
                clk_out_flag <= not clk_out_flag;
                clk_out_count <= x"0000000";
            else
                clk_out_count <= STD_LOGIC_VECTOR(unsigned(clk_out_count) + 1);
            end if;
            prev_error_sum := error_sum;
        end if;
    end process;

    clk_out <= clk_out_flag;

end arch_Trap;
