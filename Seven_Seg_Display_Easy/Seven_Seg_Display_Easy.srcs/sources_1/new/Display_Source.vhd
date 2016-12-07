


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity Display_Source is
  Port ( clk : in STD_LOGIC;
         cen : in STD_LOGIC;
         bin_in : in STD_LOGIC_VECTOR(2 downto 0); 
         sseg_an : out STD_LOGIC_VECTOR(3 downto 0);
         sseg_cat : out STD_LOGIC_VECTOR(7 downto 0));
end Display_Source;

architecture Behavioral of Display_Source is
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
    component Display_Key
          Port (    
               clk : in STD_LOGIC;
               cen : in STD_LOGIC;
               bin_in1 : in STD_LOGIC_VECTOR(5 downto 0);
               bin_in2 : in STD_LOGIC_VECTOR(5 downto 0);
               bin_in3 : in STD_LOGIC_VECTOR(5 downto 0);
               bin_in4 : in STD_LOGIC_VECTOR(5 downto 0); 
               sseg_an : out STD_LOGIC_VECTOR(3 downto 0);
               sseg_cat : out STD_LOGIC_VECTOR(7 downto 0));
        end component;      

signal letter1,letter2,letter3,letter4,letter5,letter6,letter7,letter8: STD_LOGIC_VECTOR(5 downto 0);
signal to_display1, to_display2, to_display3, to_display4: STD_LOGIC_VECTOR(5 downto 0);
--signal scroll_point : STD_LOGIC_VECTOR(2 downto 0);

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
    Seven_Seg_Driver : Display_Key port map(clk => clk,
                                            cen => '1',
                                            bin_in1 => to_display1,
                                            bin_in2 => to_display2,
                                            bin_in3 => to_display3,
                                            bin_in4 => to_display4,
                                            sseg_an => sseg_an,
                                            sseg_cat => sseg_cat);                                         
    
    SSEG_SCROLL_METHOD : Process(clk)
        --possible error here double check if problem occurs-----------------------------------------------------
        variable clock_divider: integer range 0 to 100000000 := 0;
        variable scroll_point: integer range 0 to 7 := 7;
        --variable prev_bin_in : STD_LOGIC_VECTOR(2 downto 0);
    begin
        if rising_edge(clk) then
            if(clock_divider = 50000000) then       
                if(scroll_point = 0) then
                    to_display1 <=letter1;
                    to_display2 <=letter2;
                    to_display3 <=letter3;
                    to_display4 <=letter4;
                    scroll_point := 7;
                elsif(scroll_point = 1) then  
                    to_display1 <=letter2;
                    to_display2 <=letter3;
                    to_display3 <=letter4;
                    to_display4 <=letter5; 
                    scroll_point := 0;    
                elsif(scroll_point = 2) then
                    to_display1 <=letter3;
                    to_display2 <=letter4;
                    to_display3 <=letter5;
                    to_display4 <=letter6;
                    scroll_point := 1;
                elsif(scroll_point = 3) then  
                    to_display1 <=letter4;
                    to_display2 <=letter5;
                    to_display3 <=letter6;
                    to_display4 <=letter7;
                    scroll_point := 2; 
                elsif(scroll_point = 4) then 
                    to_display1 <=letter5;
                    to_display2 <=letter6;
                    to_display3 <=letter7;
                    to_display4 <=letter8;
                    scroll_point := 3;
                elsif(scroll_point = 5) then  
                    to_display1 <=letter6;
                    to_display2 <=letter7;
                    to_display3 <=letter8;
                    to_display4 <=letter1;
                    scroll_point := 4;     
                elsif(scroll_point = 6) then
                    to_display1 <=letter7;
                    to_display2 <=letter8;
                    to_display3 <=letter1;
                    to_display4 <=letter2;
                    scroll_point := 5;
                elsif(scroll_point = 7) then  
                    to_display1 <=letter8;
                    to_display2 <=letter1;
                    to_display3 <=letter2;
                    to_display4 <=letter3;
                    scroll_point := 6;
                else
                    scroll_point := 0;
                end if;
                clock_divider := 0;
            else
                clock_divider := clock_divider +1;
            end if;
           -- prev_bin_in := bin_in;       
        end if;                  
    end process SSEG_SCROLL_METHOD;
    


end Behavioral;
