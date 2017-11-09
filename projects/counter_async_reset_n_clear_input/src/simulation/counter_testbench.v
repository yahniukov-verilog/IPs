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

module counter_testbench (  );

    parameter                          DATA_WIDTH   = 4;
    parameter reg [DATA_WIDTH - 1 : 0] CLEAR_DATA   = 0;
    parameter                          CLEAR_VAL    = 1;

    reg C, CLR;
    wire [DATA_WIDTH - 1 : 0] Q, notQ;
    wire overflow;

    counter #(
        .DATA_WIDTH(DATA_WIDTH),
        .CLEAR_VAL(CLEAR_VAL)
    ) counter_i (
        .DCLR(CLEAR_DATA),
        .C(C),
        .CLR(CLR),
        .Q(Q),
        .notQ(notQ),
        .overflow(overflow)
    );

    // Clock generation
    always
        #5 C = !C;

    // Simulation
    initial begin
        C = 0;
        CLR = ~CLEAR_VAL;

        #4 CLR = CLEAR_VAL;
        #4 CLR = ~CLEAR_VAL;

        #36 CLR = CLEAR_VAL;
        #4  CLR = ~CLEAR_VAL;
    end

endmodule