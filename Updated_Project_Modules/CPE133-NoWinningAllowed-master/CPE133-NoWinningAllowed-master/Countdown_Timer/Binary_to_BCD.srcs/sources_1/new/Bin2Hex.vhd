----------------------------------------------------------------------------------
-- CPE 133 Final Project
-- Collin Kenner, Brett Glidden

-- Binary to Hex Encoder with 7-Seg display
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity which converts binary to hex for display on 7 segment
-- clk : clock input, 10 MHz from Basys-3 Board
-- cen : chip enable
-- bin_in_* : binary inputs from BCD_Converter
-- SSEG_AN : 7 Segment anodes
-- SSEG_CAT : 7 Segment cathodes
entity Bin2Hex is
    Port ( clk : in STD_LOGIC;
           cen : in STD_LOGIC;
           bin_in_1 : in STD_LOGIC_VECTOR(3 downto 0);
           bin_in_2 : in STD_LOGIC_VECTOR(3 downto 0);
           bin_in_3 : in STD_LOGIC_VECTOR(3 downto 0);
           bin_in_4 : in STD_LOGIC_VECTOR(3 downto 0); 
           sseg_an : out STD_LOGIC_VECTOR(3 downto 0);
           sseg_cat : out STD_LOGIC_VECTOR(7 downto 0));	
end Bin2Hex;

architecture arch_Bin2Hex of Bin2Hex is

-- The current bin_in_* being sampled
signal current_input : STD_LOGIC_VECTOR(3 downto 0);

-- Signal to allow for SSEG_AN to be sampled
signal sseg_an_wire : STD_LOGIC_VECTOR(3 downto 0) := "1111";

begin
    
    -- Process for counter clock divide to 200 Hz 250000
    SSEG_80Hz_Refresh: process (clk)
        variable count : integer range 0 to 250000 := 0; 
    begin
        if rising_edge(clk) then
            if (cen = '1') then
                -- Change the input to sample @ 200Hz
                if (count = 250000) then
                    if ((sseg_an_wire) = "0111" OR (sseg_an_wire = "1111")) then
                        sseg_an_wire <= "1110";
                        current_input <= bin_in_1;
                    elsif (sseg_an_wire = "1110") then
                        sseg_an_wire <= "1101";
                        current_input <= bin_in_2;
                    elsif (sseg_an_wire = "1101") then
                        sseg_an_wire <= "1011";
                        current_input <= bin_in_3;
                    elsif (sseg_an_wire = "1011") then
                        sseg_an_wire <= "0111";
                        current_input <= bin_in_4;
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
                when "0000" => sseg_cat <= "00000011";
                when "0001" => sseg_cat <= "10011111";
                when "0010" => sseg_cat <= "00100101";
                when "0011" => sseg_cat <= "00001101";
                when "0100" => sseg_cat <= "10011001";
                when "0101" => sseg_cat <= "01001001";
                when "0110" => sseg_cat <= "01000001";
                when "0111" => sseg_cat <= "00011111";
                when "1000" => sseg_cat <= "00000001";
                when "1001" => sseg_cat <= "00011001";
                when "1010" => sseg_cat <= "00010001";
                when "1011" => sseg_cat <= "11000001";
                when "1100" => sseg_cat <= "01100011";
                when "1101" => sseg_cat <= "10000101";
                when "1110" => sseg_cat <= "01100001";
                when "1111" => sseg_cat <= "01110001";
                when others => sseg_cat <= "11111111";
            end case;
        else
            -- Turn off all cathodes
            sseg_cat <= "11111111";
        end if;
    end process SSEGDisplayDriver;

end arch_Bin2Hex;
