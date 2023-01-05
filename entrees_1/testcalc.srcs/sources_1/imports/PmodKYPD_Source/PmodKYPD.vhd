----------------------------------------------------------------------------------
-- Company: Digilent Inc 2011
-- Engineer: Michelle Yu  
-- Create Date:    17:05:39 08/23/2011 
--
-- Module Name:    PmodKYPD - Behavioral 
-- Project Name:  PmodKYPD
-- Target Devices: Nexys3
-- Tool versions: Xilinx ISE 13.2 
-- Description: 
--	This file defines a project that outputs the key pressed on the PmodKYPD to the seven segment display
--
-- Revision: 
-- Revision 0.01 - File Created
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PmodKYPD is
    Port ( 
			  clk : in  STD_LOGIC;
			  JB : inout  STD_LOGIC_VECTOR (7 downto 0); 
           an : out  STD_LOGIC_VECTOR (3 downto 0);   -- Controls which position of the seven segment display to display
           seg : out  STD_LOGIC_VECTOR (6 downto 0)); -- digit to display on the seven segment display 
end PmodKYPD;

architecture Behavioral of PmodKYPD is

component Codeur is
	Port (
			 clk : in  STD_LOGIC;
          Row : in  STD_LOGIC_VECTOR (3 downto 0);
			 Col : out  STD_LOGIC_VECTOR (3 downto 0);
          chiffre : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;

component Decodeur is
	Port (
			  DispVal : in  STD_LOGIC_VECTOR (3 downto 0);
           anode: out std_logic_vector(3 downto 0);
           segOut : out  STD_LOGIC_VECTOR (6 downto 0));
	end component;

signal Decode: STD_LOGIC_VECTOR (3 downto 0);
begin

	
	C0: Codeur port map (clk=>clk, Row =>JB(7 downto 4), Col=>JB(3 downto 0), chiffre=> Decode);
	C1: Decodeur port map (DispVal=>Decode, anode=>an, segOut=>seg );


end Behavioral;

