module led(
    input i_clk,
    output o_led
);
    parameter count_checkpoint = 32'd10000000;
    reg r_count_led = 32'b0;
    reg r_led_driver = 1'b0; // Drives the output
    reg r_led_enable = 1'b0; // If on, led on. Else if this is off led is off too
    
    //Controlling led enable with the help of our counter
    //Counter starts counting at positive edge of clock and once it goes till negative edge, enable is made low
    //At next positive edge counter starts counting freshly again
    always @(posedge i_clk)begin
        $monitor(count_checkpoint);
        if(r_count_led == count_checkpoint - 1)begin
            // $monitor("Inside the if block");
            r_led_enable <= 1'b1;
            r_count_led <= 32'b0;
        end
        else begin
            // $monitor("Inside the else block");
            r_led_enable <= 1'b0;
            r_count_led <= r_count_led + 1;
        end
    end

    //If led enable is high, led is on. Else it is off
    always@(*)begin
        if(r_led_enable)begin
            r_led_driver <= 1'b1;
        end
        else begin
            r_led_driver <= 1'b0;
        end
    end

    assign o_led = r_led_driver;

endmodule