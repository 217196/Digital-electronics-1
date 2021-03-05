----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.03.2021 22:35:44
-- Design Name: 
-- Module Name: mux_2bit_4to1 - Behavioral
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


library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration
------------------------------------------------------------------------
entity mux_2bit_4to1 is
    port(
        a_i            : in  std_logic_vector(2 - 1 downto 0);
        b_i            : in  std_logic_vector(2 - 1 downto 0);
        c_i            : in  std_logic_vector(2 - 1 downto 0);
        d_i            : in  std_logic_vector(2 - 1 downto 0);
        sel_i          : in  std_logic_vector(2 - 1 downto 0);
        f_o            : out std_logic_vector(2 - 1 downto 0)
    );
end entity mux_2bit_4to1;

------------------------------------------------------------------------
-- Architecture body
------------------------------------------------------------------------
architecture Behavioral of mux_2bit_4to1 is
begin

       f_o <= a_i when (sel_i = "00") else
              b_i when (sel_i = "01") else
              c_i when (sel_i = "10") else
              d_i;

end architecture Behavioral;