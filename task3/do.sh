#!/bin/sh

# cleanup
rm -rf obj_dir
rm -f sigdelay.vcd

# run Verilator to translate Verilog into C++, including C++ testbench
verilator -Wall --cc --trace sigdelay.sv --exe sigdelay_tb.cpp

# run verilator to translat everilog to c++ including testbench
make -j -C obj_dir/ -f Vsigdelay.mk Vsigdelay

# run executable simulation file
obj_dir/Vsigdelay

# run gtkwave to see waveforms
gtkwave sigdelay.vcd