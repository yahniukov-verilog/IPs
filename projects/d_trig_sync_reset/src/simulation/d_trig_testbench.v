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