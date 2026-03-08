`timescale 1ns / 1ps

module testbench;

    reg clk   = 0;
    reg reset = 0;

    wire led;
    wire ja0, ja1, ja2, ja3, ja4, ja5, ja6, ja7;
    wire jb0, jb1, jb2, jb3, jb4, jb5, jb6, jb7;

    bit_counter uut (
        .clk(clk), .reset(reset), .led(led),
        .ja0(ja0), .ja1(ja1), .ja2(ja2), .ja3(ja3),
        .ja4(ja4), .ja5(ja5), .ja6(ja6), .ja7(ja7),
        .jb0(jb0), .jb1(jb1), .jb2(jb2), .jb3(jb3),
        .jb4(jb4), .jb5(jb5), .jb6(jb6), .jb7(jb7)
    );

    always #5 clk = ~clk; // 100 MHz

    initial begin
        // Assert reset
        reset = 1; #20;
        reset = 0;

        // Run for a few hundred cycles and sample output
        repeat (10) @(posedge clk);
        $display("out[7:0]  = %b (JA)", {ja7,ja6,ja5,ja4,ja3,ja2,ja1,ja0});
        $display("out[15:8] = %b (JB)", {jb7,jb6,jb5,jb4,jb3,jb2,jb1,jb0});

        repeat (65520) @(posedge clk); // run to near rollover

        $display("near rollover — JA=%b JB=%b",
            {ja7,ja6,ja5,ja4,ja3,ja2,ja1,ja0},
            {jb7,jb6,jb5,jb4,jb3,jb2,jb1,jb0});

        $finish;
    end

endmodule
