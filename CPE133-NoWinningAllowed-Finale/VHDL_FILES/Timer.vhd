----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/05/2016 12:22:20 PM
-- Design Name: 
-- Module Name: Timer - arch_Timer
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
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
        --variable time_counter : STD_LOGIC_VECTOR(11 downto 0) := x"000";
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
