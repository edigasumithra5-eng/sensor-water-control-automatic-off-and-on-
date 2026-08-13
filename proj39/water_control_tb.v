# water_control_tb.v

```verilog
`timescale 1ns/1ps

module water_control_tb;

    reg low_sensor;
    reg mid_sensor;
    reg high_sensor;

    wire pump;

    // Instantiate the Water Control module
    water_control uut (

        .low_sensor(low_sensor),
        .mid_sensor(mid_sensor),
        .high_sensor(high_sensor),
        .pump(pump)

    );

    initial begin

        // Create waveform file
        $dumpfile("water_control.vcd");
        $dumpvars(0, water_control_tb);

        $display("==============================================");
        $display(" SENSOR WATER CONTROL AUTOMATION SIMULATION");
        $display("==============================================");
        $display("Time\tLow\tMid\tHigh\tPump");

        // Test 1: Tank Empty
        low_sensor  = 0;
        mid_sensor  = 0;
        high_sensor = 0;

        #10;

        $display("%0t\t%b\t%b\t%b\t%b",
                 $time, low_sensor, mid_sensor,
                 high_sensor, pump);

        // Test 2: Low Level
        low_sensor  = 1;
        mid_sensor  = 0;
        high_sensor = 0;

        #10;

        $display("%0t\t%b\t%b\t%b\t%b",
                 $time, low_sensor, mid_sensor,
                 high_sensor, pump);

        // Test 3: Medium Level
        low_sensor  = 1;
        mid_sensor  = 1;
        high_sensor = 0;

        #10;

        $display("%0t\t%b\t%b\t%b\t%b",
                 $time, low_sensor, mid_sensor,
                 high_sensor, pump);

        // Test 4: Full Tank
        low_sensor  = 1;
        mid_sensor  = 1;
        high_sensor = 1;

        #10;

        $display("%0t\t%b\t%b\t%b\t%b",
                 $time, low_sensor, mid_sensor,
                 high_sensor, pump);

        // Test 5: Water level drops
        low_sensor  = 1;
        mid_sensor  = 0;
        high_sensor = 0;

        #10;

        $display("%0t\t%b\t%b\t%b\t%b",
                 $time, low_sensor, mid_sensor,
                 high_sensor, pump);

        $display("==============================================");
        $display("Simulation Completed");
        $display("==============================================");

        $finish;

    end

endmodule
```
