----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/20/2016 08:22:11 PM
-- Design Name: 
-- Module Name: Binary_to_BCD_SIM - Behavioral
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

entity Binary_to_BCD_SIM is
--  Port ( );
end Binary_to_BCD_SIM;

architecture Behavioral of Binary_to_BCD_SIM is

component Binary_to_BCD is
    Port (clk : in STD_LOGIC;
          binary_in : in STD_LOGIC_VECTOR(11 downto 0);
          ones : out STD_LOGIC_VECTOR(3 downto 0);
          tens : out STD_LOGIC_VECTOR(3 downto 0);
          hundreds : out STD_LOGIC_VECTOR(3 downto 0);
          thousands : out STD_LOGIC_VECTOR(3 downto 0);
          sseg_enable : out STD_LOGIC);
end component;

signal binary_in : STD_LOGIC_VECTOR(11 downto 0) := "100101100000";
signal ones, tens, hundreds, thousands : STD_LOGIC_VECTOR(3 downto 0);
signal clk : STD_LOGIC := '0';
signal sseg_enable : STD_LOGIC;

begin
    clk <= not clk after 5 ns;

    UUT : Binary_to_BCD port map (binary_in => binary_in,
                                  ones => ones,
                                  tens => tens,
                                  hundreds => hundreds,
                                  thousands => thousands,
                                  clk => clk,
                                  sseg_enable => sseg_enable);
    process begin
        wait;
    end process;
end Behavioral;
