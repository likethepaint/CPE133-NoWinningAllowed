----------------------------------------------
-- Project : CPE 133 Final Project

-- Module Name : Init_Driver 
-- Authors : Collin Kenner, Brett Glidden

-- Description : drives the intial "Hello" state
----------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity Init_Driver is
  Port ( clk : in STD_LOGIC;
         sseg_out0 : out STD_LOGIC_VECTOR(5 downto 0);
         sseg_out1 : out STD_LOGIC_VECTOR(5 downto 0);
         sseg_out2 : out STD_LOGIC_VECTOR(5 downto 0);
         sseg_out3 : out STD_LOGIC_VECTOR(5 downto 0));
end Init_Driver;

architecture arch_Init_Driver of Init_Driver is     

component Display_Word is
  Port ( clk : in STD_LOGIC;
         bin_in : in STD_LOGIC_VECTOR(2 downto 0); 
         sseg_out0 : out STD_LOGIC_VECTOR(5 downto 0);
         sseg_out1 : out STD_LOGIC_VECTOR(5 downto 0);
         sseg_out2 : out STD_LOGIC_VECTOR(5 downto 0);
         sseg_out3 : out STD_LOGIC_VECTOR(5 downto 0));
end component;

signal init_word_select : STD_LOGIC_VECTOR(2 downto 0) := "000";

begin

    GenExpression : Display_Word port map (clk => clk,
                                           bin_in => init_word_select,
                                           sseg_out0 => sseg_out0,
                                           sseg_out1 => sseg_out1,
                                           sseg_out2 => sseg_out2,
                                           sseg_out3 => sseg_out3); 
        

end arch_Init_Driver;
