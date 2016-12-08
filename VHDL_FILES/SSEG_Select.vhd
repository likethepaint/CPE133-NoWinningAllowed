library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

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
            --if ((state AND "0001") = "0001") then
                --to_display0 <= "000001";
            --else
                --to_display0 <= "000000";
            --end if;
            --if ((state AND "0010") = "0010") then
                --to_display1 <= "000001";
            --else
                --to_display1 <= "000000";
            --end if;
            --if ((state AND "0100") = "0100") then
                --to_display2 <= "000001";
            --else
                --to_display2 <= "000000";
            --end if;
            --if ((state AND "1000") = "1000") then
                --to_display3 <= "000001";
            --else
                --to_display3 <= "000000";
            --end if;
        
    end process;    
end arch_SSEG_Select;