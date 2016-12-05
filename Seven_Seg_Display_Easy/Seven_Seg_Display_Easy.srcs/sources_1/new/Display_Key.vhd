----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/04/2016 06:56:09 PM
-- Design Name: 
-- Module Name: Display_Key - Behavioral
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

entity Display_Key is
  Port (   clk : in STD_LOGIC;
           cen : in STD_LOGIC;
           bin_in : in STD_LOGIC_VECTOR(2 downto 0); 
           sseg_an : out STD_LOGIC_VECTOR(3 downto 0);
           sseg_cat : out STD_LOGIC_VECTOR(7 downto 0));
end Display_Key;

architecture Behavioral of Display_Key is

-- The current bin_in_* being sampled
signal key_value : STD_LOGIC_VECTOR(2 downto 0);
signal current_input : STD_LOGIC_VECTOR(47 downto 0);

-- Signal to allow for SSEG_AN to be sampled
signal sseg_an_wire : STD_LOGIC_VECTOR(3 downto 0) := "1111";
begin
    KEY_SELECT: Process(bin_in)
    begin
        if(bin_in ="000") then
            current_input <= "100001001110010101001100011001010111001110111111";--welcome
        end if;
    end process;
    
    SSEG_80Hz_Refresh: Process(clk)
        variable count: integer range 0 to 250000 := 0;
    begin
       if rising_edge(clk) then
                if (cen = '1') then
                    -- Change the input to sample @ 200Hz
                    if (count = 250000) then
                        if ((sseg_an_wire) = "0111" OR (sseg_an_wire = "1111")) then
                            sseg_an_wire <= "1110";
                           
                        elsif (sseg_an_wire = "1110") then
                            sseg_an_wire <= "1101";
                    
                        elsif (sseg_an_wire = "1101") then
                            sseg_an_wire <= "1011";
                          
                        elsif (sseg_an_wire = "1011") then
                            sseg_an_wire <= "0111";
                      
                        end if;
                        
                        count := 0;
                    else
                        count := count + 1;
                    end if;
                end if;
            end if;
        end process;
        
        sseg_an <= sseg_an_wire;
            
            -- Handles mapping of binary values to Basys-3
            -- hex encoded values to display on the seven segment
            ssegDisplayDriver: process (sseg_an_wire) is
            begin
                if (cen = '1') then
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
                else
                    -- Turn off all cathodes
                    sseg_cat <= "11111111";
                end if;
            end process SSEGDisplayDriver;

end Behavioral;
