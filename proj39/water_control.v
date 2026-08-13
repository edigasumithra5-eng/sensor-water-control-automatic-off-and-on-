# water_control.v

```verilog
//====================================================
// Sensor Water Control Automation
//====================================================

module water_control (

    input  wire low_sensor,
    input  wire mid_sensor,
    input  wire high_sensor,

    output reg pump
);

    // Pump control logic
    //
    // If the high-level sensor detects water,
    // the tank is considered FULL and pump is OFF.
    //
    // Otherwise, pump remains ON.

    always @(*) begin

        if (high_sensor == 1'b1)
            pump = 1'b0;       // Tank FULL - Pump OFF
        else
            pump = 1'b1;       // Tank not FULL - Pump ON

    end

endmodule
```
