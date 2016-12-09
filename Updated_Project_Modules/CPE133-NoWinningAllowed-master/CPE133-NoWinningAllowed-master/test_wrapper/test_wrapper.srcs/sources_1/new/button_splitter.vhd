----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/07/2016 01:17:29 AM
-- Design Name: 
-- Module Name: button_splitter - Behavioral
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

entity button_splitter is
    Port (raw_input : in STD_LOGIC_VECTOR(2 downto 0);
          clk : in STD_LOGIC;
          output : out STD_LOGIC_VECTOR(2 downto 0));
end button_splitter;

architecture Behavioral of button_splitter is

component Button
    Port (raw_input : in STD_LOGIC;
          clk : in STD_LOGIC;
          debounced_output : out STD_LOGIC);
end component;

signal pulse1, pulse2, pulse3 : STD_LOGIC := '0';
signal sample1, sample2, sample3 : STD_LOGIC := '0';
begin

    LeftButton : Button port map (raw_input => raw_input(0), clk => clk, debounced_output => pulse1);
    centerButton : Button port map (raw_input => raw_input(1), clk => clk, debounced_output => pulse2);
    rightButton : Button port map (raw_input => raw_input(2), clk => clk, debounced_output => pulse3);
    
     process (clk) 
       begin
           if rising_edge(clk) then
               if (pulse1 = '1') then
                   sample1 <= not sample1;
               end if;
               if (pulse2 = '1') then
                  sample2 <= not sample2;
               end if;
               if (pulse3 = '1') then
                  sample3 <= not sample3;
               end if;
           end if;
       end process;
       
       output(0) <= sample1;
       output(1) <= sample2;
       output(2) <= sample3;

end Behavioral;
