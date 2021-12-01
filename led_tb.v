`timescale 1ns/1ps

module led_tb;
    reg r_clk = 1'b0;
    wire w_led;

    //Instantiating led module
    led uut(
        .i_clk(r_clk),
        .o_led(w_led)
    );

    always #10000000 r_clk = !r_clk; // Toggle clock every 0.01s

    initial begin
        $dumpfile("led_tb.vcd");
        $dumpvars(0, led_tb);

        #1000000000 //=== 1second
        $display("Test complete");
        $finish;
    end
endmodule