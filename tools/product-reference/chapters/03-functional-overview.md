## **3 Functional Overview**

The external host supplies power, I2C control, and I2S/PCM clocks and data.
The ES8311 handles mono recording and playback. Its differential analog output
feeds both a jack path and the NS4150B speaker amplifier in the schematic.

### **3.1 Block Diagram** {.section-page}

![Functional block diagram of the ES8311 codec, microphone input, jack path, and NS4150B speaker amplifier](hardware/img/unit_block_diagram_v_0_1_0_i2s_es8311_codec_with_amplifier_module.png){width=6.5in}

### **3.2 Board Topology** {.section-page}

The top image shows the QWIIC-style and I2S connectors along one edge, the
speaker connector, microphone connector, 3.5 mm jack, and a ten-position
castellated header. The opposite image shows the amplifier-off and I2C-address
markings.

### **3.3 Audio Codec** {.section-page}

IC1 is the ES8311. Its recording path includes a differential analog input,
microphone preamplifier, ADC, programmable gain, and automatic level control.
The playback path includes a mono DAC and differential analog outputs.
Configuration uses the I2C control interface. See the ES8311 User Guide for
register-level programming and valid clock configurations.

### **3.4 Digital Audio Architecture** {.section-page}

The codec has a serial audio port supporting I2S, left-justified, and DSP-A/B
formats. MCLK is the external master-clock input on the board. SCLK and LRCK
can be inputs in slave mode or outputs in master mode as configured in ES8311
registers. ASDOUT carries ADC data toward the host; DSDIN1 carries playback
data from the host.

### **3.5 Speaker Amplifier** {.section-page}

IC2 is NS4150B. ES8311 OUTP and OUTN are AC-coupled into its differential
input. Amplifier outputs PA_OUT+ and PA_OUT− reach J1 through zero-ohm links.
PA_CTRL is exposed to the host and connects to the amplifier CTRL input.

### **3.6 Analog Microphone Input** {.section-page}

J2 exposes the microphone input circuit for ES8311 MIC1P and MIC1N. The
schematic includes resistors and capacitors around the input and bias network.

### **3.7 Status Indicator** {.section-page}

D1 is a green power indicator connected from VCC through R9 to ground. It
indicates presence of the module supply; it does not report codec or amplifier
configuration.

### **3.8 AP2112K Power Management System** {.section-page}

U1 and U2 are AP2112K-3.3V regulators. U1 creates 3V3 and U2 creates
A_3V3 from VCC.

### **3.9 Power Tree** {.section-page}

| Source | Destination | Schematic connection |
|---|---|---|
| VCC | IC2, D1, J4, J6, U1, U2 | Direct module supply net |
| U1 / 3V3 | IC1 digital supply and I2C pull-up | Regulated net |
| U2 / A_3V3 | IC1 AVDD | Analog regulated net |
| AGND and GND | R8 | Zero-ohm ground coupling |

### **3.10 I2C Control** {.section-page}

IC1 CCLK and CDATA connect to SCL and SDA respectively. R5 pulls CE to
3V3, so the ES8311 User Guide assigns the 7-bit address 0x19 for the shown
assembly. The guide gives a control-bus transfer rate below 400 kbit/s.

### **3.11 Headphone / Jack Path** {.section-page}

The ES8311 differential outputs also reach J3, a PJ-320D 3.5 mm jack,
through the schematic's coupling and link components. MIC1P and ground are
also present at the jack circuit.

### **3.12 I2C and QWIIC Expansion** {.section-page}

J6 exposes VCC, ground, SDA, and SCL. It shares the codec I2C signals with
J4. Its VCC pin is the module input net, not the 3V3 regulator output in the
revision 2.0 schematic. The host and attached I2C device must share a
compatible power and logic arrangement.

### **3.13 Combined System Operation** {.section-page}

A host configures the ES8311 by I2C, supplies suitable clocks, then transfers
digital audio over the serial port. The host separately controls PA_CTRL when
using the speaker amplifier.
