----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/07/2016 02:33:07 AM
-- Design Name: 
-- Module Name: test_bench - Behavioral
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

entity test_bench is
--  Port ( );
end test_bench;

architecture Behavioral of test_bench is
component State_Machine_Wrapper is
  Port ( 
        reset : in STD_LOGIC;--defined hard reset button
        clk : in STD_LOGIC;
        initialize_button_in: in STD_LOGIC;--goes high when user pushes any one of the three menu buttons
        raw_input : in STD_LOGIC_VECTOR(2 downto 0));--this is the button input from the user
        
end component;
signal reset, initialize_button_in : STD_LOGIC;
signal raw_input : STD_LOGIC_VECTOR(2 downto 0);
signal clk : STD_LOGIC := '0';
begin
    clk <= NOT clk after 5 ns;
    UUT : State_Machine_Wrapper port map(reset=>reset, clk => clk, initialize_button_in=>initialize_button_in, raw_input =>raw_input);
    
    process begin
    raw_input <="100";
    reset <= '1';
    wait for 5 ms;
    
    reset <= '0';
    raw_input <="100";
    wait for 5 ms;
    
    raw_input <="001";
    wait for 5 ms;
    
    raw_input <="000";
    wait for 5 ms;
        
    raw_input <="100";
    wait for 5 ms;
    
    wait;
    
    end process;

end Behavioral;
