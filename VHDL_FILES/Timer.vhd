----------------------------------------------
-- Project : CPE 133 Final Project

-- Module Name : Timer 
-- Authors : Collin Kenner, Brett Glidden

-- Description : drives the countdown timer 
----------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Define Timer entity
-- Inputs
--      clk : clk signal from trap module
--      reset : reset signal
--      difficulty : bitmask used to determine current difficulty
-- Outputs
--      time_remaining : binary output of remaining time
--      out_of_time : HIGH when timer reaches 0
entity Timer is
    Port (clk : in STD_LOGIC;
          reset : in STD_LOGIC;
          difficulty : in STD_LOGIC_VECTOR(15 downto 0);
          time_remaining : out STD_LOGIC_VECTOR(11 downto 0);
          out_of_time : out STD_LOGIC);
end Timer;

architecture arch_Timer of Timer is

signal easy : STD_LOGIC_VECTOR(15 downto 0) := x"000F";
signal medium : STD_LOGIC_VECTOR(15 downto 0) := x"00FF";
signal hard : STD_LOGIC_VECTOR(15 downto 0) := x"FFFF";

signal time_counter : STD_LOGIC_VECTOR(11 downto 0);

begin

    Countdown: process (clk, reset)
    begin
        if (reset = '1') then
            if (difficulty = easy) then
                time_counter <= x"01E";
            elsif (difficulty = medium) then
                time_counter <= x"03C";
            elsif (difficulty = hard) then
                time_counter <= x"0F0";
            else
                time_counter <= x"FFF";
            end if;
            out_of_time <= '0';
        elsif rising_edge(clk) then
            if (time_counter /= x"000") then
              out_of_time <= '0';
              time_counter <= STD_LOGIC_VECTOR(unsigned(time_counter) - 1);
            else
                out_of_time <= '1';
            end if;
        end if;        
    end process;

    time_remaining <= time_counter;
    
end arch_Timer;
