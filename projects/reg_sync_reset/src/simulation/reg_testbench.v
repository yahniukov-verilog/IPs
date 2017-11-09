module register_testbench (  );

    parameter                          DATA_WIDTH = 4;
    parameter reg [DATA_WIDTH - 1 : 0] INIT_VAL   = 0;
    parameter                          RESET_VAL  = 1;

    reg [DATA_WIDTH - 1 : 0] D;
    reg C, R;
    wire [DATA_WIDTH - 1 : 0] Q;

    register #(
        .DATA_WIDTH(DATA_WIDTH),
        .INIT_VAL(INIT_VAL),
        .RESET_VAL(RESET_VAL)
    ) register_i (
        .D(D),
        .C(C),
        .R(R),
        .Q(Q)
    );

    // Clock generation
    always
        #5 C = !C;

    // Data generation
    always @(posedge C)
        D <= D + 1;

    // Simulation
    initial begin
        D = INIT_VAL;
        C = 0;
        R = ~RESET_VAL;

        #2 R = RESET_VAL;
        #2 R = ~RESET_VAL;

        #40 R = RESET_VAL;
        #2  R = ~RESET_VAL;
    end

endmodule