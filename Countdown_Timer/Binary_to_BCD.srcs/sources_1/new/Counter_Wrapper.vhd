----------------------------------------------------------------------------------
-- CPE 133 Final Project
-- Collin Kenner, Brett Glidden

-- Top level wrapper for binary to BCD and sseg output
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

-- clk : clk connected to trap module
-- binary_in : time value based on difficulty
entity Counter_Wrapper is
    Port ( clk : in STD_LOGIC;
           binary_in : in STD_LOGIC_VECTOR(11 downto 0);
           sseg_an : out STD_LOGIC_VECTOR(3 downto 0);
           sseg_cat : out STD_LOGIC_VECTOR(7 downto 0));
end Counter_Wrapper;

architecture arch_Counter_Wrapper of Counter_Wrapper is

component Bin2Hex is
    Port ( clk : in STD_LOGIC;
           cen : in STD_LOGIC;
           bin_in_1 : in STD_LOGIC_VECTOR(3 downto 0);
           bin_in_2 : in STD_LOGIC_VECTOR(3 downto 0);
           bin_in_3 : in STD_LOGIC_VECTOR(3 downto 0);
           bin_in_4 : in STD_LOGIC_VECTOR(3 downto 0);
           sseg_an : out STD_LOGIC_VECTOR(3 downto 0);
           sseg_cat : out STD_LOGIC_VECTOR(7 downto 0));	
end component;

component Binary_to_BCD is
    Port (clk : in STD_LOGIC;
          sseg_enable : out STD_LOGIC;
          binary_in : in STD_LOGIC_VECTOR(11 downto 0);
          ones : out STD_LOGIC_VECTOR(3 downto 0);
          tens : out STD_LOGIC_VECTOR(3 downto 0);
          hundreds : out STD_LOGIC_VECTOR(3 downto 0);
          thousands : out STD_LOGIC_VECTOR(3 downto 0));
end component;

signal ones, tens, hundreds, thousands : STD_LOGIC_VECTOR(3 downto 0);
signal sseg_enable : STD_LOGIC;
signal binary_counter : STD_LOGIC_VECTOR(11 downto 0) := "000011110000";
--signal SSEG_AN : STD_LOGIC_VECTOR(3 downto 0);
--signal hex_out : STD_LOGIC_VECTOR(7 downto 0);

begin

    BCD_Converter : Binary_to_BCD port map (clk => clk,
                                            sseg_enable => sseg_enable,
                                            binary_in => binary_counter,
                                            ones => ones,
                                            tens => tens,
                                            hundreds => hundreds,
                                            thousands => thousands);
    SSEG_Output : Bin2Hex port map (clk => clk,
                                    cen => sseg_enable,
                                    bin_in_1 => ones,
                                    bin_in_2 => tens,
                                    bin_in_3 => hundreds,
                                    bin_in_4 => thousands,
                                    sseg_an => sseg_an,
                                    sseg_cat => sseg_cat);
    
    CountdownTimer: process (clk)
        variable countdown : integer range 0 to 100000000 := 0;
        variable top_count : integer range 0 to 100000000 := 100000000;
    begin
        if rising_edge(clk) then
            if binary_counter /= "000000000000" then
                if countdown = top_count then
                    binary_counter <= STD_LOGIC_VECTOR(unsigned(binary_counter) - 1);
                    countdown := 0;
                else
                    countdown := countdown + 1;
                end if;
            end if;
        end if;
    end process;
        

end arch_Counter_Wrapper;
