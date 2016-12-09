----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/02/2016 12:28:17 PM
-- Design Name: 
-- Module Name: Button_Test - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Button_Test is
    Port (raw_input : in STD_LOGIC;
          clk : in STD_LOGIC;
          led_output : out STD_LOGIC);
end Button_Test;

architecture Behavioral of Button_Test is

component Button
    Port (raw_input : in STD_LOGIC;
          clk : in STD_LOGIC;
          debounced_output : out STD_LOGIC);
end component;

signal pulse : STD_LOGIC := '0';
signal led_sample : STD_LOGIC := '0';

begin

    MyButton : Button port map (raw_input => raw_input, clk => clk, debounced_output => pulse);
    
    process (clk) 
    begin
        if rising_edge(clk) then
            if (pulse = '1') then
                led_sample <= not led_sample;
            end if;
        end if;
    end process;
    
    led_output <= led_sample;
    
end Behavioral;
