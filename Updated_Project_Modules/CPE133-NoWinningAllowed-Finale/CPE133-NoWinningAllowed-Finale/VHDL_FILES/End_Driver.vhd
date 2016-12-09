library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity End_Driver is
  Port ( win : in STD_LOGIC;
         lose : in STD_LOGIC;
         current_state : in STD_LOGIC_VECTOR(3 downto 0); 
         end_word_select : out STD_LOGIC_VECTOR(2 downto 0));
end End_Driver;

architecture Behavioral of End_Driver is     

begin

    GenWinLoss : process (current_state) 
    begin
        if (current_state = "1000") then
            if (win = '1') then
                end_word_select <= "101";
            elsif (lose = '0') then
                end_word_select <= "110";
            end if;
        end if;
    end process;


end Behavioral;
