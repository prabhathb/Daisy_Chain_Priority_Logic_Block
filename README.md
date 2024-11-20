# Daisy_Chain_Priority_Logic_Block
This is a VHDL model of a daisy chain logic block that is used to determine the priorities of multiple interrupt sources. This block decides whether to propagate the interrupt acknowledgement signal to next block or not. A typical Daisy chain consists of many such blocks connected sequentially.

The design assumes active low signals for the interrupt request signals issued by the peripheral device and the interrupt acknowledgement signal issued by the CPU. 

The test bench is designed following the steps described in the README of https://github.com/prabhathb/Four_input_AND_gate. Snap shots of the test results are also provided.

Test benched was simulated on ModelSim starter edition 2020.1 by Mentor Graphics.
