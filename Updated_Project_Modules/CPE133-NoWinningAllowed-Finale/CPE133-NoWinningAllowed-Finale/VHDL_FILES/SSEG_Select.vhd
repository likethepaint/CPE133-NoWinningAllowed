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
    Port (current_state : in STD_LOGIC_VECTOR(3 downto 0);
          clk : in STD_LOGIC;
          init_word0 : in STD_LOGIC_VECTOR(5 downto 0);
          init_word1 : in STD_LOGIC_VECTOR(5 downto 0);
          init_word2 : in STD_LOGIC_VECTOR(5 downto 0);
          init_word3 : in STD_LOGIC_VECTOR(5 downto 0);
          dif_word0 : in STD_LOGIC_VECTOR(5 downto 0);
          dif_word1 : in STD_LOGIC_VECTOR(5 downto 0);
          dif_word2 : in STD_LOGIC_VECTOR(5 downto 0);
          dif_word3 : in STD_LOGIC_VECTOR(5 downto 0);
          game_word0 : in STD_LOGIC_VECTOR(5 downto 0);
          game_word1 : in STD_LOGIC_VECTOR(5 downto 0);
          game_word2 : in STD_LOGIC_VECTOR(5 downto 0);
          game_word3 : in STD_LOGIC_VECTOR(5 downto 0);
          end_word0 : in STD_LOGIC_VECTOR(5 downto 0);
          end_word1 : in STD_LOGIC_VECTOR(5 downto 0);
          end_word2 : in STD_LOGIC_VECTOR(5 downto 0);
          end_word3 : in STD_LOGIC_VECTOR(5 downto 0);
          to_display0 : out STD_LOGIC_VECTOR(5 downto 0);
          to_display1 : out STD_LOGIC_VECTOR(5 downto 0);
          to_display2 : out STD_LOGIC_VECTOR(5 downto 0);
          to_display3 : out STD_LOGIC_VECTOR(5 downto 0));
end SSEG_Select;

architecture arch_SSEG_Select of SSEG_Select is
    
begin
    ToDisplay : process (clk)
    begin
        if rising_edge(clk) then
        if (current_state = "0001") then
            to_display0 <= init_word0;
            to_display1 <= init_word1;
            to_display2 <= init_word2;
            to_display3 <= init_word3;
        elsif (current_state = "0010") then
            to_display0 <= dif_word0;
            to_display1 <= dif_word1;
            to_display2 <= dif_word2;
            to_display3 <= dif_word3;
        elsif (current_state = "0100") then
            to_display0 <= game_word0;
            to_display1 <= game_word1;
            to_display2 <= game_word2;
            to_display3 <= game_word3;
        elsif (current_state = "1000") then
            to_display0 <= end_word0;
            to_display1 <= end_word1;
            to_display2 <= end_word2;
            to_display3 <= end_word3;
        else 
            -- display ERR
            if ((current_state AND "0001") = "0001") then
                to_display0 <= "000001";
            else 
                to_display0 <= "000000";
            end if;
            if ((current_state AND "0010") = "0001") then
                to_display1 <= "000001";
            else 
                to_display1 <= "000000";
            end if;
            if ((current_state AND "0100") = "0001") then
                to_display2 <= "000001";
            else 
                to_display2 <= "000000";
            end if;
            if ((current_state AND "1000") = "0001") then
                to_display3 <= "000001";
            else 
                to_display3 <= "000000";
            end if;
            --to_display1 <= "011100"; -- R
            --to_display2 <= "001110"; -- E
            --to_display3 <= "111111"; -- nothing
        end if;
        end if;
    end process;    
end arch_SSEG_Select;