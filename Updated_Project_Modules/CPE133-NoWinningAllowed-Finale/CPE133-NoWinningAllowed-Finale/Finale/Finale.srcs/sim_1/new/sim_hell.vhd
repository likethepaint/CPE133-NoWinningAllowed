----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/07/2016 02:42:15 PM
-- Design Name: 
-- Module Name: sim_hell - Behavioral
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

entity sim_hell is
--  Port ( );
end sim_hell;

architecture Behavioral of sim_hell is
component State_Machine_Wrapper is
  Port ( 
        reset : in STD_LOGIC;--defined hard reset button
        clk : in STD_LOGIC;
        debug_leds_input : in STD_LOGIC;
        raw_input : in STD_LOGIC_VECTOR(2 downto 0);
        user_input : in STD_LOGIC_VECTOR(15 downto 0);
        sseg_an : out STD_LOGIC_VECTOR(3 downto 0);
        sseg_cat : out STD_LOGIC_VECTOR(7 downto 0);
        debug_pattern_adj : out STD_LOGIC_VECTOR(15 downto 0));--this is the button input from the user
        
end component;
signal reset, debug_leds_input : STD_LOGIC;
signal raw_input : STD_LOGIC_VECTOR(2 downto 0);
signal user_input, debug_pattern_adj : STD_LOGIC_VECTOR(15 downto 0);
signal sseg_an : STD_LOGIC_VECTOR(3 downto 0);
signal sseg_cat : STD_LOGIC_VECTOR(7 downto 0);

signal clk : STD_LOGIC := '1';
begin

clk <= not clk after 5 ns;
    UUT : State_Machine_Wrapper port map(reset => reset,
                                         clk => clk,
                                         debug_leds_input => debug_leds_input,
                                         raw_input => raw_input,
                                         user_input => user_input,
                                         sseg_an => sseg_an,
                                         sseg_cat => sseg_cat,
                                         debug_pattern_adj => debug_pattern_adj);
    process
    begin
        reset <= '1';
        debug_leds_input <= '0';
        user_input <= x"0000";
        raw_input <= "000";
        wait for 10 ns;
        
        reset <= '0';
        
        wait for 1 ms;
        
        raw_input <= "010";
        
        wait for 1 ms;
        
        raw_input <= "000";
        wait;
    end process;

end Behavioral;
