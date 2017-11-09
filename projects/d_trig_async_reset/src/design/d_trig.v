module d_trig(
    D, C, CLR,    // in
    Q, notQ       // out
    );

    // Parameters
    parameter INIT_VAL    = 0;
    parameter CLEAR_VAL   = 1;

    // Ports
    input wire D, C, CLR;
    output wire Q, notQ;

    // Variables
    reg Q_reg = INIT_VAL;

    // Behavioral

    always @(posedge C or posedge CLR) begin
        if(CLR == CLEAR_VAL)
            Q_reg <= INIT_VAL;
        else
            Q_reg <= D;
    end

    assign Q    = Q_reg;
    assign notQ = !Q_reg;

endmodule
