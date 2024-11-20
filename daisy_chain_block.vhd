library ieee;
use ieee.std_logic_1164.all;

entity daisy_chain_block is
	port(
		ACK_input: IN std_logic;	--Acknowledment from the CPU 
		IRQ_input: IN std_logic;	--Interrupt Request from the Peripheral device
		IRQ: OUT std_logic;		--Interrupt request shared with the CPU and other devices
		ACK_output: OUT std_logic;	--Acknowledment to the next daisy chain block
		ACK_k: OUT std_logic		--Acknowledment to the Peripheral device
	);
end entity;

architecture dataflow of daisy_chain_block is

begin
	IRQ <= IRQ_input;
	ACK_k <= ACK_input or IRQ_input;
	ACK_output <= ACK_input or (not IRQ_input);
end architecture;
