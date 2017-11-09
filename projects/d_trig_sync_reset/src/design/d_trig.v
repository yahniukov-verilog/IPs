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
