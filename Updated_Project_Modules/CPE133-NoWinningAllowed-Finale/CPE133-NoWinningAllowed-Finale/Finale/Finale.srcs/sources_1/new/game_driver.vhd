----------------------------------------------------------------------------------
--Collin Kenner, Brett Glidden
--Game driver module ensures that the game module is only running when the state machine enters the correct state 
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

entity game_driver is
    Port ( current_state : in STD_LOGIC_VECTOR(3 downto 0);
           game_module_deactivate : out STD_LOGIC);
end game_driver;

architecture Behavioral of game_driver is

begin
    process
    begin
        if(current_state = "0100") then
            game_module_deactivate <= '0';
        else
            game_module_deactivate <= '1';
        end if;
    end process;


end Behavioral;
