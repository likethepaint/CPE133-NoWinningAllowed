library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity Buzzer is
    Port (clk: in STD_LOGIC;
          countdown : in STD_LOGIC;
          reset: in STD_LOGIC;
          buzz: out STD_LOGIC);
end Buzzer;

architecture arch_Buzzer of Buzzer is

signal count : STD_LOGIC_VECTOR(23 downto 0) := x"000000";
signal buzz_out : STD_LOGIC := '0';
signal buzz_flag : STD_LOGIC := '0';

begin

    GenBuzz : process (clk) 
    begin
        if (reset = '1') then
            buzz_out <= '0';
            count <= x"000000";
            --buzz_flag <= '0';
        elsif (rising_edge(clk)) then
            if (countdown = '1') then
                if (count = x"0101A8") then
                    count <= x"000000";
                    buzz_out <= not buzz_out;
                    --buzz_flag <= '1';
                else
                    count <= STD_LOGIC_VECTOR(unsigned(count) + 1);
                end if;
            else
                count <= x"000000";
                --buzz_flag <= '0';
                buzz_out <= '0';
            end if;
        end if;
    end process;
    
    buzz <= buzz_out;
    
    
end arch_Buzzer;