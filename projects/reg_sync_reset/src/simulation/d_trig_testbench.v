module d_trig_testbench ( );

    parameter INIT_VAL  = 0;
    parameter RESET_VAL = 1;

    reg D, C, R;
    wire Q, notQ;

    d_trig #(
        .INIT_VAL(INIT_VAL),
        .RESET_VAL(RESET_VAL)
    )
    d_trig_i (
        .D(D),
        .C(C),
        .R(R),
        .Q(Q),
        .notQ(notQ)
    );

    // Clock generation
    always
        #5 C = !C;

    // Data generation
    always
        #30 D = !D;

    // Simulation
    initial begin
        D = INIT_VAL;
        C = 0;
        R = ~RESET_VAL;

        // Reset
        #2 R = RESET_VAL;
        #2 R = ~RESET_VAL;

        #40 R = RESET_VAL;
        #2  R = ~RESET_VAL;
    end

endmodule