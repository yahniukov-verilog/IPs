module d_trig_testbench ( );

    parameter INIT_VAL  = 0;
    parameter CLEAR_VAL = 1;

    reg D, C, CLR;
    wire Q, notQ;

    d_trig #(
        .INIT_VAL(INIT_VAL),
        .CLEAR_VAL(CLEAR_VAL)
    )
    d_trig_i (
        .D(D),
        .C(C),
        .CLR(CLR),
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
        CLR = ~CLEAR_VAL;

        // Clear
        #2 CLR = CLEAR_VAL;
        #2 CLR = ~CLEAR_VAL;

        #57 CLR = CLEAR_VAL;
        #2  CLR = ~CLEAR_VAL;

        #42 CLR = CLEAR_VAL;
        #2  CLR = ~CLEAR_VAL;
    end

endmodule