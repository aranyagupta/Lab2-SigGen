module counter #(
    parameter WIDTH = 9
)(
    // interface signals
    input logic clk, // clock
    input logic rst, // reset
    input logic en, // en
    output logic [WIDTH-1:0] count //count output
);

always_ff @(posedge clk) begin
    if (rst) count <= {WIDTH{1'b0}};
    else count <= count + {{WIDTH-1{1'b0}}, en};
end

endmodule
