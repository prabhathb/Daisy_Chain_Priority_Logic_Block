library ieee;
use ieee.std_logic_1164.all;

-- the toplevel entity of a testbench is the testbench itself
-- it is represented as an empty entity
entity daisy_chain_block_tb is
	--empty
end entity;

-- testbench is described using the behavioural modeling
architecture tb1 of daisy_chain_block_tb is

	-- declare the Device Under Test (DUT) to be tested
	component daisy_chain_block is
		port(
			ACK_input: IN std_logic;
			IRQ_input: IN std_logic;
			IRQ: OUT std_logic;
			ACK_output: OUT std_logic;
			ACK_k: OUT std_logic
		);
	end component;

	-- bind the component
	for all: daisy_chain_block use entity work.daisy_chain_block(dataflow);

	-- declare the signals used
	signal ACK_input_tb: std_logic := '1';
	signal IRQ_input_tb: std_logic := '1';
	signal IRQ_tb: std_logic := '0';
	signal ACK_output_tb: std_logic := '0';
	signal ACK_k_tb: std_logic := '0';
begin
	-- instantiate the component
	u0: daisy_chain_block port map(ACK_input_tb,IRQ_input_tb,IRQ_tb, ACK_output_tb, ACK_k_tb);

	process

	begin
		-- produce the signals
		IRQ_input_tb <= '1';ACK_input_tb <= '1';
		wait for 10 ps;
		IRQ_input_tb <= '1';ACK_input_tb <= '0';
		wait for 10 ps;
		IRQ_input_tb <= '0';ACK_input_tb <= '1';
		wait for 10 ps;
		IRQ_input_tb <= '0';ACK_input_tb <= '0';
		wait for 10 ps;
	end process;
end architecture;
