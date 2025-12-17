module ripple_counter_4bit (
    input  wire clk,      // external clock
    input  wire reset_n,  // active-low asynchronous reset
    output wire [3:0]q   // 4-bit count output
);

    // Q0 toggles on external clock
    T_ff t0 (
        .clk    (clk),
        .reset_n(reset_n),
        .q      (q[0])
    );

    // Each next stage uses previous bit as its clock (ripple)
    T_ff t1 (
        .clk    (q[0]),
        .reset_n(reset_n),
        .q      (q[1])
    );

    T_ff t2 (
        .clk    (q[1]),
        .reset_n(reset_n),
        .q      (q[2])
    );

    T_ff t3 (
        .clk    (q[2]),
        .reset_n(reset_n),
        .q      (q[3])
    );

endmodule
