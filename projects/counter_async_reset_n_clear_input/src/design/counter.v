//   Copyright 2017 Yahniukov Stanislav
//
//   Licensed under the Apache License, Version 2.0 (the "License");
//   you may not use this file except in compliance with the License.
//   You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in writing, software
//   distributed under the License is distributed on an "AS IS" BASIS,
//   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   See the License for the specific language governing permissions and
//   limitations under the License.

module counter (
    DCLR, C, CLR,       // in
    Q, notQ,            // out
    overflow            // debug
    );

    // Parameters
    parameter                          DATA_WIDTH = 4;
    parameter                          CLEAR_VAL  = 1;

    // Ports
    input wire [DATA_WIDTH - 1 : 0] DCLR;
    input wire C, CLR;
    output wire [DATA_WIDTH - 1 : 0] Q, notQ;
    output reg overflow;

    // Variables
    wire [DATA_WIDTH - 1 : 0] d_trig_Q, d_trig_notQ;
    reg  [DATA_WIDTH - 1 : 0] d_trig_Q_neg;
    genvar i;
    integer j;

    // Behavioral

    generate
        for(i = 0; i < DATA_WIDTH; i = i + 1) begin
            if(i == 0) begin
                d_trig #(
                    .CLEAR_VAL(CLEAR_VAL)
                ) d_trig_0 (
                    .D(d_trig_Q[0]),
                    .DCLR(DCLR[0]),
                    .C(C),
                    .CLR(CLR),
                    .Q(d_trig_notQ[0]),
                    .notQ(d_trig_Q[0])
                );
            end
            else begin
                 d_trig #(
                    .CLEAR_VAL(CLEAR_VAL)
                ) d_trig_i (
                    .D(d_trig_Q[i]),
                    .DCLR(DCLR[i]),
                    .C(d_trig_Q[i - 1]),
                    .CLR(CLR),
                    .Q(d_trig_notQ[i]),
                    .notQ(d_trig_Q[i])
                );
            end
        end
    endgenerate

    generate
        for(i = 0; i < DATA_WIDTH; i = i + 1) begin
            assign Q[i]    = d_trig_notQ[i];
            assign notQ[i] = d_trig_Q[i];
        end
    endgenerate

    generate
        for(i = 0; i < DATA_WIDTH; i = i + 1) begin
            always @(d_trig_Q[i]) begin
                if(d_trig_Q[i])
                    d_trig_Q_neg[i] <= 1;
                else
                    d_trig_Q_neg[i] <= 0;
            end
        end
    endgenerate

    always @* begin
        overflow = 1'b1;
        for(j = 0; j < DATA_WIDTH; j = j + 1)
            overflow = overflow & d_trig_Q_neg[j];
    end

endmodule