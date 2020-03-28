-- a testbench has no ports:
entity adder_tb is
end adder_tb;

architecture behav of adder_tb is
	-- declaration of the component that will be instantiated:
	component adder
		port (i0, i1 : in bit; ci : in bit; s : out bit; co : out bit);
	end component;

	-- specifies which entity is bound with the component:
	for adder_0: adder use entity work.adder;
	signal i0, i1, ci, s, co : bit;
	
begin
	-- component instantiation:
	adder_0: adder port map (i0 => i0, i1 => i1, ci => ci, s => s, co => co);

-- this process does the real job
process
	type pattern_type is record
		-- the inputs of the adder:
		i0, i1, ci : bit;
		-- the expected outputs of the adder:
		s, co : bit;
	end record;

	-- the patterns to apply:
	type pattern_array is array (natural range <>) of pattern_type;
	constant patterns : pattern_array :=
		(('0','0','0','0','0'),
		 ('0','0','1','1','0'),
		 ('0','1','0','1','0'),
		 ('0','1','1','0','1'),
		 ('1','0','0','1','0'),
		 ('1','0','1','0','1'),
		 ('1','1','0','0','1'),
		 ('1','1','1','1','1'));

	begin
		-- check for each pattern:
		for i in patterns'range loop

		-- set the inputs
		i0 <= patterns(i).i0;
		i1 <= patterns(i).i1;
		ci <= patterns(i).ci;
		-- wait for the results:
		wait for 1 ns;
		-- check the outputs:
		assert s = patterns(i).s
			report "bad sum value" severity error;
		assert co = patterns(i).co
			report "bad carry out value" severity error;

		end loop;
		assert false report "end of test" severity note;
		-- wait forever, this will finish the simulation
		wait;
end process;
end behav;
