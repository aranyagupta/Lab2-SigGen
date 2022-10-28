module counter #(
    parameter WIDTH = 8
)(
    // interface signals
    input logic clk, // clock
    input logic rst, // reset
    input logic [WIDTH-1:0] en, // en
    output logic [WIDTH-1:0] count //count output
);

always_ff @(posedge clk)
    if (rst) count <= {WIDTH{1'b0}};
    else count <= count + en;

endmodule
