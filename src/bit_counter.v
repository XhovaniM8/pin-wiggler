`timescale 1ns / 1ps

// 16-bit free-running counter that drives Pmod JA and JB pins.
// On reset, counter clears and LED lights up.
// Target: Arty S7-25

module bit_counter (
    input  clk,
    input  reset,
    output led,
    // Pmod JA — bits [7:0]
    output ja0, ja1, ja2, ja3,
    output ja4, ja5, ja6, ja7,
    // Pmod JB — bits [15:8]
    output jb0, jb1, jb2, jb3,
    output jb4, jb5, jb6, jb7
);

    reg [15:0] out;

    always @(posedge clk or posedge reset) begin
        if (reset)
            out <= 0;
        else
            out <= out + 1;
    end

    assign {ja7,ja6,ja5,ja4,ja3,ja2,ja1,ja0} = out[7:0];
    assign {jb7,jb6,jb5,jb4,jb3,jb2,jb1,jb0} = out[15:8];
    assign led = reset;

endmodule
