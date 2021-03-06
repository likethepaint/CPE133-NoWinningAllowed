----------------------------------------------
-- Project : CPE 133 Final Project

-- Module Name : Word_Key
-- Authors : Collin Kenner, Brett Glidden

-- Description : converts word selects into words
--      that can be driven by the seven segment
----------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Define Word_Key entity
-- Inputs
--      bin_in : the word select signal
-- Outputs
--      Letter_Out* : the binary representation of the desired character
entity Word_Key is
  Port ( 
        bin_in : in STD_LOGIC_VECTOR(2 downto 0);
        Letter_Out1 : out STD_LOGIC_VECTOR(5 downto 0);
        Letter_Out2 : out STD_LOGIC_VECTOR(5 downto 0);
        Letter_Out3 : out STD_LOGIC_VECTOR(5 downto 0);
        Letter_Out4 : out STD_LOGIC_VECTOR(5 downto 0);
        Letter_Out5 : out STD_LOGIC_VECTOR(5 downto 0);
        Letter_Out6 : out STD_LOGIC_VECTOR(5 downto 0);
        Letter_Out7 : out STD_LOGIC_VECTOR(5 downto 0);
        Letter_Out8 : out STD_LOGIC_VECTOR(5 downto 0));
end Word_Key;

architecture Behavioral of Word_Key is

begin
    process(bin_in)
    begin
        if(bin_in = "000") then--HELLO
           Letter_Out8 <= "010001";
           Letter_Out7 <= "001110";
           Letter_Out6 <= "010101";
           Letter_Out5 <= "010101";
           Letter_Out4 <= "011001";
           Letter_Out3 <= "111111";
           Letter_Out2 <= "111111";
           Letter_Out1 <= "111111";
        elsif(bin_in = "001") then--begin
           Letter_Out8 <= "001011";
           Letter_Out7 <= "001110";
           Letter_Out6 <= "010010";
           Letter_Out5 <= "001100";
           Letter_Out4 <= "011000";
           Letter_Out3 <= "111111";
           Letter_Out2 <= "111111";
           Letter_Out1 <= "111111";
        elsif(bin_in = "010") then--easy
           Letter_Out8 <= "001110";
           Letter_Out7 <= "001010";
           Letter_Out6 <= "011101";
           Letter_Out5 <= "100011";
           Letter_Out4 <= "111111";
           Letter_Out3 <= "111111";
           Letter_Out2 <= "111111";
           Letter_Out1 <= "111111";
        elsif(bin_in = "011") then--fair
           Letter_Out8 <= "001111";
           Letter_Out7 <= "001010";
           Letter_Out6 <= "010010";
           Letter_Out5 <= "011100";
           Letter_Out4 <= "111111";
           Letter_Out3 <= "111111";
           Letter_Out2 <= "111111";
           Letter_Out1 <= "111111";
        elsif(bin_in = "100") then--hard
           Letter_Out8 <= "010001";
           Letter_Out7 <= "001010";
           Letter_Out6 <= "011100";
           Letter_Out5 <= "001101";
           Letter_Out4 <= "111111";
           Letter_Out3 <= "111111";
           Letter_Out2 <= "111111";
           Letter_Out1 <= "111111";
        elsif(bin_in = "101") then -- SUCCESS
           Letter_Out8 <= "011101";
           Letter_Out7 <= "011111";
           Letter_Out6 <= "001100";
           Letter_Out5 <= "001100";
           Letter_Out4 <= "001110";
           Letter_Out3 <= "011101";
           Letter_Out2 <= "011101";
           Letter_Out1 <= "111111";
        elsif(bin_in = "110") then --FAILURE
           Letter_Out8 <= "001111";
           Letter_Out7 <= "001010";
           Letter_Out6 <= "010010";
           Letter_Out5 <= "010101";
           Letter_Out4 <= "011111";
           Letter_Out3 <= "011100";
           Letter_Out2 <= "001110";
           Letter_Out1 <= "111111";
        elsif(bin_in = "111") then--restart
           Letter_Out8 <= "011100";
           Letter_Out7 <= "001110";
           Letter_Out6 <= "011101";
           Letter_Out5 <= "011110";
           Letter_Out4 <= "001010";
           Letter_Out3 <= "011100";
           Letter_Out2 <= "011110";
           Letter_Out1 <= "111111";
        else                            --null value
           Letter_Out8 <= "111111";
           Letter_Out7 <= "111111";
           Letter_Out6 <= "111111";
           Letter_Out5 <= "111111";
           Letter_Out4 <= "111111";
           Letter_Out3 <= "111111";
           Letter_Out2 <= "111111";
           Letter_Out1 <= "111111";
        end if;
   end process;


end Behavioral;
