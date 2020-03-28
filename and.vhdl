library ieee;
use ieee.std_logic_1164.all;

entity circuit_1 is
	port(a : in STD_LOGIC; b : in STD_LOGIC; out1 : out STD_LOGIC);
end circuit_1;

architecture behavioral of circuit_1 is
begin
	out1 <= (a and b);
end behavioral;
