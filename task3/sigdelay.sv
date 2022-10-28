module sigdelay #(
    parameter WIDTH=9,
    parameter ADDRESS_WIDTH = 9,
    parameter DATA_WIDTH = 8
)
(
    input logic clk,
    input logic rst,
    input logic wr,
    input logic rd,
    input logic en,
    input logic [ADDRESS_WIDTH-1:0] offset ,
    input logic [DATA_WIDTH-1:0] mic_signal , 
    output logic [WIDTH-1:0] count  ,
    output logic [DATA_WIDTH-1:0] delayed_signal 
);

counter myCounter(
    .clk (clk),
    .rst (rst),
    .en (en),
    .count(count)
);

dpram myDPRAM(
    .clk (clk),
    .wr_en (wr),
    .rd_en (rd),
    .wr_addr(count+offset),
    .rd_addr(count),
    .din (mic_signal),
    .dout(delayed_signal)
);

endmodule
