module register (
    D, C, R,    // in
    Q           // out
    );

    // Parameters
    parameter                          DATA_WIDTH = 4;
    parameter reg [DATA_WIDTH - 1 : 0] INIT_VAL   = 0;
    parameter                          RESET_VAL  = 1;

    // Ports
    input wire [DATA_WIDTH - 1 : 0] D;
    input wire C, R;
    output wire [DATA_WIDTH - 1 : 0] Q;

    // Variables
    genvar i;

    // Behavioral
    generate
        for(i = 0; i < DATA_WIDTH; i = i + 1) begin
            d_trig #(
                .INIT_VAL(INIT_VAL[i]),
                .RESET_VAL(RESET_VAL)
            ) d_trig_i (
                .D(D[i]),
                .C(C),
                .R(R),
                .Q(Q[i]),
                .notQ()
            );
        end
    endgenerate

endmodule