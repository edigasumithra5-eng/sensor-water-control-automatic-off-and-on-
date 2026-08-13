# Sensor Water Control Automation using Verilog

## 📌 Project Description

The **Sensor Water Control Automation System** is a digital system designed to automatically control a water pump based on water-level sensor inputs.

When the water level is **LOW**, the system turns the pump **ON**. When the water reaches the **FULL** level, the system turns the pump **OFF**.

This project is implemented using **Verilog HDL** and can be simulated using tools such as **ModelSim, QuestaSim, Vivado, or Icarus Verilog with GTKWave**.

## 🎯 Objectives

* Automatically control a water pump.
* Detect water level using sensors.
* Turn the pump ON when the tank needs water.
* Turn the pump OFF when the tank is full.
* Reduce water overflow.
* Demonstrate digital automation using Verilog HDL.

## 🛠️ Technologies Used

* Verilog HDL
* ModelSim / QuestaSim / Vivado / Icarus Verilog
* GTKWave
* GitHub

## 🔌 Sensor Inputs

This project uses three water-level sensors:

| Sensor        | Meaning                                      |
| ------------- | -------------------------------------------- |
| `low_sensor`  | Water has reached the low-level sensor       |
| `mid_sensor`  | Water has reached the middle-level sensor    |
| `high_sensor` | Water has reached the high-level/full sensor |

The sensors are assumed to output:

```text
0 = Sensor not detecting water
1 = Sensor detecting water
```

## ⚙️ Control Logic

### Water Level LOW

If no sensor detects sufficient water:

```text
low_sensor  = 0
mid_sensor  = 0
high_sensor = 0

Pump = ON
```

### Water Level MEDIUM

When the middle sensor detects water but the high sensor does not:

```text
low_sensor  = 1
mid_sensor  = 1
high_sensor = 0

Pump = ON
```

### Water Level FULL

When the high-level sensor detects water:

```text
high_sensor = 1

Pump = OFF
```

## 📋 Truth Table

| Low Sensor | Mid Sensor | High Sensor | Pump |
| ---------: | ---------: | ----------: | ---: |
|          0 |          0 |           0 |    1 |
|          1 |          0 |           0 |    1 |
|          1 |          1 |           0 |    1 |
|          1 |          1 |           1 |    0 |

`1 = ON/Detected`

`0 = OFF/Not Detected`

## 🧩 Block Diagram

```text
       WATER TANK
           |
    +------+------+
    |             |
 Low Sensor   Mid Sensor
    |             |
    +------+------+
           |
      High Sensor
           |
           v
   +----------------+
   | Verilog Water  |
   | Control Logic  |
   +----------------+
           |
           v
      +---------+
      |  PUMP   |
      +---------+
       ON / OFF
```

## ▶️ Simulation Using Icarus Verilog

Install Icarus Verilog and GTKWave.

Compile the design and testbench:

```bash
iverilog -o water_control_sim water_control.v water_control_tb.v
```

Run the simulation:

```bash
vvp water_control_sim
```

Generate a waveform file:

```bash
vvp water_control_sim
```

Open the waveform using:

```bash
gtkwave water_control.vcd
```

## 📊 Expected Result

The pump should remain **ON while the tank is not full**.

When the high-level sensor becomes `1`, the pump should become **OFF**.

## 🚀 Future Enhancements

* Add automatic water-level display.
* Add buzzer for overflow warning.
* Add LCD display.
* Add dry-run protection.
* Add manual/automatic mode.
* Add multiple water tanks.
* Interface with an FPGA development board.

## 📚 Learning Outcomes

This project helps students understand:

* Verilog HDL
* Digital logic
* Sensor inputs
* Combinational logic
* Testbench creation
* Waveform simulation
* Automated control systems
* FPGA-based system design

## 👨‍💻 Project Information

**Project:** Sensor Water Control Automation
**Language:** Verilog HDL
**Application:** Automatic Water Pump Control
**Type:** Digital Hardware Mini Project
**Simulation:** ModelSim / Vivado / Icarus Verilog

## 📄 License

This project is created for educational purposes.
