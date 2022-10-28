module sinegen #(
    parameter ADDRESS_WIDTH=8,
              DATA_WIDTH=8,
              WIDTH=8
)(
    input logic clk, // clock
    input logic rst, // reset
    input logic [WIDTH-1:0] en, // en
    output logic [DATA_WIDTH-1:0] dout,
    output logic [WIDTH-1:0] count //count output
);

counter myCounter (
  .WIDTH (WIDTH),
  .clk (clk),
  .rst (rst),
  .en (en),
  .count (count)
);

rom myRom (
  .ADDRESS_WIDTH (ADDRESS_WIDTH),
  .DATA_WIDTH (DATA_WIDTH),
  .clk (clk),
  .addr (count),
  .dout (dout)
);

endmodule
