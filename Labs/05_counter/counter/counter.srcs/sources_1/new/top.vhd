----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.03.2021 16:14:08
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
    Port ( 
           CLK100MHZ  : in STD_LOGIC;
           BTNC       : in STD_LOGIC;
           SW         : in STD_LOGIC_VECTOR (1 downto 0);
           LED        : out STD_LOGIC_VECTOR (4 downto 0);
           CA         : out STD_LOGIC;
           CB         : out STD_LOGIC;
           CC         : out STD_LOGIC;
           CD         : out STD_LOGIC;
           CE         : out STD_LOGIC;
           CF         : out STD_LOGIC;
           CG         : out STD_LOGIC;
           AN         : out STD_LOGIC_VECTOR (8 downto 0));
end top;

architecture Behavioral of top is

begin


end Behavioral;
