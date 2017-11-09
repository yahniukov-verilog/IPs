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

module register_testbench (  );

    parameter                          DATA_WIDTH = 4;
    parameter reg [DATA_WIDTH - 1 : 0] INIT_VAL   = 0;
    parameter                          CLEAR_VAL  = 1;

    reg [DATA_WIDTH - 1 : 0] D;
    reg C, CLR;
    wire [DATA_WIDTH - 1 : 0] Q;

    register #(
        .DATA_WIDTH(DATA_WIDTH),
        .INIT_VAL(INIT_VAL),
        .CLEAR_VAL(CLEAR_VAL)
    ) register_i (
        .D(D),
        .C(C),
        .CLR(CLR),
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
        D   = INIT_VAL;
        C   = 0;
        CLR = ~CLEAR_VAL;

        #2 CLR = CLEAR_VAL;
        #2 CLR = ~CLEAR_VAL;

        #57 CLR = CLEAR_VAL;
        #2  CLR = ~CLEAR_VAL;

        #42 CLR = CLEAR_VAL;
        #2  CLR = ~CLEAR_VAL;
    end

endmodule