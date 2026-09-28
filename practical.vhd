library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uPLab4 is
		port(
			PH0 : in std_logic;
			PH1 : in std_logic;
			PH7 : in std_logic;
			PH6 : in std_logic;
			TRI_IN : out std_logic;
			Flip_IN : out std_logic
		);
end uPLab4;

architecture arch of uPLab4 is
signal temp : std_logic;
--signal notPH6 : std_logic;

begin
	
	--notPH6 <= not Ph6;
	temp <= (not ph6) and  (not PH7);
	Flip_IN <= (not PH0) nand temp;
	TRI_IN <= (not PH1) nand temp;
	
	
end architecture; 