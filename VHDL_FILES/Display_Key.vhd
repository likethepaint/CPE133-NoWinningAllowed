----------------------------------------------------------------------------------
--Seven Seg Display output key
-- by Collin kenner and Brett Glidden
--This device takes in binary inputs from several different modules in the device
--depending on the input value the seven seg then displays a word
--rather than actually send over the 48 bit word bus we opted to just have the key values map to 
--the desired output words.
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity SSEG_Driver is
  Port (   clk : in STD_LOGIC;
           sseg_in0 : in STD_LOGIC_VECTOR(5 downto 0);
           sseg_in1 : in STD_LOGIC_VECTOR(5 downto 0);
           sseg_in2 : in STD_LOGIC_VECTOR(5 downto 0);
           sseg_in3 : in STD_LOGIC_VECTOR(5 downto 0); 
           sseg_an : out STD_LOGIC_VECTOR(3 downto 0);
           sseg_cat : out STD_LOGIC_VECTOR(7 downto 0));
end SSEG_Driver;

architecture arch_SSEG_Driver of SSEG_Driver is

-- The current bin_in_* being sampled
signal current_input : STD_LOGIC_VECTOR(5 downto 0);

-- Signal to allow for SSEG_AN to be sampled
signal sseg_an_wire : STD_LOGIC_VECTOR(3 downto 0) := "1111";
begin      
    
    SSEG_80Hz_Refresh: Process(clk)
        variable count: integer range 0 to 250000 := 0;
    begin
       if rising_edge(clk) then
                -- Change the input to sample @ 200Hz
                if (count = 250000) then
                    if ((sseg_an_wire) = "0111" OR (sseg_an_wire = "1111")) then
                        sseg_an_wire <= "1110";
                        current_input <= sseg_in0;
                    elsif (sseg_an_wire = "1110") then
                        sseg_an_wire <= "1101";
                        current_input <= sseg_in1;
                    elsif (sseg_an_wire = "1101") then
                        sseg_an_wire <= "1011";
                        current_input <= sseg_in2;  
                    elsif (sseg_an_wire = "1011") then
                        sseg_an_wire <= "0111";
                        current_input <= sseg_in3;
                    end if;
                    
                    count := 0;
                else
                    count := count + 1;
                end if;
            end if;
        end process SSEG_80Hz_Refresh;
        
        sseg_an <= sseg_an_wire;
            
            -- Handles mapping of binary values to Basys-3
            -- hex encoded values to display on the seven segment
            ssegDisplayDriver: process (sseg_an_wire) is
            begin
                case current_input is
                    when "000000" => sseg_cat <= "00000011"; --0
                    when "000001" => sseg_cat <= "10011111"; --1
                    when "000010" => sseg_cat <= "00100101"; --2
                    when "000011" => sseg_cat <= "00001101"; --3
                    when "000100" => sseg_cat <= "10011001"; --4
                    when "000101" => sseg_cat <= "01001001"; --5
                    when "000110" => sseg_cat <= "01000001"; --6
                    when "000111" => sseg_cat <= "00011111"; --7
                    when "001000" => sseg_cat <= "00000001"; --8
                    when "001001" => sseg_cat <= "00011001"; --9
                    when "001010" => sseg_cat <= "00010011"; --A
                    when "001011" => sseg_cat <= "11000001"; --B
                    when "001100" => sseg_cat <= "01100011"; --C
                    when "001101" => sseg_cat <= "10000101"; --D
                    when "001110" => sseg_cat <= "01100001"; --E
                    when "001111" => sseg_cat <= "01110001"; --F
                    when "010000" => sseg_cat <= "01000011"; --G
                    when "010001" => sseg_cat <= "11010001"; --H
                    when "010010" => sseg_cat <= "11110011"; --I
                    when "010011" => sseg_cat <= "10000111"; --J
                    when "010100" => sseg_cat <= "01010001"; --K
                    when "010101" => sseg_cat <= "11100011"; --L
                    when "010111" => sseg_cat <= "01010111"; --M
                    when "011000" => sseg_cat <= "11010101"; --N
                    when "011001" => sseg_cat <= "11000101"; --O
                    when "011010" => sseg_cat <= "00110001"; --P
                    when "011011" => sseg_cat <= "00011001"; --Q
                    when "011100" => sseg_cat <= "00110011"; --R
                    when "011101" => sseg_cat <= "01001001"; --S
                    when "011110" => sseg_cat <= "11100001"; --T
                    when "011111" => sseg_cat <= "10000011"; --U
                    when "100000" => sseg_cat <= "10001011"; --V
                    when "100001" => sseg_cat <= "10101011"; --W
                    when "100010" => sseg_cat <= "10010001"; --X
                    when "100011" => sseg_cat <= "10001001"; --Y
                    when "100100" => sseg_cat <= "00101101"; --Z
                    when others => sseg_cat <= "11111111";
                end case;
            end process ssegDisplayDriver;

end arch_SSEG_Driver;
