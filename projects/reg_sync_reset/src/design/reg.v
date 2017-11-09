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