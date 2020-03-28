library ieee;
use ieee.std_logic_1164.all;
use std.textio.all; --imports the standards textio package

entity heartbeat is
	port(clk: out std_logic);
end heartbeat;

architecture behaviour of heartbeat is
	constant clk_period: time := 10000 ms;
begin
--clock process definition
	clk_process: process
	variable l: line;
	begin
		clk <= '0';
		write(l, String'("0"));
		writeline(output, l);
		wait for clk_period/2;
		clk <= '1';
		write(l, String'("1"));
		writeline(output, l);
		wait for clk_period/2;
	end process;
end behaviour;
