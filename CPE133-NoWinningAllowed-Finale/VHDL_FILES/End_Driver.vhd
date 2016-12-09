library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity End_Driver is
  Port ( clk : in STD_LOGIC;
         win : in STD_LOGIC;
         lose : in STD_LOGIC;
         state : in STD_LOGIC_VECTOR(3 downto 0); 
         sseg_out0 : out STD_LOGIC_VECTOR(5 downto 0);
         sseg_out1 : out STD_LOGIC_VECTOR(5 downto 0);
         sseg_out2 : out STD_LOGIC_VECTOR(5 downto 0);
         sseg_out3 : out STD_LOGIC_VECTOR(5 downto 0));
end End_Driver;

architecture Behavioral of End_Driver is     

-- Default word select to "loser"
signal end_word_select : STD_LOGIC_VECTOR(2 downto 0) := "110";

component Display_Word is
  Port ( clk : in STD_LOGIC;
         bin_in : in STD_LOGIC_VECTOR(2 downto 0); 
         sseg_out0 : out STD_LOGIC_VECTOR(5 downto 0);
         sseg_out1 : out STD_LOGIC_VECTOR(5 downto 0);
         sseg_out2 : out STD_LOGIC_VECTOR(5 downto 0);
         sseg_out3 : out STD_LOGIC_VECTOR(5 downto 0));
end component;

begin

    GenExpression : Display_Word port map (clk => clk,
                                           bin_in => end_word_select,
                                           sseg_out0 => sseg_out0,
                                           sseg_out1 => sseg_out1,
                                           sseg_out2 => sseg_out2,
                                           sseg_out3 => sseg_out3); 

    GenWinLoss : process (win, lose) 
    begin
        if (win = '1') then
            end_word_select <= "101";
        elsif (lose = '1') then
            end_word_select <= "110";
        end if;
    end process;
    


end Behavioral;
