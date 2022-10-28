#!/bin/sh

# cleanup
rm -rf obj_dir
rm -f counter.vcd

# run Verilator to translate Verilog into C++, including C++ testbench
verilator -Wall --cc --trace sinegen.sv --exe sinegen_tb.cpp

# run verilator to translat everilog to c++ including testbench
make -j -C obj_dir/ -f Vsinegen.mk Vsinegen

# run executable simulation file
obj_dir/Vsinegen

# run gtkwave to see waveforms
gtkwave sinegen.vcd