----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/07/2016 04:34:30 PM
-- Design Name: 
-- Module Name: End_Driver_Sim - Behavioral
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

entity End_Driver_Sim is
--  Port ( );
end End_Driver_Sim;

architecture Behavioral of End_Driver_Sim is

component End_Driver is
  Port ( clk : in STD_LOGIC;
         win : in STD_LOGIC;
         lose : in STD_LOGIC;
         state : in STD_LOGIC_VECTOR(3 downto 0); 
         sseg_out0 : out STD_LOGIC_VECTOR(5 downto 0);
         sseg_out1 : out STD_LOGIC_VECTOR(5 downto 0);
         sseg_out2 : out STD_LOGIC_VECTOR(5 downto 0);
         sseg_out3 : out STD_LOGIC_VECTOR(5 downto 0));
end component;

signal clk : STD_LOGIC := '0';
signal win, lose : STD_LOGIC;
signal state : STD_LOGIC_VECTOR(3 downto 0);
signal sseg_out0, sseg_out1, sseg_out2, sseg_out3 : STD_LOGIC_VECTOR(5 downto 0);

begin

    clk <= not clk after 1 ns;

UUT : End_Driver port map (clk => clk,
                           win => win,
                           lose => lose,
                           state => state,
                           sseg_out0 => sseg_out0,
                           sseg_out1 => sseg_out1,
                           sseg_out2 => sseg_out2,
                           sseg_out3 => sseg_out3);

process begin
    state <= "0100";
    lose <= '0';
    win <= '0';
    wait for 10 ns;
    
    state <= "1000"; 
    wait for 10 ns;
    
    lose <= '1';
    
    wait for 10 ns;
    
    lose <= '0';
    win <= '1';
    
    wait for 10 ns;
    
    state <= "0001";
    wait;
    
    
end process;

end Behavioral;
