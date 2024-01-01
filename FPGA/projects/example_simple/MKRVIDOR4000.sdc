## Generated SDC file "MKRVIDOR4000.sdc"

## Copyright (C) 2023  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and any partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details, at
## https://fpgasoftware.intel.com/eula.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 23.1std.0 Build 991 11/28/2023 SC Lite Edition"

## DATE    "Sun Dec 31 16:44:32 2023"

##
## DEVICE  "10CL016YU256C8G"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {altera_reserved_tck} -period 100.000 -waveform { 0.000 50.000 } [get_ports {altera_reserved_tck}]
create_clock -name {iCLK} -period 10.000 -waveform { 0.000 5.000 } [get_nets {iCLK}]
create_clock -name {MyDesign:MyDesign_inst|COUNTER:inst6|iCLK_ff_n[0]} -period 10.000 -waveform { 0.200 5.400 } [get_nets {MyDesign_inst|inst6|iCLK_ff[0]}]
create_clock -name {MyDesign:MyDesign_inst|COUNTER:inst6|iCLK_ff_n[1]} -period 10.000 -waveform { 0.400 5.600 } [get_nets {MyDesign_inst|inst6|iCLK_ff[1]}]
create_clock -name {MyDesign:MyDesign_inst|COUNTER:inst6|iCLK_ff_n[2]} -period 10.000 -waveform { 0.600 5.800 } [get_nets {MyDesign_inst|inst6|iCLK_ff[2]}]
create_clock -name {MyDesign:MyDesign_inst|COUNTER:inst6|iCLK_ff_n[3]} -period 10.000 -waveform { 0.800 6.000 } [get_nets {MyDesign_inst|inst6|iCLK_ff[3]}]
create_clock -name {MyDesign:MyDesign_inst|COUNTER:inst6|iCLK_ff_n[4]} -period 10.000 -waveform { 1.000 6.200 } [get_nets {MyDesign_inst|inst6|iCLK_ff[4]}]
create_clock -name {MyDesign:MyDesign_inst|COUNTER:inst6|iCLK_ff_n[5]} -period 10.000 -waveform { 1.200 6.400 } [get_nets {MyDesign_inst|inst6|iCLK_ff[5]}]
create_clock -name {MyDesign:MyDesign_inst|COUNTER:inst6|iCLK_ff_n[6]} -period 10.000 -waveform { 1.400 6.600 } [get_nets {MyDesign_inst|inst6|iCLK_ff[6]}]
create_clock -name {MyDesign:MyDesign_inst|COUNTER:inst6|iCLK_ff_n[7]} -period 10.000 -waveform { 1.600 6.800 } [get_nets {MyDesign_inst|inst6|iCLK_ff[7]}]
create_clock -name {MyDesign:MyDesign_inst|COUNTER:inst6|iCLK_ff_n[8]} -period 10.000 -waveform { 1.800 7.000 } [get_nets {MyDesign_inst|inst6|iCLK_ff[8]}]
create_clock -name {MyDesign:MyDesign_inst|COUNTER:inst6|iCLK_ff_n[9]} -period 10.000 -waveform { 2.000 7.200 } [get_nets {MyDesign_inst|inst6|iCLK_ff[9]}]
create_clock -name {MyDesign:MyDesign_inst|COUNTER:inst6|iCLK_ff_n[10]} -period 10.000 -waveform { 2.200 7.400 } [get_nets {MyDesign_inst|inst6|iCLK_ff[10]}]
create_clock -name {MyDesign:MyDesign_inst|COUNTER:inst6|iCLK_ff_n[11]} -period 10.000 -waveform { 2.400 7.600 } [get_nets {MyDesign_inst|inst6|iCLK_ff[11]}]
create_clock -name {MyDesign:MyDesign_inst|COUNTER:inst6|iCLK_ff_n[12]} -period 10.000 -waveform { 2.600 7.800 } [get_nets {MyDesign_inst|inst6|iCLK_ff[12]}]
create_clock -name {MyDesign:MyDesign_inst|COUNTER:inst6|iCLK_ff_n[13]} -period 10.000 -waveform { 2.800 8.000 } [get_nets {MyDesign_inst|inst6|iCLK_ff[13]}]
create_clock -name {MyDesign:MyDesign_inst|COUNTER:inst6|iCLK_ff_n[14]} -period 10.000 -waveform { 3.000 8.200 } [get_nets {MyDesign_inst|inst6|iCLK_ff[14]}]
create_clock -name {MyDesign:MyDesign_inst|COUNTER:inst6|iCLK_ff_n[15]} -period 10.000 -waveform { 3.200 8.400 } [get_nets {MyDesign_inst|inst6|iCLK_ff[15]}]
create_clock -name {MyDesign:MyDesign_inst|COUNTER:inst6|iCLK_ff_n[16]} -period 10.000 -waveform { 3.400 8.600 } [get_nets {MyDesign_inst|inst6|iCLK_ff[16]}]
create_clock -name {MyDesign:MyDesign_inst|COUNTER:inst6|iCLK_ff_n[17]} -period 10.000 -waveform { 3.600 8.800 } [get_nets {MyDesign_inst|inst6|iCLK_ff[17]}]
create_clock -name {MyDesign:MyDesign_inst|COUNTER:inst6|iCLK_ff_n[18]} -period 10.000 -waveform { 3.800 9.000 } [get_nets {MyDesign_inst|inst6|iCLK_ff[18]}]
create_clock -name {MyDesign:MyDesign_inst|COUNTER:inst6|iCLK_ff_n[19]} -period 10.000 -waveform { 4.000 9.200 } [get_nets {MyDesign_inst|inst6|iCLK_ff[19]}]
create_clock -name {MyDesign:MyDesign_inst|COUNTER:inst6|iCLK_ff_n[20]} -period 10.000 -waveform { 4.200 9.400 } [get_nets {MyDesign_inst|inst6|iCLK_ff[20]}]
create_clock -name {MyDesign:MyDesign_inst|COUNTER:inst6|iCLK_ff_n[21]} -period 10.000 -waveform { 4.400 9.600 } [get_nets {MyDesign_inst|inst6|iCLK_ff[21]}]
create_clock -name {MyDesign:MyDesign_inst|COUNTER:inst6|iCLK_ff_n[22]} -period 10.000 -waveform { 4.600 9.800 } [get_nets {MyDesign_inst|inst6|iCLK_ff[22]}]
create_clock -name {MyDesign:MyDesign_inst|COUNTER:inst6|iCLK_ff_n[23]} -period 10.000 -waveform { 4.800 10.000 } [get_nets {MyDesign_inst|inst6|iCLK_ff[23]}]
create_clock -name {MyDesign:MyDesign_inst|COUNTER:inst6|iCLK_ff_n[24]} -period 10.000 -waveform { 5.000 10.200 } [get_nets {MyDesign_inst|inst6|iCLK_ff[24]}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************



#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************

set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 


#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

