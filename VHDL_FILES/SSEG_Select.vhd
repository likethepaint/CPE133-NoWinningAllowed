----------------------------------------------
-- Project : CPE 133 Final Project

-- Module Name : SSEG_Select
-- Authors : Collin Kenner, Brett Glidden

-- Description : determines which sseg_out from which
--      module to display based on the current state
----------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Define SSEG_Select entity
-- clock and state inputs
-- connects to all sseg_in* from other modules
-- outputs correct sseg_in* based on current state
entity SSEG_Select is
    Port (clk : in STD_LOGIC;
          state : in STD_LOGIC_VECTOR(3 downto 0);
          init_sseg0 : in STD_LOGIC_VECTOR(5 downto 0);
          init_sseg1 : in STD_LOGIC_VECTOR(5 downto 0);
          init_sseg2 : in STD_LOGIC_VECTOR(5 downto 0);
          init_sseg3 : in STD_LOGIC_VECTOR(5 downto 0);
          difficulty_sseg0 : in STD_LOGIC_VECTOR(5 downto 0);
          difficulty_sseg1 : in STD_LOGIC_VECTOR(5 downto 0);
          difficulty_sseg2 : in STD_LOGIC_VECTOR(5 downto 0);
          difficulty_sseg3 : in STD_LOGIC_VECTOR(5 downto 0);
          game_sseg0 : in STD_LOGIC_VECTOR(5 downto 0);
          game_sseg1 : in STD_LOGIC_VECTOR(5 downto 0);
          game_sseg2 : in STD_LOGIC_VECTOR(5 downto 0);
          game_sseg3 : in STD_LOGIC_VECTOR(5 downto 0);
          end_sseg0 : in STD_LOGIC_VECTOR(5 downto 0);
          end_sseg1 : in STD_LOGIC_VECTOR(5 downto 0);
          end_sseg2 : in STD_LOGIC_VECTOR(5 downto 0);
          end_sseg3 : in STD_LOGIC_VECTOR(5 downto 0);
          to_display0 : out STD_LOGIC_VECTOR(5 downto 0);
          to_display1 : out STD_LOGIC_VECTOR(5 downto 0);
          to_display2 : out STD_LOGIC_VECTOR(5 downto 0);
          to_display3 : out STD_LOGIC_VECTOR(5 downto 0));
end SSEG_Select;

architecture arch_SSEG_Select of SSEG_Select is
    
begin
    ToDisplay : process (state)
    begin
            if (state = "0001") then
                to_display0 <= init_sseg0;
                to_display1 <= init_sseg1;
                to_display2 <= init_sseg2;
                to_display3 <= init_sseg3;
            elsif (state = "0010") then
                to_display0 <= difficulty_sseg0;
                to_display1 <= difficulty_sseg1;
                to_display2 <= difficulty_sseg2;
                to_display3 <= difficulty_sseg3;
            elsif (state = "0100") then
                to_display0 <= game_sseg0;
                to_display1 <= game_sseg1;
                to_display2 <= game_sseg2;
                to_display3 <= game_sseg3;
            elsif (state = "1000") then
                to_display0 <= end_sseg0;
                to_display1 <= end_sseg1;
                to_display2 <= end_sseg2;
                to_display3 <= end_sseg3;
            else 
                -- display ERR
                to_display0 <= "011100"; -- R
                to_display1 <= "011100"; -- R
                to_display2 <= "001110"; -- E
                to_display3 <= "111111"; -- nothing
            end if;
    end process;    
end arch_SSEG_Select;
