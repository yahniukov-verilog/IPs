module d_trig( 
    D, C, R,    // in 
    Q, notQ     // out 
    );

    // Parameters
    parameter INIT_VAL    = 0;
    parameter RESET_VAL   = 1;
    
    // Ports
    input wire D, C, R;
    output wire Q, notQ;
    
    // Variables
    reg Q_reg = INIT_VAL;

    // Behavioral
    
    always @(posedge C) begin
        if(R == RESET_VAL)
            Q_reg <= INIT_VAL;
        else
            Q_reg <= D;
    end
    
    assign Q    = Q_reg;
    assign notQ = !Q_reg;
    
endmodule
