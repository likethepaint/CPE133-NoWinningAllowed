----------------------------------------------------------------------------------
-- CPE 133 Final Project
-- Collin Kenner, Brett Glidden

-- Module: Binary to BCD Converter
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

-- Setup 12 bit binary to BCD converter entity
entity Binary_to_BCD is
    Port (clk : in STD_LOGIC;
          binary_in : STD_LOGIC_VECTOR(11 downto 0);
          ones : out STD_LOGIC_VECTOR(5 downto 0);
          tens : out STD_LOGIC_VECTOR(5 downto 0);
          hundreds : out STD_LOGIC_VECTOR(5 downto 0);
          thousands : out STD_LOGIC_VECTOR(5 downto 0));
end Binary_to_BCD;

architecture arch_Binary_to_BCD of Binary_to_BCD is

signal binary_stored : STD_LOGIC_VECTOR(11 downto 0) := "000000000000";

begin

    convertBinary : process (clk)
        variable ones_tmp: STD_LOGIC_VECTOR(3 downto 0) := "0000";
        variable tens_tmp: STD_LOGIC_VECTOR(3 downto 0) := "0000";
        variable hundreds_tmp: STD_LOGIC_VECTOR(3 downto 0) := "0000";
        variable thousands_tmp: STD_LOGIC_VECTOR(3 downto 0) := "0000";
        variable count: integer range 15 downto 0 := 11;
    begin
        
        if rising_edge(clk) then
            -- Check that binary input hasn't changed
            -- and we havent completed the conversion
            if (binary_in = binary_stored) then
                -- Since count can underflow, must check if it is in valid bounds
                if (count <= 11 AND count >= 0) then
                    -- Begin Binary to BCD conversion algorithm
                    if (unsigned(thousands_tmp) >= 5) then
                        thousands_tmp := STD_LOGIC_VECTOR(unsigned(thousands_tmp) + 3);
                    end if;
                    if (unsigned(hundreds_tmp) >= 5) then
                        hundreds_tmp := STD_LOGIC_VECTOR(unsigned(hundreds_tmp) + 3);
                    end if;
                    if (unsigned(tens_tmp) >= 5) then
                        tens_tmp := STD_LOGIC_VECTOR(unsigned(tens_tmp) + 3);
                    end if;
                    if (unsigned(ones_tmp) >= 5) then
                        ones_tmp := STD_LOGIC_VECTOR(unsigned(ones_tmp) + 3);
                    end if;
                    
                    thousands_tmp := STD_LOGIC_VECTOR(unsigned(thousands_tmp) sll 1);
                    thousands_tmp(0) := hundreds_tmp(3);
                    hundreds_tmp := STD_LOGIC_VECTOR(unsigned(hundreds_tmp) sll 1);
                    hundreds_tmp(0) := tens_tmp(3);
                    tens_tmp := STD_LOGIC_VECTOR(unsigned(tens_tmp) sll 1);
                    tens_tmp(0) := ones_tmp(3);
                    ones_tmp := STD_LOGIC_VECTOR(unsigned(ones_tmp) sll 1);
                    ones_tmp(0) := binary_stored(count);
                    
                    count := count - 1;
                else
                    ones(3 downto 0) <= ones_tmp;
                    ones(5 downto 4) <= "00";
                            
                    tens(3 downto 0) <= tens_tmp;
                    tens(5 downto 4) <= "00";
                            
                    hundreds(3 downto 0) <= hundreds_tmp;
                    hundreds(5 downto 4) <= "00";
                            
                    thousands(3 downto 0) <= thousands_tmp;
                    thousands(5 downto 4) <= "00";
                end if;
            else
                -- Update current input and reset counter
                binary_stored <= binary_in;
                ones_tmp := "0000";
                tens_tmp := "0000";
                hundreds_tmp := "0000";
                thousands_tmp := "0000";
                count := 11;
            end if;
        end if;      
    end process;
    
    

end arch_Binary_to_BCD;
