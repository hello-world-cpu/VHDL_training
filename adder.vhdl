entity adder is
	-- ci is the carry in bit, co is the carry out bit
	port(i0, i1 : in bit; ci : in bit; s : out bit; co : out bit);
end adder;

architecture behavioral of adder is
begin
-- This full-adder architecture contains 2 concurrent assignments
-- Compute the sum
	s <= i0 xor i1 xor ci;
-- Compute the carry out
	co <= (i0 and i1) or (i0 and ci) or (i1 and ci);
end behavioral;
