----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/06/2016 10:30:46 AM
-- Design Name: 
-- Module Name: Test_Bench_DS - Behavioral
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

entity Test_Bench_DS is
--  Port ( );
end Test_Bench_DS;

architecture Behavioral of Test_Bench_DS is

component Display_Source is
  Port (clk : in STD_LOGIC;
        cen : in STD_LOGIC;
        bin_in : in STD_LOGIC_VECTOR(2 downto 0); 
        sseg_an : out STD_LOGIC_VECTOR(3 downto 0);
        sseg_cat : out STD_LOGIC_VECTOR(7 downto 0));
end component;

signal clk : STD_LOGIC := '0';
signal cen : STD_LOGIC := '0';
signal bin_in : STD_LOGIC_VECTOR(2 downto 0);
signal sseg_an : STD_LOGIC_VECTOR(3 downto 0);
signal sseg_cat : STD_LoGIC_VECTOR(7 downto 0);

begin

clk <= not clk after 5 ns;

UUT : Display_Source port map (clk => clk, cen => cen, bin_in => bin_in, sseg_an => sseg_an, sseg_cat => sseg_cat);

process begin
    
    bin_in <= "000";
    
    wait for 10 ns;
    cen <= '1';
    
    wait;
    
end process;

end Behavioral;
