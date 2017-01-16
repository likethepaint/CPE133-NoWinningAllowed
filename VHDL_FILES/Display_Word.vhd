----------------------------------------------
-- Project : CPE 133 Final Project

-- Module Name : Display_Word 
-- Authors : Collin Kenner, Brett Glidden

-- Description : converts the incoming word select
--      pattern into a word to be displayed on the
--      seven segment. Facilitates scrolling on words
--      larger than four characters
----------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Define Display Word entity
-- Inputs
--      clk : 100 MHz Basys-3 system clock
--      bin_in : the word select pattern
-- Outputs
--      sseg_out* : the sseg representation of the characters
entity Display_Word is
  Port ( clk : in STD_LOGIC;
         bin_in : in STD_LOGIC_VECTOR(2 downto 0); 
         sseg_out0 : out STD_LOGIC_VECTOR(5 downto 0);
         sseg_out1 : out STD_LOGIC_VECTOR(5 downto 0);
         sseg_out2 : out STD_LOGIC_VECTOR(5 downto 0);
         sseg_out3 : out STD_LOGIC_VECTOR(5 downto 0));
end Display_Word;

architecture arch_Display_Word of Display_Word is

    -- Bring in word dicitionary
    component Word_Key
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
    end component;  


-- The 8 characters required from the word dictionary
signal letter1,letter2,letter3,letter4,letter5,letter6,letter7,letter8: STD_LOGIC_VECTOR(5 downto 0);

begin
    Key_Map : Word_Key port map(bin_in => bin_in,
                                Letter_Out1=>letter1,
                                Letter_Out2=>Letter2,
                                Letter_Out3=>letter3,
                                Letter_Out4=>Letter4,
                                Letter_Out5=>letter5,
                                Letter_Out6=>Letter6,
                                Letter_Out7=>letter7,
                                Letter_Out8=>Letter8);                                        

    -- Displays word based on 8 characters and a scroll pattern
    SSEG_SCROLL_METHOD : Process(clk)
        variable clock_divider: integer range 0 to 100000000 := 0;

        -- The current combination of letter to display
        variable scroll_point: integer range 0 to 7 := 7;
    begin
        if rising_edge(clk) then
            -- Scroll every 500 ms
            if(clock_divider = 50000000) then
                if(scroll_point = 0) then
                    sseg_out0 <=letter1;
                    sseg_out1 <=letter2;
                    sseg_out2 <=letter3;
                    sseg_out3 <=letter4;
                    scroll_point := 7;
                elsif(scroll_point = 1) then  
                    sseg_out0 <=letter2;
                    sseg_out1 <=letter3;
                    sseg_out2 <=letter4;
                    sseg_out3 <=letter5; 
                    scroll_point := 0;    
                elsif(scroll_point = 2) then
                    sseg_out0 <=letter3;
                    sseg_out1 <=letter4;
                    sseg_out2 <=letter5;
                    sseg_out3 <=letter6;
                    scroll_point := 1;
                elsif(scroll_point = 3) then  
                    sseg_out0 <=letter4;
                    sseg_out1 <=letter5;
                    sseg_out2 <=letter6;
                    sseg_out3 <=letter7;
                    scroll_point := 2; 
                elsif(scroll_point = 4) then 
                    sseg_out0 <=letter5;
                    sseg_out1 <=letter6;
                    sseg_out2 <=letter7;
                    sseg_out3 <=letter8;
                    scroll_point := 3;
                elsif(scroll_point = 5) then  
                    sseg_out0 <=letter6;
                    sseg_out1 <=letter7;
                    sseg_out2 <=letter8;
                    sseg_out3 <=letter1;
                    scroll_point := 4;     
                elsif(scroll_point = 6) then
                    sseg_out0 <=letter7;
                    sseg_out1 <=letter8;
                    sseg_out2 <=letter1;
                    sseg_out3 <=letter2;
                    scroll_point := 5;
                elsif(scroll_point = 7) then  
                    sseg_out0 <=letter8;
                    sseg_out1 <=letter1;
                    sseg_out2 <=letter2;
                    sseg_out3 <=letter3;
                    scroll_point := 6;
                else
                    scroll_point := 0;
                end if;
                clock_divider := 0;
            else
                clock_divider := clock_divider +1;
            end if;
        end if;                  
    end process SSEG_SCROLL_METHOD;
    


end arch_Display_Word;
