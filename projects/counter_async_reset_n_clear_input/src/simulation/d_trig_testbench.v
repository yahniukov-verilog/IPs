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

module d_trig_testbench ( );

    parameter reg CLEAR_DATA  = 0;
    parameter     CLEAR_VAL   = 1;

    reg D, DCLR, C, CLR;
    wire Q, notQ;

    d_trig #(
        .CLEAR_VAL(CLEAR_VAL)
    )
    d_trig_i (
        .D(D),
        .DCLR(CLEAR_DATA),
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
        D = 0;
        C = 0;
        CLR = ~CLEAR_VAL;

        // Reset
        #2 CLR = CLEAR_VAL;
        #2 CLR = ~CLEAR_VAL;

        #40 CLR = CLEAR_VAL;
        #2  CLR = ~CLEAR_VAL;
    end

endmodule