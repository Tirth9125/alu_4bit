# Clock definition
 create_clock -period 10 -name "clock" [get_ports clock]
 set_clock_uncertainty 0.2 [get_clocks clock]
 set_clock_transition  0.1 [get_clocks clock]

# Input/Output delays
 set_input_delay  2.0 -clock clock [all_inputs]
 set_output_delay 2.0 -clock clock [all_outputs]

# False paths
# set_false_path -from [get_ports rst_n]
