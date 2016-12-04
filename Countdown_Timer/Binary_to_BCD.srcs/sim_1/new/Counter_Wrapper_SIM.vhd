----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/21/2016 11:15:51 AM
-- Design Name: 
-- Module Name: Counter_Wrapper_SIM - Behavioral
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

entity Counter_Wrapper_SIM is
--  Port ( );
end Counter_Wrapper_SIM;

architecture Behavioral of Counter_Wrapper_SIM is

component Counter_Wrapper is
    Port ( clk : in STD_LOGIC;
           binary_in : in STD_LOGIC_VECTOR(11 downto 0);
           SSEG_AN : out STD_LOGIC_VECTOR(3 downto 0);
           hex_out : out STD_LOGIC_VECTOR(7 downto 0));
end component;

signal clk : STD_LOGIC := '0';
signal binary_in : STD_LOGIC_VECTOR(11 downto 0) := "100101100000";
signal SSEG_AN : STD_LOGIC_VECTOR(3 downto 0);
signal hex_out : STD_LOGIC_VECTOR(7 downto 0);

begin

    clk <= not clk after 5 ns;
    
    UUT: Counter_Wrapper port map(clk => clk,
                                  binary_in => binary_in,
                                  SSEG_AN => SSEG_AN,
                                  hex_out => hex_out);
                                  
end Behavioral;
