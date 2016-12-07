----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/05/2016 07:23:57 PM
-- Design Name: 
-- Module Name: Physical_Game_Test - Behavioral
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

entity Physical_Game_Test is
    Port (clk : in STD_LOGIC;
          reset : in STD_LOGIC;
          user_input : in STD_LOGIC_VECTOR(15 downto 0);
          pattern_adj : out STD_LOGIC_VECTOR(15 downto 0);
          sseg_an : out STD_LOGIC_VECTOR(3 downto 0);
          sseg_cat : out STD_LOGIC_VECTOR(7 downto 0));
end Physical_Game_Test;

architecture Behavioral of Physical_Game_Test is

component Game_Module is
    Port (clk : in STD_LOGIC;
          reset : in STD_LOGIC;
          bitmask : in STD_LOGIC_VECTOR(15 downto 0);
          user_input : in STD_LOGIC_VECTOR(15 downto 0);
          timer_out_0 : out STD_LOGIC_VECTOR(5 downto 0);
          timer_out_1 : out STD_LOGIC_VECTOR(5 downto 0);
          timer_out_2 : out STD_LOGIC_VECTOR(5 downto 0);
          timer_out_3 : out STD_LOGIC_VECTOR(5 downto 0);
          win : out STD_LOGIC;
          lose : out STD_LOGIC;
          pattern_adj : out STD_LOGIC_VECTOR(15 downto 0));
end component;

component Display_Key is
  Port (   clk : in STD_LOGIC;
           cen : in STD_LOGIC;
           bin_in1 : in STD_LOGIC_VECTOR(5 downto 0);
           bin_in2 : in STD_LOGIC_VECTOR(5 downto 0);
           bin_in3 : in STD_LOGIC_VECTOR(5 downto 0);
           bin_in4 : in STD_LOGIC_VECTOR(5 downto 0); 
           sseg_an : out STD_LOGIC_VECTOR(3 downto 0);
           sseg_cat : out STD_LOGIC_VECTOR(7 downto 0));
end component;

component Button is
    Port (raw_input : in STD_LOGIC;
          clk : in STD_LOGIC;
          debounced_output : out STD_LOGIC);
end component;

signal timer_out_0, timer_out_1, timer_out_2, timer_out_3 : STD_LOGIC_VECTOR(5 downto 0);
signal debounced_reset : STD_LOGIC;

begin
    Game : Game_Module port map (clk => clk,
                                 reset => debounced_reset,
                                 bitmask => x"00FF",
                                 user_input => user_input,
                                 timer_out_0 => timer_out_0,
                                 timer_out_1 => timer_out_1,
                                 timer_out_2 => timer_out_2,
                                 timer_out_3 => timer_out_3,
                                 pattern_adj => pattern_adj);
     Display : Display_Key port map (clk => clk,
                                     cen => '1',
                                     bin_in1 => timer_out_0,
                                     bin_in2 => timer_out_1,
                                     bin_in3 => timer_out_2,
                                     bin_in4 => timer_out_3,
                                     sseg_an => sseg_an,
                                     sseg_cat => sseg_cat);
    Btn : Button port map (raw_input => reset,
                           clk => clk,
                           debounced_output => debounced_reset);
                                 
                                 

end Behavioral;
