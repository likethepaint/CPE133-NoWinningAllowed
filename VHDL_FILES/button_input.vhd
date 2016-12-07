----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/07/2016 01:32:02 AM
-- Design Name: 
-- Module Name: button_input - Behavioral
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

entity button_input is
   Port (
         current_state : in STD_LOGIC_VECTOR(3 downto 0);
         active_buttons : in STD_LOGIC_VECTOR(2 downto 0);
         difficulty_select: out STD_LOGIC_VECTOR(2 downto 0);
         initialize_game : out STD_LOGIC;
         clk : in STD_LOGIC);
end button_input;

architecture Behavioral of button_input is


begin
    process (active_buttons,clk)
    variable counter : integer range 0 to 10000000 := 0;
    begin
            if(current_state = "0001") then
                if(unsigned(active_buttons) > 0)then
                    initialize_game <= '1';
                    difficulty_select <= "000";
                end if;
            elsif(current_state = "0010") then
                difficulty_select <= active_buttons;
                initialize_game <= '0';
            elsif(current_state = "0100") then
                difficulty_select <= "000";
                initialize_game <= '0';
            elsif(current_state = "0100") then
                difficulty_select <= "000";
                initialize_game <= '0';
            else
                difficulty_select <= "000";
                initialize_game <= '0';
            end if;
    end process;
        
        


end Behavioral;
