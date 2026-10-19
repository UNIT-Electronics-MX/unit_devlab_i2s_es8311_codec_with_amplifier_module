## **3 Functional Overview**

The external host supplies power and I2C control and exchanges serial audio
with the ES8311. The direction of the serial audio clocks depends on the codec
mode. The ES8311 handles mono recording and playback. Its differential analog
output feeds both a jack path and the NS4150B speaker amplifier in the schematic.

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

The serial audio port supports I2S, left-justified, and DSP-A/B formats. In
each format, the codec sends the most significant data bit first. DSDIN1
receives playback samples for the DAC; ASDOUT sends captured ADC samples to
the host. These data directions do not change with the clock mode. SCLK times
the data bits, while LRCK identifies the audio frame alignment. The host and
codec must use the same data format and word length.

| Codec mode | SCLK and LRCK at J4 | Clock source at these pins |
|---|---|---|
| Slave (reset default) | Inputs | Host |
| Master | Outputs | ES8311 |

MCLK is an input in either mode. The codec can select MCLK or SCLK as its
internal master-clock source through register settings. The ES8311 User Guide,
sections 7 and 8, defines the format timing and clock-divider options.

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

I2C reads and writes codec registers; audio samples travel on the separate
serial audio port. J4 pin 3 (SCL) and J6 pin 4 share the clock net, which
reaches IC1 CCLK through zero-ohm R7. J4 pin 4 (SDA) and J6 pin 3 share the
bidirectional data net, which reaches IC1 CDATA through zero-ohm R4.

R5 pulls CE to 3V3, selecting the 7-bit address 0x19 in the ES8311 User Guide.
The guide specifies an I2C transfer rate below 400 kbit/s and recommends
1–4.7 kΩ pull-ups for CCLK and CDATA. The available schematic page does not
show dedicated SCL/SDA pull-ups. Verify the pull-ups and their voltage on the
assembled bus before connecting the host or another I2C device.

### **3.11 Headphone / Jack Path** {.section-page}

The ES8311 differential outputs also reach J3, a PJ-320D 3.5 mm jack,
through the schematic's coupling and link components. MIC1P and ground are
also present at the jack circuit.

### **3.12 I2C and QWIIC Expansion** {.section-page}

J6 extends the same I2C bus as J4; it is not a separate controller or an
I2S connection. Devices attached to J6 share the bus pull-ups and address
space. J6 also carries the module VCC input net, not the regulated 3V3 net.
Check the attached device's supply and logic compatibility before connecting it.

### **3.13 Combined System Operation** {.section-page}

A host configures the ES8311 by I2C, supplies suitable clocks, then transfers
digital audio over the serial port. The host separately controls PA_CTRL when
using the speaker amplifier.
