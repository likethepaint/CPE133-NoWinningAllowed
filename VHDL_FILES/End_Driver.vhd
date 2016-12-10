----------------------------------------------
-- Project : CPE 133 Final Project

-- Module Name : End_Driver
-- Authors : Collin Kenner, Brett Glidden

-- Description : drives the end game state success/fail messages
----------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Define End_Driver entity
-- Inputs
--      clk : 100 MHz Basys-3 system clock
--      win : game driver win signal
--      lose : game driver lose signal
--      state : current high level game state
-- Outputs
--      sseg_out* : 6 bit value representing character to display on seven segment 
entity End_Driver is
  Port ( clk : in STD_LOGIC;
         win : in STD_LOGIC;
         lose : in STD_LOGIC;
         state : in STD_LOGIC_VECTOR(3 downto 0); 
         sseg_out0 : out STD_LOGIC_VECTOR(5 downto 0);
         sseg_out1 : out STD_LOGIC_VECTOR(5 downto 0);
         sseg_out2 : out STD_LOGIC_VECTOR(5 downto 0);
         sseg_out3 : out STD_LOGIC_VECTOR(5 downto 0));
end End_Driver;

architecture Behavioral of End_Driver is     

-- Default word select to "loser"
signal end_word_select : STD_LOGIC_VECTOR(2 downto 0) := "110";

-- Bring in dictionary for word selects
component Display_Word is
  Port ( clk : in STD_LOGIC;
         bin_in : in STD_LOGIC_VECTOR(2 downto 0); 
         sseg_out0 : out STD_LOGIC_VECTOR(5 downto 0);
         sseg_out1 : out STD_LOGIC_VECTOR(5 downto 0);
         sseg_out2 : out STD_LOGIC_VECTOR(5 downto 0);
         sseg_out3 : out STD_LOGIC_VECTOR(5 downto 0));
end component;

begin
    
    -- Display word to the seven segment
    GenExpression : Display_Word port map (clk => clk,
                                           bin_in => end_word_select,
                                           sseg_out0 => sseg_out0,
                                           sseg_out1 => sseg_out1,
                                           sseg_out2 => sseg_out2,
                                           sseg_out3 => sseg_out3); 

    -- Choose which word to display based on game win/loss signals
    GenWinLoss : process (win, lose) 
    begin
        if (win = '1') then
            end_word_select <= "101";
        elsif (lose = '1') then
            end_word_select <= "110";
        end if;
    end process;


end Behavioral;
