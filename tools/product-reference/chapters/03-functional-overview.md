## **3 Functional Overview**

The module combines a microphone recording path, a 3.5 mm playback path, and a
speaker output in one host-controlled audio module. The host supplies power,
configures the module over I2C, and exchanges digital audio over I2S/PCM.
Clock direction depends on the selected audio mode.

### **3.1 Block Diagram** {.section-page}

![Functional block diagram of the ES8311 codec, microphone input, jack path, and NS4150B speaker amplifier](hardware/img/unit_block_diagram_v_0_1_0_i2s_es8311_codec_with_amplifier_module.png){width=6.5in}

### **3.2 Board Topology** {.section-page}

QWIIC-style and I2S connectors line one edge. The speaker and microphone
connectors, 3.5 mm jack, and ten-position castellated host header provide the
external audio and control connections. Amplifier-off and I2C-address options
are marked on the opposite side.

### **3.3 Audio Codec** {.section-page}

The ES8311 handles both directions of mono audio. Microphone input
passes through its preamplifier, programmable gain, automatic level control,
and ADC before reaching the host. Playback samples pass through its DAC to
differential analog outputs for the jack and speaker paths. The host configures
these paths over I2C; register and clock settings are listed in the ES8311
User Guide.

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

The speaker path couples ES8311 OUTP and OUTN into the NS4150B differential
input. Its PA_OUT+ and PA_OUT− outputs reach J1 through zero-ohm links. The
host uses PA_CTRL to control the amplifier separately from codec playback.

### **3.6 Analog Microphone Input** {.section-page}

J2 provides the external analog microphone connection. The module routes the
signal through an input and bias network to ES8311 MIC1P and MIC1N.

### **3.7 Status Indicator** {.section-page}

D1 is a green power indicator connected from VCC through R9 to ground. It
indicates presence of the module supply; it does not report codec or amplifier
configuration.

### **3.8 Power Management** {.section-page}

Two AP2112K-3.3V regulators create separate 3V3 and A_3V3 supply nets from
VCC. These power the digital and analog audio circuitry, respectively.

### **3.9 Power Tree** {.section-page}

| Supply path | Connected circuits and ports | Function |
|---|---|---|
| VCC | IC2, D1, J4, J6, U1, U2 | Module supply distribution |
| U1 / 3V3 | IC1 digital supply and I2C pull-up | Regulated digital supply |
| U2 / A_3V3 | IC1 AVDD | Regulated analog supply |
| AGND and GND | R8 | Zero-ohm ground coupling |

### **3.10 I2C Control** {.section-page}

I2C reads and writes codec registers; audio samples travel on the separate
serial audio port. J4 pin 3 (SCL) and J6 pin 4 share the clock net, which
reaches IC1 CCLK through zero-ohm R7. J4 pin 4 (SDA) and J6 pin 3 share the
bidirectional data net, which reaches IC1 CDATA through zero-ohm R4.

R5 pulls CE to 3V3, selecting the 7-bit address 0x19. The ES8311 User Guide
specifies an I2C transfer rate below 400 kbit/s and recommends 1–4.7 kΩ
pull-ups for CCLK and CDATA. Dedicated SCL/SDA pull-ups are not shown in the
released circuit drawing; verify the assembled bus pull-ups and their
voltage before connecting another I2C device.

### **3.11 Headphone / Jack Path** {.section-page}

The module also routes the ES8311 differential outputs through coupling and link
parts to J3, a PJ-320D 3.5 mm jack. MIC1P and ground are present at the jack
circuit as well.

### **3.12 I2C and QWIIC Expansion** {.section-page}

J6 extends the same I2C bus as J4; it is not a separate controller or an
I2S connection. Devices attached to J6 share the bus pull-ups and address
space. J6 also carries the module VCC input net, not the regulated 3V3 net.
Check the attached device's supply and logic compatibility before connecting it.

### **3.13 Combined System Operation** {.section-page}

A host configures the ES8311 by I2C, supplies suitable clocks, then transfers
digital audio over the serial port. The host separately controls PA_CTRL when
using the speaker amplifier.
